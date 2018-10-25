function [R,pval] = distancecorrM_temp(X,Nboot)

% This function calculates the distance correlation between two variables.
%
% Input Parameters:
%     X : Matrix of dimension n x m x p; n : number of vector samples(repetitions); m : number of sites; p :  vector size
%     Nboot : Number of bootstrap for calculating general threshold.
%
% Output Parameters:
%     R : Matrix of the Vector correlation between 'm' sites.
%    pval : Matrix of probability of the null Hypothesis of R(i,j) = 0 using permutation approach.
%
% References:
%
% [1] GÁBOR J. SZÉKELY,1 MARIA L. RIZZO AND NAIL K. BAKIROV. MEASURING AND TESTING DEPENDENCE BY CORRELATION OF DISTANCES.
%     The Annals of Statistics 2007, Vol. 35, No. 6, 2769–2794
%
% Lester Melie-Garcia
% Cuban Neuroscience Center
% Havana, September 3rd, 2010

[n,p,m] = size(X);
X = permute(X,[1 3 2]);
R = zeros(p,p);
pval = zeros(p,p);
H = waitbar(0,'Computing Distance Correlation Matrix ...','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
StringNboot = num2str(p);
for i=1:p
    waitbar(i/Nboot,H, ['Computing Distance Correlation Matrix ... ' num2str(i) ' of ' StringNboot]);
    tic;
    for j=i+1:p        
        [R(i,j),pval(i,j)] = distancecorr_temp(X(:,:,i),X(:,:,j),Nboot); % X(:,:,i) : variables for the site 'i' ; X(:,:,j) : variables for the site 'j'
    end;
    toc;
end;
R = R + R';
pval = pval + pval';
close(H);

% This is for finding the partial correlation.
% i = 1:p;
% inddiag = (i-1)*p + i;
% R(inddiag) = 1;
% 
% invCorrM = pinv(R);
% diagC = diag(invCorrM);
% CoR = sqrt(diagC*diagC');
% R = -invCorrM./CoR;

return;