function [p,pp,p_corrected,pp_corrected,pA,ppA,pA_corrected,ppA_corrected,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(X1,X2,X1b,X2b,pvalue,isspecialcase)

%% Input Parameters
%   X1,X2 :  non-bootstrapped datasets.
%   X1boot,X2boot : bootstrapped datasets.
%                     
%% Output Parameters 
%
%   p  : p-value of the confidence intervals.
%  pp  : vector of statistical significance. Elements equal to 1 mean that confidence interval does not contain zero. 
%  p_corrected : p-value corrected for multiple comap
%   pA : p-value of the confidence interval for AUC. 
%   ppA : vector of statistical significance for AUC. Elements equal to 1 mean that confidence interval does not contain zero. 
%   ci : confidence interval.
%  ciA : confidence interval for AUC.
%   dm : difference of X1-X2
% dbmean: mean of the differences X1b-X2b
%
%%
% Lester Melie Garcia
% LREN, CHUV
% February 6th, 2017.
%%
if ~exist('isspecialcase','var')
    isspecialcase = false;
end;
%up_prct=100*(1-pvalue/2);
%low_prct=100*pvalue/2;
%vprct = 100*[pvalue/2,1-pvalue/2]; vprct=vprct(:);

NV = size(X1b);
if isvector(X1b)
    NV = max(NV);
end;

switch length(NV)
    case 1
        %Nboots=NV(1);
        dm = X1(:)-X2(:);
        dmij = squeeze(X1b(:)-X2b(:));
        [ci,p] = bootcper_confidence_interval(dm,dmij,pvalue);
        pp = double(prod(sign(ci))>0);
        pA = p; ciA=ci; ppA = pp; dbmean=mean(dmij);
        p_corrected = p; pp_corrected = pp; pA_corrected= p; ppA_corrected= pp;
    case 2
        if ~isspecialcase
            Nspars=NV(2); Nboots=NV(1); 
            p=zeros(1,Nspars); pp=zeros(1,Nspars); ci=zeros(2,Nspars);
            dm = X1(:)-X2(:); 
            for j=1:Nspars
                dmij = squeeze(X1b(:,j)-X2b(:,j));                
                [ci(:,j),p(j)] = bootcper_confidence_interval(dm(j),dmij,pvalue);
                pp(j)= double(prod(sign(ci(:,j)))>0); % if interval contains zero pp(j)=0, pp(j)=1 otherwise.
            end;
            dbmean = mean(X1b-X2b); dbmean=dbmean(:);
            A1 = trapz(X1,2); A2 = trapz(X2,2);
            A1b = trapz(X1b,2); A2b = trapz(X2b,2);
            dAmij = A1b(:)-A2b(:);
            dAm = A1-A2;
            [ciA,pA] = bootcper_confidence_interval(dAm,dAmij,pvalue);
            ppA = double(prod(sign(ciA))>0);
            p_corrected = pval_adjust(p,'fdr'); pp_corrected = double(p_corrected<=pvalue);
            %p_corrected = []; pp_corrected = []; 
            pA_corrected= []; ppA_corrected= [];
        else           
            Nstruct=NV(1); %Nboots=NV(2);
            dm = X1(:)-X2(:);
            p = zeros(Nstruct,1); pp = zeros(Nstruct,1); ci=zeros(2,Nstruct);
            dmij = X1b-X2b;
            for i=1:Nstruct
                dmij_t = dmij(i,:); dmij_t=dmij_t(:);
                [ci(:,i),p(i)] = bootcper_confidence_interval(dm(i),dmij_t,pvalue);
                pp(i)= double(prod(sign(ci(:,i)))>0);
            end;
            pA = p;  % Area under curve in this case doesn't make sense. That is why it is equaled to p to have an output.
            ciA = ci;
            ppA = pp;
            dbmean=squeeze(mean(dmij,2));
            p_corrected = pval_adjust(p(:),'fdr'); 
            pp_corrected = double(p_corrected<=pvalue);
            pA_corrected = p_corrected;
            ppA_corrected = pp_corrected;
        end;
    case 3
        Nstruct=NV(1); Nspars=NV(3); %Nboots=NV(2); 
        p=zeros(Nstruct,Nspars); pp=zeros(Nstruct,Nspars); pA=zeros(Nstruct,1); ppA=zeros(Nstruct,1); 
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
                [ci(:,i,j),p(i,j)] = bootcper_confidence_interval(dm_t(j),dmij_t,pvalue);
                pp(i,j)= double(prod(sign(ci(:,i,j)))>0); % if interval contains zero pp(j)=0, pp(j)=1 otherwise.
            end;            
            [ciA(:,i),pA(i)]= bootcper_confidence_interval(dAm(i),dAmij(i,:)',pvalue); % pvalue_bonf);
            ppA(i)= double(prod(sign(ciA(:,i)))>0); % if interval contains zero ppA(j)=0, ppA(j)=1 otherwise.
        end;
        p_corrected = pval_adjust(p,'fdr');
        pp_corrected = double(p_corrected<=pvalue);
        pA_corrected = pval_adjust(pA,'fdr');
        ppA_corrected = double(pA_corrected<=pvalue);
        dbmean=squeeze(mean(dmij,2));
end;

end
