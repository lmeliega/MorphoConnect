function [R,pval,Rmaxthres] = pearson_correlation(D,Nboot)

% This function calculates the pearson correlation with pvalues calculated using permutations..
%
%  Input parameter:
%        D : Data Matrix. size(D) = number of subjects x number of structures.
% 
%   
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 20th, 2009

[Ns,p] = size(D);
percent = 95;
lowerhalf = (tril(ones(p),-1)>0);
pval = zeros(p,p);
R = corrcoef(D);
R = R - diag(diag(R));

if Nboot~=1
    Rmax = zeros(Nboot,1);
    Rboot = zeros(p*(p-1)/2,Nboot);
    H = waitbar(0,'Doing bootstrap processing ... ','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNboot = num2str(Nboot);
    for k=1:Nboot
        waitbar(k/Nboot,H, ['Doing bootstrap processing ... ' num2str(k) ' of ' StringNboot]);
        ind = zeros(Ns,p);
        for i=1:p
            ind(:,i) = randsample(Ns,Ns);
        end;
        RbootT = corrcoef(D(ind));
        RbootT = RbootT - diag(diag(RbootT));
        Rmax(k) = max(RbootT(:));
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
  
return;