function y = myprctile(x,p)
% MYPRCTILE Percentiles of a sample.
%
%   Percentiles are specified using percentages, from 0 to 100.  For an N
%   element vector X, PRCTILE computes percentiles as follows:
%      1) The sorted values in X are taken as the 100*(0.5/N), 100*(1.5/N),
%         ..., 100*((N-0.5)/N) percentiles.
%      2) Linear interpolation is used to compute percentiles for percent
%         values between 100*(0.5/N) and 100*((N-0.5)/N)
%      3) The minimum or maximum values in X are assigned to percentiles
%         for percent values outside that range.
%
%
%   Example:
%      y = prctile(x,50); % the median of x
%
%   % Copyright 1993-2004 The MathWorks, Inc.
%   $Revision: 2.12.4.5 $  $Date: 2004/06/25 18:52:56 $
% 
%  Important: This function is a modification (for a vector case) of the Matlab
%  'prctile' function.
%  Modified by: Lester Melie Garcia
%  Cuban Neuroscience Center
%  May 25th, 2008.

n = length(x);
x = sort(x);

q = [0 100*(0.5:(n-0.5))./n 100]';
xx = [x(1,:); x(1:n,:); x(n,:)];
y = interp1q(q,xx,p(:));

return;

