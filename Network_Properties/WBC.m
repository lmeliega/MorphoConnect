function bw = WBC(Dist) % Weighted Betweenness Centrality
% bw = WBC(Dist)
% ...calculates the weighted betweenness centrality, a measure to identify the most 
% central nodes in a graph, which are associated to those nodes that acts as bridges
% between the others nodes
% It is defined as the fraction of shortest paths between pairs of nodes that
% passes through a given node.

% Dist= Inputmatrix for Dijkstra’s algorithm, size NxN, N=number of
%       channels
% bw= Weighted Betweenness Centrality


N = length(Dist);
counter1 = zeros(N,1);counter2 = 0;
h = waitbar(0,'computing Weighted Betweenness Centrality');
for node = 1: N
    data = dijkstra(Dist, node);
    Predecessors = data.F';
    for node_target = 1:N
        if node_target ~= node
            %p = [node_target];
            curv = node_target;
            niter = 0;
            while Predecessors(curv)>0 && niter<N
                niter = niter + 1;
                curv = Predecessors(curv);
                %p = [p, curv];
                counter1(curv) = counter1(curv)+1;
            end
            counter2 = counter2+1;
        end
    end
    waitbar(node/N,h);
end
close(h);
bw = counter1/counter2;
%bw=counter2/counter1;
return