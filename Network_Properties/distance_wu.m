function D = distance_wu(G)

% D : distance Matrix.

% Neuroimaging Department
% Cuban Neuroscience Center
% May 30th 2011

Dist = G.^(-1); ind = isinf(Dist);   Dist(ind)=0;
D = dijk(Dist);   %%Dijkstra’s algorithm to find shortest path
ind = isinf(D==Inf);
D(ind)=0;
