function ConnectList = MakeCallosalConnectionsList(ConMat, StructCodes, OutputFile) 
 
%% Input Parameters:%
%    ConMat      : Connectivity Matrix
%    StructCodes : Codes of the Cortical structures
%    OutputFile : Output File Name.
%  
%% Output Parameters:
%
%  ConnectList : List of the callosal homologous connected node pairs 
%                in the input connectivity matrix.
%
%% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, June 27th , 2011

ConMat = mean(ConMat,3);
NStruct = size(ConMat,1);
Nhalf = floor(NStruct/2);
ind_struct = Nhalf+1:NStruct;

ConMatC = ConMat(1:Nhalf,ind_struct);
Cs = diag(ConMatC);
[Csort,ind] = sort(Cs,1,'descend');

indi = 1:Nhalf;
indi = indi(ind);
indj = ind_struct(ind);

ConnectList = cell(Nhalf,1);
for i=1:Nhalf
    ConnectList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ',StructCodes(indj(i)).Name,'  : ', num2str(Csort(i))];
end;
if ~isempty(OutputFile)
    fid = fopen(OutputFile,'w');
    for i=1:Nhalf
        fprintf(fid,'%s  \r',ConnectList{i});
    end;
    fclose(fid);
    % -- Saving Excel File -- %
    data_xls = cell(Nhalf+1,3);
    data_xls{1,1} = 'Structure 1'; data_xls{1,2} = 'Structure 2'; data_xls{1,3} = 'Connectivity Value';    
    for i=1:Nhalf
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
end;

return;