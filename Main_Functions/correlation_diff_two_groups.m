function [Z,p] = correlation_diff_two_groups(C1,C2,N1,N2,k,pvalue)

% This function calculates the z test for computing differences between 
% correlation coefficients obtained using partial or pearson correlation measures. 
%
% Input Parameters:
%      C1,C2 : Correlation coefficients.
%      N1, N2 : Number of data used for calculating matrices ConMat1 and ConMat2 respectively.
%      k : Number of parameters the correlation measure depends on. For
%          pearson correlation k=1, for partial correlation k=N-2, where N
%          is the number of nodes or number of rows of the connectivity matrices.
%
% Output Parameters:
%      Z :  Z statistic.
%      p :  probability of the Z statistic.
%
% Lester Melie-Garcia
% LREN, CHUV, February 13th, 2018

[z1,s1] = fisherTransformOne(C1,N1,k);
[z2,s2] = fisherTransformOne(C2,N2,k);
x = z1(:)-z2(:);
sigMa = sqrt(s1.^2 + s2.^2);
m = 0;
tail = 'both';  %'left', 'right'

[h,p,ci,zval] = ztest(x,m,sigMa,pvalue,tail,2);
Z = zval;

end