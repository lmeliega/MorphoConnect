function [p,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(X1,X2,X1b,X2b,pvalue,isspecialcase)

%% Input Parameters
%   X1,X2 :  Non-permuted datasets.
%   X1boot,X2boot : permuted datasets.
%                     
%% Output Parameters 
%
%   p : p-value of the permutation process.
%
%
%% Lester Melie Garcia
% LREN, CHUV
% January 24th, 2017.
%%
if ~exist('isspecialcase','var')
    isspecialcase = false;
end;
vprct = 100*[pvalue/2,1-pvalue/2]; vprct=vprct(:);
NV = size(X1b);
if isvector(X1b)
    NV = max(NV);
end;

switch length(NV)
    case 1
        Nboots=NV(1);
        dm = X1(:)-X2(:);
        dmij = squeeze(X1b(:)-X2b(:));
        p = sum(dmij>dm)/Nboots;
        ci = prctile(dmij,vprct);
        %ci = bootcper_confidence_interval(dm,dmij,pvalue);
        dbmean=mean(dmij);
        pA = p; ciA=ci;
    case 2
        if ~isspecialcase
            Nboots=NV(1); Nspars=NV(2);
            p=zeros(1,Nspars); ci=zeros(2,Nspars);
            dm = X1(:)-X2(:);
            for j=1:Nspars
                dmij = squeeze(X1b(:,j)-X2b(:,j));
                p(j) = sum(dmij>dm(j))/Nboots;
                ci(:,j) = prctile(dmij,vprct);
                %ci(:,j) = bootcper_confidence_interval(dm(j),dmij,pvalue);
                if dm(j)<0
                    p(j)=1-p(j);
                end;
            end;
            dbmean = mean(X1b-X2b); dbmean=dbmean(:);
            A1b = trapz(X1b,2); A2b = trapz(X2b,2);
            A1 = trapz(X1(:),1); A2 = trapz(X2(:),1);
            dAmij = A1b(:)-A2b(:); dAm = A1-A2;
            pA = sum(dAmij>dAm)/Nboots;
            if dAm<0
                pA=1-pA;
            end;
            ciA = prctile(dAmij,vprct);
            %ciA = bootcper_confidence_interval(dAm,dAmij,pvalue);            
        else           
            Nstruct=NV(1); Nboots=NV(2);
            dm = X1(:)-X2(:);            
            p = zeros(Nstruct,1); ci=zeros(2,Nstruct);
            dmij = X1b-X2b;
            for i=1:Nstruct
                dmij_t = dmij(i,:); dmij_t=dmij_t(:);
                p(i) = sum(dmij_t>dm(i))/Nboots;
                ci(:,i) = prctile(dmij_t,vprct);
                %ci(:,i) = bootcper_confidence_interval(dm(i),dmij_t,pvalue);
                if dm(i)<0
                    p(i)=1-p(i);
                end;
            end;
            pA = p;  % Area under curve in this case doesn't make sense. That is why it is equaled to p to have an output.
            ciA = ci;
            dbmean=squeeze(mean(dmij,2));
        end;
    case 3
        Nstruct=NV(1); Nboots=NV(2); Nspars=NV(3);
        p=zeros(Nstruct,Nspars); pA=zeros(Nstruct,1);
        ci=zeros(2,Nstruct,Nspars); ciA=zeros(2,Nstruct);
        X1 = squeeze(X1); X2 = squeeze(X2);
        A1 = trapz(X1,2); A2 = trapz(X2,2);
        dm = X1-X2;
        dmij = X1b-X2b;
        dAm = A1(:)-A2(:);
        A1b = trapz(X1b,3); A2b = trapz(X2b,3);
        dAmij = A1b-A2b;
        for i=1:Nstruct
            dm_t = dm(i,:); dm_t=dm_t(:);
            for j=1:Nspars
                dmij_t = dmij(i,:,j); dmij_t=dmij_t(:);
                ci(:,i,j) = prctile(dmij_t,vprct);
                %ci(:,i,j) = bootcper_confidence_interval(dm_t(j),dmij_t,pvalue);
                p(i,j) = sum(dmij_t>dm_t(j))/Nboots;
                if dm(j)<0
                    p(i,j)=1-p(i,j);
                end;
            end;
            pA(i)= sum(dAmij(i,:)>dAm(i))/Nboots;
            if dAm(i)<0
                pA(i)=1-pA(i);
            end;
            ciA(:,i) = prctile(dAmij(i,:)',vprct);
            %ciA(:,i)= bootcper_confidence_interval(dAm(i),dAmij(i,:)',pvalue);
        end;
        dbmean=squeeze(mean(dmij,2));
end;

end
