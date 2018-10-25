function [charPathL, D] = shortpath_bin(Mat)
%[charPathL, D, Dist]=shortpath(Mat)
% ...calculates characteristic path length of Mat

% Mat= Binary input Matrix , size NxN, N=number of channels
% charPathL= Characteristic path length, global mean of the finite entries 
%            of its distance matrix, in literature iqual to L
% D= Distance Matrix after Dijkstra’s algorithm to find shortest path has been
%    applied, size NxN, N=number of channels. The distance matrix D(G) records 
%    the distances between j and i, defined as the length of the shortest path
%    between them.
%
% Modified by Lester Melie Garcia
% Cuban Neuroscience Center
% February 23rd, 2010

N=size(Mat,1);

D = distance_bin(Mat);  
ind = (D==Inf);  
D(ind)=0; 
charPathL = sum(sum(D))/(N*(N-1));                              
