function qval = SurfStatQ( slm, mask );

%Q-values (False Discovey Rate).
%
% Usage: qval = SurfStatQ( slm [, mask] );
%
% slm.t           = 1 x v vector of test statistics, v=#vertices.
% slm.df          = degrees of freedom.
% slm.dfs         = 1 x v vector of optional effective degrees of freedom.
% slm.k           = #variates.
% mask            = 1 x v, 1=inside, 0=outside, 
%                 = ones(1,v), i.e. the whole surface, by default.
%
% qval.Q          = 1 x v vector of Q-values.
% qval.mask       = copy of mask.

df=zeros(2);
ndf=length(slm.df);
df(1,1:ndf)=slm.df;
df(2,1:2)=slm.df(ndf);
if isfield(slm,'dfs')
    df(1,ndf)=mean(slm.dfs(mask>0));
end

[l,v]=size(slm.t);
if nargin<2
    mask=logical(ones(1,v));
end

P_val=stat_threshold(0,1,0,df,[10 slm.t(1,find(mask))],[],[],[],slm.k,[],[],0);
P_val=P_val(2:length(P_val));
np=length(P_val);
[P_sort, index]=sort(P_val);
P_sort=P_sort./(1:np)*np;
m=1;
Q_sort=zeros(1,np);
for i=np:-1:1
    if P_sort(i)<m
        m=P_sort(i);
    end
    Q_sort(i)=m;
end
Q=zeros(1,np);
Q(index)=Q_sort;
qval.Q=ones(1,size(mask,2));
qval.Q(find(mask))=Q;
qval.mask=mask;

return
end

