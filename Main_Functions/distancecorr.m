function r = distancecorr(X,Y)

% This function calculates the distance correlation between variables X and Y.
%
% Input parameters:
%    X,Y : data vectors of the same length.
%    
% Output parameters:
%    r :  distance correlation coefficient.
%
% References:
%
% [1] GÁBOR J. SZÉKELY,1 MARIA L. RIZZO AND NAIL K. BAKIROV. MEASURING AND TESTING DEPENDENCE BY CORRELATION OF DISTANCES.
%     The Annals of Statistics 2007, Vol. 35, No. 6, 2769–2794

% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, September 3rd, 2010

N = size(X,1); % Number of observations.

% For X variable
d = pdist(X,'euclidean');
D = squareform(d);
at = mean(D,1);
[ak_hat,al_hat] = meshgrid(at,at);
asum = (1/N^2)*sum(D(:)); 
A = D - ak_hat - al_hat + asum;

% For Y variable
d = pdist(Y,'euclidean');
D = squareform(d);
at = mean(D,1);
[ak_hat,al_hat] = meshgrid(at,at);
asum = (1/N^2)*sum(D(:)); 
B = D - ak_hat - al_hat + asum;

VXY2 = (1/N^2)*sum(A(:).*B(:));
VX2 = (1/N^2)*sum(A(:).^2);
VY2 = (1/N^2)*sum(B(:).^2);

if (VX2*VY2~=0)
    r2 = VXY2/sqrt(VX2*VY2);
    r = sqrt(r2);
else
    r = 0;
end;

return;


