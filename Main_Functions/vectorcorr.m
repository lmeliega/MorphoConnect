function r = vectorcorr(X,Y)

% This function calculates the vector correlation.
%
% Input Parameters:
%     X : Matrix of dimension n x m; n : number of vector samples; m :  vector size
%     Y : Matrix of dimension p x q; p : number of vector samples; q :  vector size
%
% Output Parameters:
%     r : Vector correlation.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 12th, 2008

[n,m] = size(X);
Sigma = cov([X,Y],1);
SigmaXX = Sigma(1:m,1:m);
SigmaYY = Sigma(m+1:end,m+1:end);
SigmaXY = Sigma(m+1:end,1:m);
SigmaYX = Sigma(1:m,m+1:end);

r2 = (1/m)*trace(pinv(SigmaXX)*SigmaXY*pinv(SigmaYY)*SigmaYX); % 

r = sqrt(r2);

return;