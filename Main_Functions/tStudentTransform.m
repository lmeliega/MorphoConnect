function [t,p] = tStudentTransform(r,N,k)

% This function find the t transform. It converts from correlation
% values to t values.
%   N : Number of data for calculating correlation coefficient.
%   k : 
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 6th, 2010
%
% OJO : No esta terminada....

ind = r~=0;
t = r.*sqrt((N-2-k)./(1-r.^2));

p = 2*normcdf(-sign(z).*z);

return;