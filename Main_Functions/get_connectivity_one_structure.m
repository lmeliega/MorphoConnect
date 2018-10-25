function [ConnH,ConnH_mean,ConnH_std,ConnH_CI]=get_connectivity_one_structure(C,ind,indnot)

% This functions get the connectivity of one structure with the rest taking out structures that are defined in 'indnot' parameter.
% 
%% Input Parameters:
%   C :  Connectivity matrix, it should the Ns x Ns x Nrep : double of number of structures x double of number of structures x number of repetitions.
%  ind : index of the structure to which will be calculated the connectivity with the rest.
%  indnot : indexes of the structures not to take into account for the connectivity computation.
%
%% Output Parameters:
%    ConnH : The connectivity value of the region. This is a column vector Nrep x 1. 
%    ConnH_mean, ConnH_std, ConnH_CI : Mean, standard deviation and Confidential interval of ConnH accross the number of repetition.
%
%% Lester Melie-Garcia
% LREN, CHUV, Lausanne, October 28th 2016

C = squeeze(C(:,ind,:));
C(indnot,:) = [];
N = size(C,1)-1;
ConnH = sum(abs(C),1)/N;
ConnH = ConnH(:);
ConnH_mean = mean(ConnH);
ConnH_std = std(ConnH);
ConnH_CI = Conf_interv(ConnH,2);
ConnH_CI = ConnH_std;
end