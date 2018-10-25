function [C,p] = partial_correlation_covariance(D)

% This function calculates the partial correlation.
%
%  Input parameter:
%        D : Data Matrix. size(D) = number of subjects x number of structures.
% 
%   
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 20th, 2009

C = cov(D);
invCorrM = pinv(C);
diagC = diag(invCorrM);
CoR = sqrt(diagC*diagC');
C = -invCorrM./CoR;
C = (C + C')/2; C = C-diag(diag(C));
% % Calculating significance of the partial correlation values.
[nv,N] = size(D);
lowerhalf = (tril(ones(N),-1)>0);
rv = C(lowerhalf);
k = N-2;
Tstat = rv .* sqrt((nv-2-k)./(1 - rv.^2));
p = zeros(N,class(C));
p(lowerhalf) = 2*tpvalue(-abs(Tstat),nv-2-k);
p = p + p';
   
return;