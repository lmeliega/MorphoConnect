function [Nc,thresbins,bwsort] = Target_attack_analysis(ConMat,sparsity_degree)

%% This function makes the target attack analysis of the Network represented by the connectivity matrix C.
%
%% Input Parameters:
%    ConMat : Connectivity Matrix. If ConMat is binary the sparsity_degree wont be necessary.
%  sparsity_degree : sparsity degree where the analysis will be done.
%
%% Output Parameters:
%       Nc  : curve of the largest component normalized in the Network.
% thresbins : sparsity degree's bins used for calculating previous measures.
%    bwsort : sorted Centrality vector.
%
%% Lester Melie-Garcia
% Neuroinformatics Department
% Cuban Neuroscience Center
% November 28th, 2012.

if isstruct(ConMat)
    ConMat = ConMat.ConMat; % this is for MorphoConnect Toolbox format.
end;
N = size(ConMat,1); % Number of nodes.
%Is_symmetric = not(logical(sum(sum(ConMat~=ConMat'))));

lowerhalf = (tril(ones(N),-1)>0);
upperhalf = (triu(ones(N), 1)>0);

% if Is_symmetric
%     ind = lowerhalf;
% else
%     ind = lowerhalf | upperhalf;
% end;
ind = lowerhalf | upperhalf;
if length(unique(ConMat(:)))==2
    if sum(unique(ConMat(:))==[0;1])==2 % Checking if input Matrix is binary.
        C = ConMat;
    else
        Thresh = myprctile(abs(ConMat(ind)),sparsity_degree);
        C = abs(ConMat)>Thresh;
    end;
else
    Thresh = myprctile(abs(ConMat(ind)),sparsity_degree);
    C = abs(ConMat)>Thresh;
end;

thres_min = 1;
thres_max = N;
step = 1;
thresbins = thres_min:step:thres_max; % sparsity degree values.
Nbins = length(thresbins);
thresbins = thresbins/N;

BC = betweenness_bin(double(C));
% bw = BC(:)/max(BC); % Normalized Betweennes centrality across the maximum.
bwnorm = BC(:)/mean(BC);% Normalized Betweennes centrality across the mean.

[bwsort,ind] = sort(bwnorm,'descend');
Nc = zeros(Nbins,1);
for i=1:Nbins
    indr = ind(1:i);
    Cj = C;
    Cj(indr,:) = [];
    Cj(:,indr) = [];
    X = sum(Cj,1);
    if ~isempty(Cj)
        Nc(i) = sum(X>0)/(size(Cj,1));
    end;
end;

return;