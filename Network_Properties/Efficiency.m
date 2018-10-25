function [Eglob, Enodes, Eloc] = Efficiency(Mat,D)

% [Eglob, Enodes, Eloc] = Efficiency(Mat,D)
% ...calculates Efficiency as a traffic capacity  measure of a network

% Mat= Binary inputmatrix , size NxN, N=number of channels
% D= Distancematrix after Dijkstra’s algorithm to find shortest path has been
%    applied, size NxN, N=number of channels. The distance matrix D(G) records 
%    the distances between j and i, defined as the length of the shortest path
%    between them.
% Eglob= Global efficiency: how efficiently information can be exchanged over network,                   
% Eloc= Local efficiency: average efficiency of the local subgraphs, measures how much
%       system is fault tolerant

N = size(Mat,1);
% Global efficiency:
D_aux = D.^(-1); ind = isinf(D_aux); D_aux(ind) = 0;
Eglob = sum(sum(D_aux))/(N^2-N);
% Local efficiency:
Eloc = 0;
Enodes = zeros(N,1);
for node = 1:N
    ind = find(Mat(node,:));
    Mat2 = Mat(ind,ind); N2 = size(Mat2,1);
    Dist_i = Mat2.^(-1); ind = isinf(Dist_i); Dist_i(ind) = 0;
    Di = dijk(Dist_i);
    D_aux_i = Di.^(-1); ind = isinf(D_aux_i); D_aux_i(ind) = 0;
    Eloc = Eloc + sum(sum(D_aux_i))/(N*(N2^2-N2)+eps);
    Enodes(node) = sum(sum(D_aux_i))/(N*(N2^2-N2)+eps);
end
