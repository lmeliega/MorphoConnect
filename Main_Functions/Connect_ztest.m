function [Z,p,Zthres,pthres] = Connect_ztest(ConMat1,ConMat2,p1,p2,N1,N2,k,qvalue)

% This function calculates the z test for computing differences between 
% connectivity matrices obtained using partial or pearson correlation measures. 
%
% Input Parameters:
%      ConMat1,ConMat2 : Connectivity matrices.
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
% Havana, December 7th, 2010

Np = size(ConMat1,1);
[IsSymmetric,ind] = Issymetric(ConMat1);

p1m = zeros(Np);
p2m = zeros(Np);
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

[z1,s1] = fisherTransform(ConMat1,N1,k);
[z2,s2] = fisherTransform(ConMat2,N2,k);
x = z1(:)-z2(:);
sigMa = sqrt(s1.^2 + s2.^2);
m = 0;
tail = 'both';  %'left', 'right'

[h,p,ci,zval] = ztest(x,m,sigMa,qvalue,tail,2);
Z = reshape(zval,[Np,Np]);
p = reshape(p,[Np,Np]);

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
    Zthres = Zthres + Zthres';
end;

return;