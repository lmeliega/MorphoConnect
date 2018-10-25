function [sout,sthres1,sthres2] = global_thres_twoMatrices(ConMat1,ConMat2,p1,p2,pvalue)

% 
% Output Parameters:
%   sout : global sparsity value.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 28th, 2010

if ~exist('pvalue','var')
    pvalue = 0.05;
end;

[Nc1,thresC1,thresS1,thresAve1,thresbins] = Netlargest_comp(ConMat1);
[Nc2,thresC2,thresS2,thresAve2,thresbins] = Netlargest_comp(ConMat2);

Xthres1 = ConMatStat(p1,'fdr',pvalue);
Xthres2 = ConMatStat(p2,'fdr',pvalue);

[IsSymmetric,ind] = Issymetric(ConMat1);
N = size(ConMat1,1);

if IsSymmetric
    NT = (N*N-N)/2;
else
    NT = N*N-N;
end;

spars1 = (1-nnz(Xthres1(ind))/NT)*100;
spars2 = (1-nnz(Xthres2(ind))/NT)*100;

x = [thresS1,thresAve1,thresS2,thresAve2];

s = min(x);
s_spars = max(spars1,spars2);
sout = min(s,s_spars);
sthres1 = myprctile(abs(ConMat1(ind)),sout);
sthres2 = myprctile(abs(ConMat2(ind)),sout);

return;