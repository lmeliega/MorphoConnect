function [ pcntvar, U, V ] = SurfStatPCA( Y, mask, X, k );

%Principal Components Analysis (PCA).
%
% Usage: [ pcntvar, U, V ] = SurfStatPCA( Y [,mask [,X [,k] ] ] );
%
% Y    = n x v matrix of surface data, v=#vertices.
% mask = 1 x v vector, 1=inside, 0=outside, default is ones(1,v),  
%        i.e. the whole surface.
% X    = model formula of type term, or scalar, or n x p design matrix of 
%        p covariates for the linear model. The PCA is done on the v x v 
%        correlations of the residuals and the components are standardized 
%        to have unit standard deviation about zero. If X=0, nothing is       
%        removed. If X=1, the mean (over rows) is removed (default).
% k    = number of components in PCA, default 4.
%
% pcntvar = 1 x k vector of percent variance explained by the components.
% U       = n x k matrix of components for the rows (observations).
% V       = k x v matrix of components for the columns (vertices).

[n,v]=size(Y);
if nargin<2 | isempty(mask)
    mask=ones(1,v);
end
if nargin<3 | isempty(X)
    X=1;
end
if nargin<4
    k=4;
end

if isa(X,'term')
    X=double(X);
elseif size(X,1)>1 & size(X,2)==1
    warning('If you don''t convert vectors to terms it can give unexpected results :-(') 
end
if size(X,1)==1
    X=repmat(X,n,1);
end
df=n-rank(X);

Y=double(Y(:,find(mask)));
if any(X(:)~=0)
    Y=Y-X*(pinv(X)*Y);
end
S=sum(Y.^2,1);
Smhalf=(S>0)./sqrt(S+(S<=0));
for i=1:n
    Y(i,:)=Y(i,:).*Smhalf;
end
A=Y*Y';
[U, D]=eig(A);
[ds,is]=sort(-diag(D));
ds=-ds;
pcntvar=ds(1:k)'/sum(ds)*100;

U=U(:,is(1:k));
V=zeros(k,v);
V(:,find(mask))=U'*Y;
s=sign(abs(max(V,[],2))-abs(min(V,[],2)));
sv=sqrt(mean(V.^2,2));
V=diag(s./(sv+(sv<=0)).*(sv>0))*V;
U=U*diag(s*sqrt(df));

return
end

