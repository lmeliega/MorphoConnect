function [Nc,thresbins] = Random_Failure_analysis(ConMat,sparsity_degree,Nrep)

% This function makes the random failure analysis of the Network
% represented by the connectivity matrix C.
%
% Input Parameters:
%    ConMat : Connectivity Matrix.
%  sparsity_degree : sparsity degree where the analysis will be done.
%     Nrep : number of repetitions.
%
% Output Parameters:
%     Nc  : curve of the largest component normalized in the Network.
%  thresC : value of the threshold for the connectivity matrix.
%  thresS : value of the threshold for the sparsity degree.
% thresAve : value of the threshold for the average degree where the theoretical value for calculating 
%            sigma network property is possible (2*log(N)).
% thresbins : sparsity degree's bins used for calculating previous measures.
%
% Lester Melie-Garcia
% Neuroinformatics Department
% Cuban Neuroscience Center
% November 27th, 2012.

thres_min = 1;
thres_max = 99.9;
step = 2;
thresbins = thres_min:step:thres_max; % sparsity degree values.
Nbins = length(thresbins);
N = size(ConMat,1); % Number of nodes.
Is_symmetric = not(logical(sum(sum(ConMat~=ConMat'))));

thresbins = thresbins/100;
Nn = round(N*thresbins);

lowerhalf = (tril(ones(N),-1)>0);
upperhalf = (triu(ones(N), 1)>0);

if Is_symmetric
    ind = lowerhalf;
else
    ind = lowerhalf | upperhalf;
end;

Thresh = myprctile(abs(ConMat(ind)),sparsity_degree);
C = abs(ConMat)>Thresh;

Nc = zeros(Nbins,Nrep);
for i=1:Nbins
    for j=1:Nrep
        ind = randsample(N,N-Nn(i));
        Cj = C(ind,ind);
        X = sum(Cj,1);
        Nc(i,j) = sum(X>0)/(N-Nn(i));        
    end;
end;

return;