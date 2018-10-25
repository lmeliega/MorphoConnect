function [IsSym,ind] = Issymetric(X)

% This function test if the matrix is symmetric.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 22nd, 2010

Nrep = size(X,3);
Nv = size(X,1);
ind = false(Nv,Nv,Nrep); 

IsSym_t = zeros(Nrep,1);
for i=1:Nrep
    X1 = X(:,:,i);
    IsSym_t(i) = not(logical(sum(sum(X1~=X1'))));
    lowerhalf = logical(tril(ones(Nv),-1)>0);    
    if IsSym_t(i)
        ind(:,:,i) = lowerhalf;
    else
        upperhalf = (triu(ones(Nv), 1)>0);
        ind(:,:,i) = lowerhalf | upperhalf;
    end;
end;
IsSym = logical(prod(IsSym_t));
ind = squeeze(ind);

return;