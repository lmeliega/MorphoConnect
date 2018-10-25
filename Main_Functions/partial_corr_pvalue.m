function p = partial_corr_pvalue(C,nv)

% This function computes the pvalues for the partial correlation matrix.
% Input Parameters:
%
%   C : values of partial correlation.
%  nv : number of data used for computing the partial correlation.
%
% Output Parameters:
%       p : p-value matrix of the association matrix.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 16th, 2010

N = size(C,1);
Is_symmetric = not(logical(sum(sum(C~=C'))));
lowerhalf = (tril(ones(N),-1)>0);

if Is_symmetric
    ind = lowerhalf;
else
    upperhalf = (triu(ones(N), 1)>0);
    ind = lowerhalf | upperhalf;
end;

rv = C(ind);
k = N-2;
Tstat = rv .* sqrt((nv-2-k)./(1 - rv.^2));
p = zeros(N,class(C));
p(lowerhalf) = 2*tpvalue(-abs(Tstat),nv-2-k);
p = p + p';

return;