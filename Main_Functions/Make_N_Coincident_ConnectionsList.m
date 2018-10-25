function ConnectList = Make_N_Coincident_ConnectionsList(ConMat, StructCodes, N, isBinary, isWeakestConnections, OutputFile) 
 
% Input Parameters:
%
%    ConMat: 3D Matrix with the Connectivity Matrices. NcxNcxNm, Nm: number of matrices.  
%    StructCodes : Codes of the Cortical structures
%    N    :  N-most highest or lowest connection pairs.
%    isBinary : This is a flag that is true if the input connectivity matrix is binary. If we dont know enter isBinary = ''. 
%    isWeakestConnections : This is the flag to specify if the weakest connections are taken instead of highest connections.
%    OutputFile : Output File Name.
%  
% Output Parameters:
%
%  ConnectList : List of the  N-most connected node pairs coincident in the input connectivity
%                matrices.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, March 29th , 2010

ConMat1 = ConMat(:,:,1);
Nelem = numel(unique(ConMat1(:)));
[Nc,Nc,Nm] = size(ConMat); % Nm: Number of connectivity matrices.

if Nelem==1
    ConnectList = [];
    disp('Only one value in the Connectivity Matrix ...');
    return;
end;

if isempty(isBinary)  % Checking binary condition of the Connectivity matrices.
    conpar = unique(ConMat(:));
    if isequal(conpar(:),[0;1])
        isBinary = true;
    else
        isBinary = false;
    end;
end;

if isBinary
   C = prod(ConMat,3);
   C = tril(C,-1);
   [indi,indj] = find(C);
   N = length(indi); 
else
    if Nelem<N
        N = Nelem;
    end;
    COnes = ones(Nc);
    COnes = tril(COnes,-1);
    indh = find(COnes);  % Finding indexes of the inferior diagonal of the matrix.
    indh = indh(:);
    indt = ones(length(indh),1);
    for i=1:Nm
        C = squeeze(ConMat(:,:,i));
        Cs = C(indh);
        if isWeakestConnections
            Csort = sort(Cs,1,'ascend');
            thres = Csort(N);
            indt = indt.*(Cs<=thres);
        else
            Csort = sort(Cs,1,'descend');
            thres = Csort(N);
            indt = indt.*(Cs>=thres);
        end;
    end;
    [indi,indj] = ind2sub([Nc,Nc],indh(indt));    
    N = length(indi); % Asigning the new value for N (number of connections).
    Conn = zeros(N,1);
    C = squeeze(ConMat(:,:,1)); 
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

ConnectList = cell(N,1);
for i=1:N
    ConnectList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ',StructCodes(indj(i)).Name,'  : ', num2str(ConMat(indi(i),indj(i),:))];
end;

if ~isempty(OutputFile)
    fid = fopen(OutputFile,'w');
    for i=1:N
        fprintf(fid,'%s  \r',ConnectList{i});
    end;
    fclose(fid);
end;

return;