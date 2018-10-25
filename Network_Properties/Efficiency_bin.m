function [Eglob, Enod, Eloc] = Efficiency_bin(Mat, isdir, D)
% [Eglob, Enod, Eloc] = Efficiency(Mat,D)
% ...calculates Efficiency as a traffic capacity  measure of a network

% Mat= Binary inputmatrix , size NxN, N=number of channels
% D= Distancematrix after Dijkstra’s algorithm to find shortest path has been
%    applied, size NxN, N=number of channels. The distance matrix D(G) records 
%    the distances between j and i, defined as the length of the shortest path
%    between them.
% Eglob= Global efficiency: how efficiently information can be exchanged over network, 
% Enod= Nodal efficiency:
% Eloc= Local efficiency: average efficiency of the local subgraphs, measures how much
%       system is fault tolerant

N = size(Mat,1);

diag = [1: N; 1: N]';
diag = sub2ind(size(Mat), diag(:, 1), diag(:, 2));
Mat(diag) = 0;

if nargin < 3
    D = distance_bin(Mat);
end

ind = isinf(D); 
D(ind) = 0;
D(diag) = 0;

% Global efficiency:
if isdir
    Eglob = efficiencyG_dir(D);
else
    Eglob = efficiencyG_und(D);
end

if nargout > 1 % Nodal efficiency:
    Enod = zeros(N, 1);
    
    for node = 1: N
        ind = find(Mat(node, :));
        if length(ind) > 1
            Mat2 = Mat(ind, ind); 
            Di = distance_bin(Mat2);
        
            if isdir
                Enod(node) = efficiencyG_dir(Di);
            else
                Enod(node) = efficiencyG_und(Di);
            end
        end
    end
end

if nargout > 2 % Local efficiency:
    Eloc = mean(Enod);
end
