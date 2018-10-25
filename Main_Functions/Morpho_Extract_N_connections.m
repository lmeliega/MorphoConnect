function [V,indi,indj] = Morpho_Extract_N_connections(ConMat, N, isBinary, isWeakestConnections)

%
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, April 22nd , 2010

Nelem = numel(unique(ConMat(:)));
Nc = size(ConMat,1);
C = tril(ConMat,-1);
if isBinary
   [indi,indj] = find(C);
   N = length(indi); 
else
    if Nelem<N
        N = Nelem;
    end;
    COnes = ones(Nc);
    COnes = tril(COnes,-1);
    indh = find(COnes);  % Finding indexes of the inferior diagonal of the matrix.
    Cs = C(indh(:));
    if isWeakestConnections
        Csort = sort(Cs(:),1,'ascend');
        thres = Csort(N);
        indt = (Cs<=thres);
    else
        Csort = sort(Cs(:),1,'descend');
        thres = Csort(N);
        indt = (Cs>=thres);
    end;
    [indi,indj] = ind2sub([Nc,Nc],indh(indt));
    
    N = length(indi); % Asigning the new value for N (number of connections).
    Conn = zeros(N,1);
    for i=1:N
        Conn(i) = C(indi(i),indj(i));
    end;
    if isWeakestConnections
        [Conn,ind] = sort(Conn,1,'ascend');
    else
        [Conn,ind] = sort(Conn,1,'descend');
    end;    
    indi = indi(ind);
    indj = indj(ind);
end;

ind = sub2ind([Nc,Nc],indi,indj);
V = C(ind);

return;