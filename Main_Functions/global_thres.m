function [sout,sthres,s] = global_thres(ConMat,p,pvalue)

% Input Parameters:
%    ConMat : Connectivity matrix.
%        p  : p-values of Connectivity matrix ConMat.
%   pvalue : p-value for thresholding process.
%
% Output Parameters:
%    sout : global sparsity value that guarantees: 
%                          1) false discovery rate less than pvalue; 
%                          2) the average degree smaller than 2·log(N); N : number of nodes.
%                          3) 100 % of nodes are connected.
%  sthres : Connectivity matrix threshold of the global sparsity degree 'sout'. 
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 28th, 2010

if ~exist('pvalue','var')
    pvalue = 0.05;
end;

[Nc,thresC,thresS,thresAve,thresbins] = Netlargest_comp(ConMat);

Xthres = ConMatStat(p,'fdr',pvalue);

[IsSymmetric,ind] = Issymetric(ConMat);
N = size(ConMat,1);

if IsSymmetric
    NT = (N*N-N)/2;
else
    NT = N*N-N;
end;

spars = (1-nnz(Xthres(ind))/NT)*100;

x = [thresS,thresAve];
s = min(x);
sout = min(s,spars);
sthres = myprctile(abs(ConMat(ind)),sout);

return;