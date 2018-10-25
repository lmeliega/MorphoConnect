function [charPathL, D, Dist]=shortpath(Mat)

%[charPathL, D, Dist]=shortpath(Mat)
% ...calculates characteristic path length of Mat

% Mat= Binary inputmatrix , size NxN, N=number of channels
% charPathL= Characteristic path length, global mean of the finite entries 
%            of its distance matrix, in literature iqual to L
% D= Distancematrix after Dijkstra’s algorithm to find shortest path has been
%    applied, size NxN, N=number of channels. The distance matrix D(G) records 
%    the distances between j and i, defined as the length of the shortest path
%    between them.
% Dist= Inputmatrix for Dijkstra’s algorithm, size NxN, N=number of
%       channels
% dijk()= Dijkstra’s algorithm to find shortest path

N=size(Mat,1);

Dist = Mat.^(-1); ind = isinf(Dist);   Dist(ind)=0;

D = dijk(Dist);
ind = isinf(D); % vgl Yasser:  ind = isinf(D);
D(ind)=0; % Yasser: D(ind) = []; ---> sum(sum(D))not necessary in Yasser!
charPathL = sum(D(:))/(N*(N-1));  
                            