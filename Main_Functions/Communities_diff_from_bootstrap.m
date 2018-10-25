function  [MIn,VIn] = Communities_diff_from_bootstrap(G1_Comm,G2_Comm)

%  This function quantifies information-theoretic distance (normalized variation of information) or similarity (normalized mutual information)
%   between community partitions coming from bootstrapping process.
%% Input Parameters
% G1_Comm, G2_Comm : These are the partitions for a number of boostraps
% repetitions for several sparsity degrees. The G1_Comm and G2_Comm are 3D matrices with the same dimensions: Nnodes x Nbootstrap x Nsparsity 
%
%% Output Parameters
%   MIn,VIn : Normalized variation of information or similarity (normalized
%   mutual information). These are column vectors of Nboostraps x 1.
%% Lester Melie-Garcia
% LREN, CHUV, Lausanne August 18th 2017

[~,Nrep,Nspars] =  size(G1_Comm);
VIn = zeros(Nrep,Nspars);
MIn = zeros(Nrep,Nspars);
for j=1:Nspars
    for i=1:Nrep
        [VIn_temp, MIn_temp] = partition_distance([squeeze(G1_Comm(:,i,j)),squeeze(G2_Comm(:,i,j))]);
        VIn(i,j) = VIn_temp(1,2); MIn(i,j) = MIn_temp(1,2);  
    end;
end;

end