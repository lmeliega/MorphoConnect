function [r,p] = distancecorr_temp(X,Y,Nboot)

% This function calculates the distance correlation between variables X and Y.
%
% Input parameters:
%    X,Y : data vectors of the same length.
%    Nboot : Number of permutation for computing the p-value.
%    
% Output parameters:
%    r :  distance correlation coefficient.
%    p :  pvalue of the correlation coefficient.
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
AA = A(:);

% For Y variable
d = pdist(Y,'euclidean');
D = squareform(d);
at = mean(D,1);
[ak_hat,al_hat] = meshgrid(at,at);
asum = (1/N^2)*sum(D(:)); 
B = D - ak_hat - al_hat + asum;
BB = B(:);

VXY2 = AA'*BB;
VX2 =  AA'*AA;
VY2 =  BB'*BB;
% VXY2 = (1/N^2)*sum(A(:).*B(:));
% VX2 = (1/N^2)*sum(A(:).^2);
% VY2 = (1/N^2)*sum(B(:).^2);

if (VX2*VY2~=0)
    r = sqrt(VXY2/sqrt(VX2*VY2));
    %r2 = VXY2/sqrt(VX2*VY2);
    %r = sqrt(r2);
else
    r = 0;
end;

if Nboot~=1
    VXY2 = zeros(Nboot,1);
    VX2 = zeros(Nboot,1);
    VY2 = zeros(Nboot,1);
    for i=1:Nboot
        inda = randsample(N,N);        
        indb = randsample(N,N);
        AA = A(inda,inda); AA = AA(:);
        BB = B(indb,indb); BB = BB(:);
        VXY2(i) = sum(AA'*BB);
        VX2(i) = sum(AA'*AA);
        VY2(i) = sum(BB'*BB);
    end;
    rboot = sqrt(VXY2./sqrt(VX2.*VY2));
    p = sum(r<rboot)./Nboot;
else
    p = NaN;
end;

return;


