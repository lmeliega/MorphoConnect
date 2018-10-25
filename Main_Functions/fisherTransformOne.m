function [z,s,p,Zscore] = fisherTransformOne(C,N,k)

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

z = 0.5*log((1+C)./(1-C));
s = 1./sqrt(N-2-k);
Zscore = z./s;  % Z-score
Zp = Zscore;
ind1 = abs(Zp)==Inf;
Zp(ind1) = sign(Zp(ind1)).*realmax;
p = 2*normcdf(-sign(Zp).*Zp);

end