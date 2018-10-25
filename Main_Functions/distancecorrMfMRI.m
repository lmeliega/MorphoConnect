function [R,pval,Rmax,Rmaxthres] = distancecorrMfMRI(X,Nboot,percent)

% This function calculates the distance correlation between two variables.
%
% Input Parameters:
%     X : Struct with the fMRI time series.
%     Nboot : Number of bootstrap for calculating general threshold.
%
% Output Parameters:
%     R : Matrix of the Vector correlation between 'm' sites.
%    pval : Matrix of probability of the null Hypothesis of R(i,j) = 0 using permutation approach.
%    Rmax : Matrix of maximum value of correlation.  
%   Rmaxthres : Threshold of the distribution of maximum for multiple tests correction.
%
% References:
%
% [1] GÁBOR J. SZÉKELY,1 MARIA L. RIZZO AND NAIL K. BAKIROV. MEASURING AND TESTING DEPENDENCE BY CORRELATION OF DISTANCES.
%     The Annals of Statistics 2007, Vol. 35, No. 6, 2769–2794
%
% Lester Melie-Garcia
% Cuban Neuroscience Center
% Havana, September 3rd, 2010

if nargin<3
   percent = 95;
end;

p = length(X);
n = size(X(1).Data,1);
R = zeros(p,p);
pval = zeros(p,p);
lowerhalf = (tril(ones(p),-1)>0);
H = waitbar(0,'Calculating Connectivity Matrix  ... ','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
StringNt = num2str(p);
for i=1:p
    waitbar(i/p,H, ['Calculating Connectivity Matrix  ...' num2str(i) ' of ' StringNt]);   
    for j=i+1:p
        R(i,j) = distancecorr(X(i).Data,X(j).Data); % X(i).Data : variables for the site 'i' ; X(j).Data : variables for the site 'j'
    end;
end;
close(H);
R = R + R';
if Nboot~=1
    Rmax = zeros(Nboot,1);
    Rboot = zeros(p*(p-1)/2,Nboot);
    H = waitbar(0,'Doing permutation process ... ','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNboot = num2str(Nboot);
    for k=1:Nboot
        waitbar(k/Nboot,H, ['Doing permutation process ... ' num2str(k) ' of ' StringNboot]);
        RbootT = zeros(p,p);
        inda = randsample(n,n);
        indb = randsample(n,n);
        for i=1:p
            for j=i+1:p
                RbootT(i,j) = distancecorr(X(i).Data(inda,:),X(j).Data(indb,:)); % X(:,:,i) : variables for the site 'i' ; X(:,:,j) : variables for the site 'j'
            end;
        end;
        Rmax(k) = max(RbootT(:));
        RbootT = RbootT';
        Rboot(:,k) = RbootT(lowerhalf);
    end;
    dm = R(lowerhalf);
    dm = repmat(dm,[1,Nboot]);
    pT = sum(dm>Rboot,2)./Nboot;
    pval(lowerhalf) = 1-pT;
    pval = pval + pval';
    Rmaxthres = prctile(Rmax,percent);
    close(H);
else
    Rmax = 0;
    Rmaxthres = 0;
    pval = 0;
end;

%Rmax = Rmax + Rmax';
%pval = pval + pval'; % The significant of this should be calculated.

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