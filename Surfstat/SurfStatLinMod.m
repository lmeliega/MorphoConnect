function slm = SurfStatLinMod( Y, M, surf, niter, thetalim, drlim );

%Fits linear mixed effects models to surface data and estimates resels.
%
% Usage: slm = SurfStatLinMod( Y, M [,surf [,niter [,thetalim [,drlim]]]]);
%
% Y         = n x v or n x v x k matrix of surface data, v=#vertices;
%             n=#observations; k=#variates.
% M         = model formula of class term or random; or scalar or
%             n x p design matrix of p regressors for the linear model.
% surf.tri  = 3 x t matrix of triangle indices, 1-based, t=#triangles.
% The following arguments are not usually used:
% niter     = number of extra iterations of the Fisher scoring algorithm
%             for fitting mixed effects models. Default 1.
% thetalim  = lower limit on variance coefficients, in sd's. Default 0.01.
% drlim     = step of ratio of variance coefficients, in sd's. Default 0.1. 
%
% slm.X    = n x p design matrix.
% slm.V    = n x n x q variance matrix bases, normalised so that
%            mean(diag(slm.V))=1. Absent if q=1 and slm.V=eye(n).
% slm.df   = degrees of freedom = n-rank(X).
% slm.coef = p x v x k matrix of coefficients of the linear model.
% slm.SSE  = k*(k+1)/2 x v matrix of sum of squares of errors
%            whitened by slm.V*slm.r.
% slm.r    = (q-1) x v matrix of coefficients of the first (q-1)
%            components of slm.V divided by their sum. 
%            Coefficients are clamped to a minimum of 0.01 x sd.
% slm.dr   = (q-1) x 1 vector of increments in slm.r = 0.1 x sd.
% If surf is not empty, returns:
% slm.reselsptri  = 1 x t vector of resels per triangle, t=#triangles.
% slm.reselspedge = 3 x t matrix of resels per edge.
% slm.reselspvert = 1 x v vector of resels per vertex.  
% slm.tri         = 3 x t matrix of triangle indices, 1-based.
%
% Reference: Worsley, K.J., Andermann, M., Koulis, T., MacDonald, D. 
% & Evans, A.C. (1999). Detecting changes in nonisotropic images.
% Human Brain Mapping, 8:98-101.

if nargin<4 | isempty(niter)
    niter=1;
end
if nargin<5 | isempty(thetalim)
    thetalim=0.01;
end
if nargin<6 
    drlim=0.1;
end

if ndims(Y)==2
    [n,v]=size(Y);
    k=1;
else
    [n,v,k]=size(Y);
end

if isa(M,'random')
    [slm.X,V]=double(M);
    [n2 q]=size(V);
    II=reshape(eye(n),n^2,1);
    r=II-V*(pinv(V)*II);
    if mean(r.^2)>eps
        warning('Did you forget an error term, I? :-)');
    end
    if q>1 | ((q==1) & sum(abs(II-V))>0)
        slm.V=reshape(V,[n n q]);
    end
    clear V II r;
else
    q=1;
    if isa(M,'term')
        slm.X=double(M);
    else
        if prod(size(M))>1
            warning('If you don''t convert vectors to terms you can get unexpected results :-(')
        end
        slm.X=M;
    end
    if size(slm.X,1)==1
        slm.X=repmat(slm.X,n,1);
    end
end

pinvX=pinv(slm.X);
r=ones(n,1)-slm.X*(pinvX*ones(n,1));
if mean(r.^2)>eps
    warning('Did you forget a constant term? :-)');
end

p=size(slm.X,2);
slm.df=n-rank(slm.X);
Y=double(Y);

if k==1 
    if q==1
