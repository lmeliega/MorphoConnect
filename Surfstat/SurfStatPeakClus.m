function [ peak, clus, clusid ] = SurfStatPeakClus( slm, mask, thresh );

%Finds peaks (local maxima) and clusters for surface data.
% 
% Usage: [ peak, clus, clusid ] = SurfStatPeakClus( slm, mask, thresh );
%
% slm.t           = l x v matrix of data, v=#vertices; the first row
%                   slm.t(1,:) is used for the clusters, and the other 
%                   rows are used to calculate cluster resels if k>1. See
%                   SurfStatF for the precise definition of the extra rows.
% slm.tri         = 3 x t matrix of triangle indices, 1-based, t=#triangles
% mask            = 1 x v vector, 1=inside, 0=outside, v=#vertices.
% thresh          = clusters are vertices where slm.t(1,mask)>=thresh.
% The following are optional:
% slm.reselspvert = 1 x v vector of resels per vertex, default ones(1,v).  
% slm.df          = degrees of freedom - only the length (1 or 2) is used
%                   to determine if slm.t is Hotelling's T or T^2 when k>1.
% slm.k           = k=#variates, 1 by default.
%
% peak.t      = np x 1 vector of peaks (local maxima).
% peak.vertid = np x 1 vector of vertex id's (1-based).
% peak.clusid = np x 1 vector of cluster id's that contain the peak.
% clus.clusid = nc x 1 vector of cluster id numbers
% clus.nverts = nc x 1 vector of number of vertices in the cluster.
% clus.resels = nc x 1 vector of resels in the cluster.
% clusid      =  1 x v vector of cluster id's for each vertex.

[l,v]=size(slm.t);

slm.t(1,~mask)=min(slm.t(1,:));

a=[2 3 1];
b=[3 1 2];
islm=ones(1,v);
for j=1:3
    islm(slm.tri(j,find(slm.t(1,slm.tri(j,:))<slm.t(1,slm.tri(a(j),:)) ...
        | slm.t(1,slm.tri(j,:))<slm.t(1,slm.tri(b(j),:)))))=0;
end
lmvox=find(islm);
lmt=slm.t(1,lmvox);

excurset=(slm.t(1,:)>=thresh);
n=sum(excurset);
voxid=cumsum(excurset);

% find edges
edge1=[];
edge2=[];
for j=1:3
    edge=find(excurset(slm.tri(j,:)) & excurset(slm.tri(a(j),:)));
    edge1=[edge1 voxid(slm.tri(j,edge))];
    edge2=[edge2 voxid(slm.tri(a(j),edge))];
end
[u,i]=unique([min(edge1,edge2); max(edge1,edge2)]','rows');
edge1=edge1(i);
edge2=edge2(i);

if n<1
   peak=[];
   clus=[];
   clusid=[];
   return
end

% Find cluster id's in nf (from Numerical Recipes in C, page 346):
nf=1:n;
for el=1:length(edge1)
    j=edge1(el);
    k=edge2(el);
    while nf(j)~=j j=nf(j); end
    while nf(k)~=k k=nf(k); end
    if j~=k nf(j)=k; end
end
for j=1:n
    while nf(j)~=nf(nf(j)) nf(j)=nf(nf(j)); end
end

% find the unique cluster id's corresponding to the local maxima:
vox=find(excurset);
ivox=find(ismember(vox,lmvox));
clmid=nf(ivox);
[uclmid,iclmid,jclmid]=unique(clmid);

% find their volumes:
ucid=unique(nf);
nclus=length(ucid);
ucvol=histc(nf,ucid); 

% find their resels:
if isfield(slm,'reselspvert')
    reselsvox=slm.reselspvert(vox);
else
    reselsvox=ones(size(vox));
end
nf1=interp1([0 ucid],0:nclus,nf,'nearest');

% if k>1, find volume of cluster in added sphere:
if ~isfield(slm,'k') | slm.k==1
    ucrsl=accumarray(nf1',reselsvox)';
end
if isfield(slm,'k') & slm.k==2
    if l==1
        ndf=length(slm.df);
        r=2*acos((thresh./slm.t(1,vox)).^(1/ndf));
    else
        r=2*acos(sqrt((thresh-slm.t(2,vox)).*(thresh>=slm.t(2,vox))./ ...
            (slm.t(1,vox)-slm.t(2,vox))));
    end
    ucrsl=accumarray(nf1',r'.*reselsvox')';
end
if isfield(slm,'k') & slm.k==3
    if l==1
        ndf=length(slm.df);
        r=2*pi*(1-(thresh./slm.t(1,vox)).^(1/ndf));
    else
        nt=20;
        theta=((1:nt)'-1/2)/nt*pi/2;
        s=(cos(theta).^2)*slm.t(2,vox);
        if l==3
            s=s+(sin(theta).^2)*slm.t(3,vox);
        end
        r=2*pi*mean(1-sqrt((thresh-s).*(thresh>=s)./ ...
            (ones(nt,1)*slm.t(1,vox)-s)));
    end
    ucrsl=accumarray(nf1',r'.*reselsvox')';
end

% and their ranks (in ascending order):
[sortucrsl,iucrsl]=sort(ucrsl);
rankrsl=zeros(1,nclus);
rankrsl(iucrsl)=nclus:-1:1;

% add these to lm as extra columns:
f=find(ismember(lmvox,vox));
lmid=lmvox(f);
lm=flipud(sortrows([slm.t(1,lmid)' lmid' rankrsl(jclmid)'],1));
cl=sortrows([rankrsl' ucvol' ucrsl'],1);

clusid=zeros(1,v);
clusid(vox)=interp1([0 ucid],[0 rankrsl],nf,'nearest');

peak.t=lm(:,1);
peak.vertid=lm(:,2);
peak.clusid=lm(:,3);
clus.clusid=cl(:,1);
clus.nverts=cl(:,2);
clus.resels=cl(:,3);

return
end


