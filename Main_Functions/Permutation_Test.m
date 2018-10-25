function [p,pmax] = Permutation_Test(X1,X2,N,StatType,Dependence)

% Input Parameters
%   X1,X2 :  Data set
%    N : Number of permutations
%  Stattype: Statistic to be used. If Stattype = 1 --> T-Student, absolute value.
%                                  If Stattype = 2 --> Absolute mean Difference.
% Dependence : Defines the dependence between datasets. 
%                                  If Dependence = 1 --> Independent datasets
%                                  If Dependence = 2 --> Dependent datasets
%                     
% Output Parameters 
%
%   p : p-value of the permutation process.
%
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 31st, 2009.

if ~exist('Dependence','var')  % If Dependence variable is not passed, it is assumed that are dependent datasets.
    Dependence = 2;
end;

Nv = size(X1,2);

m1 = mean(X1,1);
m2 = mean(X2,1);
[X1r,X2r] = Data_permutation(X1,X2,N);
p = zeros(Nv,1);
ppr = p;
pmax = 0;
switch StatType    
    case 1 % T-student
        Tij = zeros(N,Nv);
        if Dependence == 1
            S1 = std(X1,0,1).^2;
            S2 = std(X2,0,1).^2;
            n1 = size(X1,1); n2 = n1;
            T = (m1 - m2)./((sqrt(((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)))*(sqrt(1/n1+1/n2)));
        else
            T = (m1-m2)./std(X1-X2,0,1);
        end;
        T = abs(T);        
        X1m = squeeze(mean(X1r,1));
        X2m = squeeze(mean(X2r,1));        
        if Nv==1
            m1 = X1m';
            m2 = X2m';
            if Dependence == 1 % Independent dataset case
                S1 = squeeze(std(X1r,0,1).^2); S1 = S1';
                S2 = squeeze(std(X2r,0,1).^2); S2 = S2';
                Tij = (m1 - m2)./((sqrt(((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)))*(sqrt(1/n1+1/n2)));
            else  % Dependent dataset case
                Tij = (m1 - m2)./std(X1r-X2r,0,1)';
            end;
            Tij = abs(Tij);
            p = sum(T>Tij)/N;
            ppr = prctile(Tij,95);
            pmax = p;
        else
            for i=1:Nv
                m1 = X1m(i,:)';
                m2 = X2m(i,:)';
                if Dependence == 1 % Independent dataset case
                    S1 = squeeze(std(X1r(:,i,:),0,1).^2);
                    S2 = squeeze(std(X2r(:,i,:),0,1).^2);
                    Tij(:,i) = (m1 - m2)./((sqrt(((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)))*(sqrt(1/n1+1/n2)));
                else % Dependent dataset case
                    SS = squeeze(std(X1r(:,i,:)-X2r(:,i,:),0,1));
                    Tij(:,i) = (m1 - m2)./SS;
                end;
                Tij(:,i) = abs(Tij(:,i));
                p(i) = sum(T(i)>Tij(:,i))/N;
                ppr(i) = prctile(Tij(:,i),95);
            end;
            pmax = sum(max(T)>max(Tij,[],1))/N;
        end;
    case 2  % absolute mean Difference
        dm = abs(m1-m2);
        X1m = squeeze(mean(X1r,1));
        X2m = squeeze(mean(X2r,1));
        dmij = abs(X1m - X2m); 
        for i=1:Nv
            p(i) = sum(dm(i)>dmij(i,:))/N;
            ppr(i) = prctile(dmij(i,:),95);
        end;
        pmax = sum(max(dm)>max(dmij,[],1))/N;
end;
    
p = 1-p;
pmax = 1-pmax;

return;
