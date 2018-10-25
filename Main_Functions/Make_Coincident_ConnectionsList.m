function ConnectList = Make_Coincident_ConnectionsList(ConMat1, ConMat2, StructCodes, N, isBinary, isWeakestConnections, OutputFile) 
 
% Input Parameters:
%
%    ConMat1, ConMat2 : Connectivity Matrices
%    StructCodes : Codes of the Cortical structures
%    N    :  N-most highest or lowest connection pairs.
%    isBinary : This is a flag that is true if the input connectivity matrix is binary. If we dont know enter isBinary = ''. 
%    isWeakestConnections : This is the flag to specify if the weakest connections are taken instead of highest connections.
%    OutputFile : Output File Name.
%  
% Output Parameters:
%
%  ConnectList : List of the N-most connected node pairs in the input connectivity
%                matrix.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, March 29th , 2010


Nelem = numel(unique(ConMat1(:)));
Nc = size(ConMat1,1);

if Nelem==1
    ConnectList = [];
    disp('Only one value in the Connectivity Matrix ...');
    return;
end;

if isempty(isBinary)
    conpar = unique(ConMat(:));
    if isequal(conpar(:),[0;1])
        isBinary = true;
    else
        isBinary = false;
    end;
end;
    
C1 = tril(ConMat1,-1);
C2 = tril(ConMat2,-1);

if isBinary
   C = C1.*C2;
   [indi,indj] = find(C);
   N = length(indi); 
else
    if Nelem<N
        N = Nelem;
    end;
    COnes = ones(Nc);
    COnes = tril(COnes,-1);
    indh = find(COnes);  % Finding indexes of the inferior diagonal of the matrix.
    Cs1 = C1(indh(:));
    Cs2 = C2(indh(:));
    if isWeakestConnections
        Csort1 = sort(Cs1(:),1,'ascend');
        thres1 = Csort1(N);
        Csort2 = sort(Cs2(:),1,'ascend');
        thres2 = Csort2(N);
        indt = (Cs1<=thres1)&(Cs2<=thres2);
    else
        Csort1 = sort(Cs1(:),1,'descend');
        thres1 = Csort1(N);
        Csort2 = sort(Cs2(:),1,'descend');
        thres2 = Csort2(N);
        indt = (Cs1>=thres1)&(Cs2>=thres2);
    end;
    [indi,indj] = ind2sub([Nc,Nc],indh(indt));
    
    N = length(indi); % Asigning the new value for N (number of connections).
    Conn1 = zeros(N,1);
    Conn2 = zeros(N,1);
    for i=1:N
        Conn1(i) = C1(indi(i),indj(i));
        Conn2(i) = C2(indi(i),indj(i));
    end;
    if isWeakestConnections
        [Conn1,ind] = sort(Conn1,1,'ascend');
    else
        [Conn1,ind] = sort(Conn1,1,'descend');
    end;    
    indi = indi(ind);
    indj = indj(ind);
end;

ConnectList = cell(N,1);
for i=1:N
    ConnectList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ', ...
                    StructCodes(indj(i)).Name,'  : ', num2str(C1(indi(i),indj(i))), ' , ' num2str(C2(indi(i),indj(i)))];
end;

if ~isempty(OutputFile)
    fid = fopen(OutputFile,'w');
    for i=1:N
        fprintf(fid,'%s  \r',ConnectList{i});
    end;
    fclose(fid);
end;

return;