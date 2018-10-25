function [ConMat_out,ConMat_out_bin,ConnectList] = MakeConnectionsList(ConMat, StructCodes, N, isBinary, isWeakestConnections, OutputFile) 
 
% Input Parameters:
%
%    ConMat      : Connectivity Matrix
%    StructCodes : Codes of the Cortical structures
%    N    :  N-most highest connection pairs.
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
% Havana, November 10th , 2008
% 

ConMat = mean(ConMat,3);  % The mean is taken if ConMat have Repetitions. 
Nelem = numel(unique(ConMat(:)));
Nc = size(ConMat,1);

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
    
C = tril(abs(ConMat),-1);
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

ConnectList = cell(N,1);
ConMat_out = zeros(Nc);
for i=1:N
    ConnectList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ',StructCodes(indj(i)).Name,'  : ', num2str(ConMat(indi(i),indj(i)))];
    ConMat_out(indi(i),indj(i)) = ConMat(indi(i),indj(i));    
end;
ConMat_out_bin = ConMat_out~=0; 

if ~isempty(OutputFile)
    fid = fopen(OutputFile,'w');
    for i=1:N
        fprintf(fid,'%s  \r',ConnectList{i});
    end;
    fclose(fid);
    % --- Saving Excel File --- %
    data_xls = cell(N+1,3);
    data_xls{1,1} = 'Structure 1'; data_xls{1,2} = 'Structure 2'; data_xls{1,3} = 'Connectivity Value';    
    for i=1:N
        data_xls{i+1,1} = StructCodes(indi(i)).Name;
        data_xls{i+1,2} = StructCodes(indj(i)).Name;
        data_xls{i+1,3} = ConMat(indi(i),indj(i));
    end;
    [XLSPath,XLSName] = fileparts(OutputFile);
    XLSOutFile = [XLSPath,filesep,XLSName,'.xls'];
    if exist(XLSOutFile,'file')
        delete(XLSOutFile);
    end;
    xlswrite(XLSOutFile,data_xls, 'Data');
    % -------------------------- %
    ConVal = sum(abs(ConMat));
    [YY,indk] = sort(ConVal(:),1,'descend');
    ConnectivityValList = cell(Nc,1);
    for i=1:Nc
        ConnectivityValList{i}=[num2str(i) ' -- ' StructCodes(indk(i)).Name,' --> ', num2str(ConVal(indk(i)))];
    end;
    % --- Saving Connection's strength per node ...
    [ConValFilePath,ConValFileName,ConValFileExt] = fileparts(OutputFile);
    OutConnectionFile = [ConValFilePath,filesep,['connect_strength_',ConValFileName],ConValFileExt];
    fid = fopen(OutConnectionFile,'w');
    for i=1:Nc
        fprintf(fid,'%s  \r',ConnectivityValList{i});
    end;    
    fclose(fid);
    % --- Saving Connection's strength per node Excel File --- %
    clear data_xls
    data_xls = cell(Nc+1,2);
    data_xls{1,1} = 'Structure'; data_xls{1,2} = 'Connection Strength';    
    for i=1:Nc
        data_xls{i+1,1} = StructCodes(indk(i)).Name;
        data_xls{i+1,2} = ConVal(indk(i));
    end;
    [XLSPath,XLSName] = fileparts(OutConnectionFile);
    XLSOutFile = [XLSPath,filesep,XLSName,'.xls'];
    if exist(XLSOutFile,'file')
        delete(XLSOutFile);
    end;
    xlswrite(XLSOutFile,data_xls, 'Data');
    % --------------------------------------------------------- %
end;

return;