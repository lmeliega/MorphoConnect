function [X1,X2] = Data_permutation(X1,X2,N,Dependent)

% This functions permutes randomly rows between two data sets.
%  Input Parameters
%      X1,X2 : Datasets. They must have same size.
%      N : Number of permutations.
%     Dependent : Set if permutations will be for dependent sample or not.
%
%  Output Parameters
%     X1, X2 : Permuted datasets. size(X1) = [r1,c1,N]  
%   
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 31st, 2009.

if ~exist('Dependent','var')
    Dependent = true;
end;

Nrep1 = size(X1,1);
Nrep2 = size(X2,1);

X1r = X1;
X2r = X2;
X1 = repmat(X1,[1,1,N]);
X2 = repmat(X2,[1,1,N]);

if Dependent
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
    %Nrep = min(Nrep1,Nrep2); 
    T = zeros(N,1);
    for i=1:N        
        pflag1 = unidrnd(2,Nrep1,1)-1;
        which_s = sum(pflag1);
        T(i) = which_s;
        tr2 = randsample(Nrep2,which_s);        
        pflag2 = zeros(Nrep2,1);
        pflag2(tr2) = 1;
        pflag1 = logical(pflag1);
        pflag2 = logical(pflag2);
        X1(pflag1,:,i) =  X2r(pflag2,:);
        X2(pflag2,:,i) =  X1r(pflag1,:);
    end;    
%     for i=1:N        
%         which_s = unidrnd(Nrep);
%         tr1 = randsample(Nrep1,which_s);
%         tr2 = randsample(Nrep2,which_s);
%         pflag1 = zeros(Nrep1,1);
%         pflag2 = zeros(Nrep2,1);
%         pflag1(tr1) = 1;
%         pflag2(tr2) = 1;
%         pflag1 = logical(pflag1);
%         pflag2 = logical(pflag2);
%         X1(pflag1,:,i) =  X2r(pflag2,:);
%         X2(pflag2,:,i) =  X1r(pflag1,:);
%     end;
end;

X1 = squeeze(X1);
X2 = squeeze(X2);

return;