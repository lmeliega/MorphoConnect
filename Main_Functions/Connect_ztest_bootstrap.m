function [Z,p,Zthres,pthres] = Connect_ztest_bootstrap(ConMat1,ConMat2,p1,p2,N1,N2,k,qvalue)

% This function calculates the z test for computing differences between 
% connectivity matrices obtained using partial or pearson correlation measures. 
%
% Input Parameters:
%      ConMat1,ConMat2 : 3D Connectivity matrices. The third dimension is the number of repetition (i.e number of bootstrap).
%       p1,p2 : p-values matrices of the correlation coefficients in ConMat1 and ConMat2. 
%      N1, N2 : Number of data used for calculating matrices ConMat1 and ConMat2 respectively.
%      k : Number of parameters the correlation measure depends on. For
%          pearson correlation k=1, for partial correlation k=N-2, where N
%          is the number of nodes or number of rows of the connectivity matrices.
%      qvalue : pvalue for the test, usually pvalue = 0.05. This is used for multiple test correction.
%
% Output Parameters:
%      Z :  Z statistic.
%      p :  probability of the Z statistic.
%      Zthres : logical matrix, with the results where the connectivity matrices are statistically different.
%      pthres : p-value for multiple testing correction using False discovery rate methodology.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, January 13th, 2013

[Np,Np,Nrep] = size(ConMat1);
[IsSymmetric,ind] = Issymetric(ConMat1);

p1m = zeros(Np,Np,Nrep);
p2m = zeros(Np,Np,Nrep);
pthres1 = fdr(p1(ind),qvalue);
if ~isempty(pthres1)
    p1m(ind)= p1(ind)<pthres1 ;
    p1m = logical(p1m);
end;
pthres2 = fdr(p2(ind),qvalue);
if ~isempty(pthres2)
    p2m(ind)= p2(ind)<pthres2;
    p2m = logical(p2m);
end;
indp = p1m|p2m; 

z1 = fisherTransform(ConMat1,N1,k);
z2 = fisherTransform(ConMat2,N2,k);
z1m = mean(z1,3);
%z2m = mean(z2,3);
[IsSymmetric,ind] = Issymetric(z1m);

%x = z1m(:)-z2m(:);
%x = z1m(:)-z2m(:);
%s1 = std(z1,0,3);
%s2 = std(z2,0,3);
%sigMa = sqrt(s1.^2 + s2.^2);
m = 0;
tail = 'both';  %'left', 'right'

%[h,p,ci,zval] = ztest(x,m,sigMa,qvalue,tail,2);
[h,p,ci,stats] = ttest(z1,z2,qvalue,tail,3);
Z = reshape(zval,[Np,Np,Nrep]);
p = reshape(p,[Np,Np,Nrep]);

Zthres = zeros(Np);
pthres = fdr(p(indp),qvalue);
%pthres = fdr(p(ind),qvalue);
if ~isempty(pthres)
    Zthres(indp)= p(indp)<=pthres ;
else
    Zthres(ind) = 999999;
end;

Zthres = logical(Zthres);
Zthres = Zthres&indp;

if IsSymmetric
    for i=1:Nrep
        Zthres(:,:,i) = Zthres(:,:,i) + Zthres(:,:,i)';
    end;
end;

return;