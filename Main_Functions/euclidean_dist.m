function [C,p] = euclidean_dist(Y)

% This function calculates the distance correlation between variables X and Y.
%
% Input parameters:
%    Y : data matrix; rows: observations, columns : Structures.
%    
% Output parameters:
%    C :  euclidean distance matrix. Connectivity matrix based on euclidean
%         distance.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, June 13th, 2012

d = pdist(Y','euclidean');
C = squareform(d);
%cmax = max(C(:));
%C = C./cmax;
C = 1-C;
NStruct = size(C,1);
p = zeros(NStruct);

return;