%% fixed effects
        if ~isfield(slm,'V')
            slm.coef=pinvX*Y;
            Y=Y-slm.X*slm.coef;
        else
            slm.V=slm.V/mean(diag(slm.V));
            Vmh=inv(chol(slm.V)');
            slm.coef=(pinv(Vmh*slm.X)*Vmh)*Y;
            Y=Vmh*Y-(Vmh*slm.X)*slm.coef;
        end
        slm.SSE=sum(Y.^2);
    else
%% mixed effects
        q1=q-1;
        for j=1:q
            slm.V(:,:,j)=slm.V(:,:,j)/mean(diag(slm.V(:,:,j)));;
        end

        slm.coef=zeros(p,v);
        slm.SSE=zeros(1,v);

        %% start Fisher scoring algorithm
        E=zeros(q,v);
        RVV=zeros([n n q]);
        R=eye(n)-slm.X*pinv(slm.X);
        for j=1:q
            RV=R*slm.V(:,:,j);
            E(j,:)=sum(Y.*((RV*R)*Y));
            RVV(:,:,j)=RV;
        end
        M=zeros(q);
        for j1=1:q
            for j2=j1:q
                M(j1,j2)=sum(sum(RVV(:,:,j1).*(RVV(:,:,j2)')));
                M(j2,j1)=M(j1,j2);
            end
        end
        theta=pinv(M)*E;
        
        tlim=sqrt(2*diag(pinv(M)))*sum(theta)*thetalim;
        theta=theta.*(theta>=tlim)+tlim.*(theta<tlim);
        slm.r=theta(1:q1,:)./repmat(sum(theta),q1,1);
        
        Vt=2*pinv(M);
        m1=diag(Vt);
        m2=2*sum(Vt)';
        Vr=m1(1:q1)-m2(1:q1).*mean(slm.r,2)+sum(Vt(:))*mean(slm.r.^2,2);
        slm.dr=sqrt(Vr)*drlim;

        %% Exrtra Fisher scoring iterations
        for iter=1:niter
            irs=round(slm.r.*repmat(1./slm.dr,1,v));
            [ur,ir,jr]=unique(irs','rows');
            nr=size(ur,1);
            for ir=1:nr
                iv=(jr==ir);
                rv=mean(slm.r(:,iv),2);
                V=(1-sum(rv))*slm.V(:,:,q);
                for j=1:q1
                    V=V+rv(j)*slm.V(:,:,j);
                end
                Vinv=inv(V);
                VinvX=Vinv*slm.X;
                G=pinv(slm.X'*VinvX)*(VinvX');
                R=Vinv-VinvX*G;
                E=zeros(q,sum(iv));
                for j=1:q
                    RV=R*slm.V(:,:,j);
                    E(j,:)=sum(Y(:,iv).*((RV*R)*Y(:,iv)));
                    RVV(:,:,j)=RV;
                end
                for j1=1:q
                    for j2=j1:q
                        M(j1,j2)=sum(sum(RVV(:,:,j1).*(RVV(:,:,j2)')));
                        M(j2,j1)=M(j1,j2);
                    end
                end
                thetav=pinv(M)*E;
                tlim=sqrt(2*diag(pinv(M)))*sum(thetav)*thetalim;
                theta(:,iv)=thetav.*(thetav>=tlim)+tlim.*(thetav<tlim);
            end
            slm.r=theta(1:q1,:)./(ones(q1,1)*sum(theta));
        end

        %% finish Fisher scoring
        irs=round(slm.r.*repmat(1./slm.dr,1,v));
        [ur,ir,jr]=unique(irs','rows');
        nr=size(ur,1);
        for ir=1:nr
            iv=(jr==ir);
            rv=mean(slm.r(:,iv),2);
            V=(1-sum(rv))*slm.V(:,:,q);
            for j=1:q1
                V=V+rv(j)*slm.V(:,:,j);
            end
            Vmh=inv(chol(V)');
            VmhX=Vmh*slm.X;
            G=pinv(VmhX'*VmhX)*(VmhX')*Vmh;
            slm.coef(:,iv)=G*Y(:,iv);
            R=Vmh-VmhX*G;
            Y(:,iv)=R*Y(:,iv);
            slm.SSE(iv)=sum(Y(:,iv).^2);
        end
    end    
else
%% multivariate
    if q>1
        error('Multivariate mixed effects models not yet implemented :-(');
        return
    end
    
    if ~isfield(slm,'V')
        X=slm.X;
    else
        slm.V=slm.V/mean(diag(slm.V));
        Vmh=inv(chol(slm.V))';
        X=Vmh*slm.X;
        pinvX=pinv(X);
        for j=1:k
            Y(:,:,j)=Vmh*Y(:,:,j);
        end
    end
            
    slm.coef=zeros(p,v,k);
    for j=1:k
        slm.coef(:,:,j)=pinvX*Y(:,:,j);
        Y(:,:,j)=Y(:,:,j)-X*slm.coef(:,:,j);
    end
    k2=k*(k+1)/2;
    slm.SSE=zeros(k2,v);
    j=0;
    for j1=1:k
        for j2=1:j1
            j=j+1;
            slm.SSE(j,:)=sum(Y(:,:,j1).*Y(:,:,j2));
        end
    end
end

%% resels
if nargin<3 | isempty(surf)
    return
end
% find 'area' of triangles with normalised reisdual coordinates:
ntris=size(surf.tri,2);
slm.reselsptri=zeros(1,ntris);
slm.reselspedge=zeros(3,ntris);
for j=1:k
    jj=j*(j+1)/2;
    normr=sqrt(slm.SSE(jj,:));
    m11=zeros(1,ntris);
    m22=zeros(1,ntris);
    m12=zeros(1,ntris);
    m33=zeros(1,ntris);
    for i=1:n
        u=Y(i,:,j)./normr;
        u1=u(surf.tri(1,:));
        d1=u(surf.tri(2,:))-u1;
        d2=u(surf.tri(3,:))-u1;
        m11=m11+d1.^2;
        m22=m22+d2.^2;
        m12=m12+d1.*d2;
        m33=m33+(d1-d2).^2;
    end
    slm.reselsptri=slm.reselsptri+m11.*m22-m12.^2;
    slm.reselspedge=slm.reselspedge+[m11; m33; m22];
end
slm.reselsptri=sqrt(slm.reselsptri.*(slm.reselsptri>=0)/k)/2/(4*log(2));
slm.reselspedge=sqrt(slm.reselspedge/k)/sqrt(4*log(2));

% 'spread' the triangle 'areas' around its 3 vertices:
slm.reselspvert=zeros(1,v);
for j=1:3
    slm.reselspvert=slm.reselspvert+accumarray(surf.tri(j,:)',slm.reselsptri',[v 1])';
end
slm.reselspvert=slm.reselspvert/3;
slm.tri=surf.tri;

return
end