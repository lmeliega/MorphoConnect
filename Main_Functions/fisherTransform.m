function [z,s,p,Zscore] = fisherTransform(C,N,k)

% This function find the fisher transform for correlation measure. It converts from partial correlation
% values to z values. For the case of the pearson correlation set k = 1.
% For partial correlation k = N-2; where N is the number of nodes or number of rows of the connectivity matrix.
%
% Input Parameter:
%      C :  Connectivity Matrix
%      k :  Number of parameters the partial correlation depends on.
%      N :  Number of data used to compute the correlation measure.
%
% Output Parameters:
%       z : Fisher transform.   
%       s : standard deviation of the fisher transform value. 
%       p : pvalue of the correlation measure.
%  Zscore : Z-score.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 6th, 2010
% Modified: January 11th, 2013

Nv = size(C,1);
C1 = C(:,:,1);
Is_symmetric = not(logical(sum(sum(C1~=C1'))));
lowerhalf = (tril(ones(Nv),-1)>0);

if Is_symmetric
    ind = lowerhalf;
else
    upperhalf = (triu(ones(Nv), 1)>0);
    ind = lowerhalf | upperhalf;
end;
Nr = size(C,3);
ind = repmat(ind,[1,1,Nr]);
z = zeros(size(C));
z(ind) = 0.5*log((1+C(ind))./(1-C(ind)));
s = 1./sqrt(N-2-k);
Zscore = z./s;  % Z-score
Zp = Zscore;
ind1 = abs(Zp)==Inf;
Zp(ind1) = sign(Zp(ind1)).*realmax;
p = 2*normcdf(-sign(Zp).*Zp);

if Is_symmetric
    for i=1:Nr
        z(:,:,i) = z(:,:,i) + z(:,:,i)';
        p(:,:,i) = p(:,:,i) + p(:,:,i)';
        Zscore(:,:,i) = Zscore(:,:,i) + Zscore(:,:,i)';
    end;
end;

return;