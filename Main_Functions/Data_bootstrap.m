function [X1r,X2r] = Data_bootstrap(X1,X2,N,isR,Ns1,Ns2)

% This functions permutes randomly rows between two data sets.
%  Input Parameters
%      X1,X2 : Datasets. They must have same size.
%      N : Number of permutations.
%      Ns1,Ns2 : Number of elements used in the resampling process. 
%      isR : logical variable to set if the bootstraping process will be
%            with replacement. isR = true: with replacement, isR = false : with no replacement
%
%  Output Parameters
%     X1, X2 : Permuted datasets. size(X1) = [r1,c1,N]  
%   
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% July 30th, 2011.

[N1,M1] = size(X1);
[N2,M2] = size(X2);

if exist('isR','var')
    if isempty(isR)
        isR = true;
    end;
else
    isR = true;
end;
if exist('Ns1','var')
    if isempty(Ns1)
        Ns1 = N1;
    end;
else
    Ns1 = N1;
end;
if exist('Ns2','var')
    if isempty(Ns2)
        Ns2 = N2;
    end;
else
    Ns2 = N2;
end;

X1r = zeros(Ns1,M1,N);
if N2>0
    X2r = zeros(Ns2,M2,N);
end;
if N2>0    
    for i=1:N
        ind = randsample(N1,Ns1,isR); % Sampling with replacement dataset 1.
        X1r(:,:,i) = X1(ind,:);
        ind = randsample(N2,Ns2,isR); % Sampling with replacement dataset 2.
        X2r(:,:,i) = X2(ind,:);
    end;
    X1r = squeeze(X1r);
    X2r = squeeze(X2r);
else
    for i=1:N
        ind = randsample(N1,Ns1,isR); % Sampling with replacement dataset 1.
        X1r(:,:,i) = X1(ind,:);
    end;
    X1r = squeeze(X1r);
end;

return;