function [X1,X2] = Data_permutation01(X1,X2,N,isDependent)

% This functions permutes randomly rows between two data sets.
%  Input Parameters
%      X1,X2 : Datasets. They must have same size.
%      N : Number of permutations.
%     isDependent : Set if permutations will be for dependent sample or not.
%
%  Output Parameters
%     X1, X2 : Permuted datasets. size(X1) = [r1,c1,N]  
%   
% Lester Melie Garcia
% LREN, CHUV, Lausanne
% January 24th, 2017

if ~exist('isDependent','var')
    isDependent = false;
end;

Nrep1 = size(X1,1);
Nrep2 = size(X2,1);
Nt = Nrep1 + Nrep2;

X1r = X1;
X2r = X2;
Xr = [X1r;X2r];  % the number of rows in X1 and X2 should be equal.
X1 = repmat(X1,[1,1,N]);
X2 = repmat(X2,[1,1,N]);

if isDependent
    for i=1:N
        which_s = unidrnd(Nrep1);
        tr = randsample(Nrep1,which_s);
        pflag = zeros(Nrep1,1);
        pflag(tr) = 1;
        pflag = logical(pflag);
        X1(pflag,:,i) =  X2r(pflag,:);
        X2(pflag,:,i) =  X1r(pflag,:);
    end;
else
    for i=1:N
        pflag=ones(Nt,1);
        tr = randsample(Nt,Nrep1);
        X1(:,:,i)= Xr(tr,:);
        pflag(tr)=0; pflag=logical(pflag);
        X2(:,:,i)= Xr(pflag,:);
    end;    
end;

X1 = squeeze(X1);
X2 = squeeze(X2);

return;