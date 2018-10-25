function BC = betweenness_wu(D)

% D : distance Matrix.

% Neuroimaging Department
% Cuban Neuroscience Center
% May 30th 2011

N = length(D);
counter1 = zeros(N,1);counter2 = 0;
h = waitbar(0,'computing Weighted Betweenness Centrality');
for node = 1:N
    data = dijkstra(D, node);
    Predecessors = data.F';
    for node_target = 1:N
        if node_target ~= node
            p = node_target;
            curv = node_target;
            niter = 0;
            while Predecessors(curv)>0 && niter<N
                niter = niter + 1;
                curv = Predecessors(curv);
                p = [p, curv];
                counter1(curv) = counter1(curv)+1;
            end
            counter2 = counter2+1;
        end
    end
    waitbar(node/N,h);
end
close(h);
BC = counter1/counter2;

return