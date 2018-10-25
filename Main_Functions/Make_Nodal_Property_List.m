function Make_Nodal_Property_List(NetProps, StructCodes, OutputFile) 
 
%% Input Parameters:
%
%    NetProps  : Network properties File. This is just for one Network property File.
%    StructCodes : Codes of the Cortical structures
%    OutputFile : Output File Name.
%  
%
%% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, February 24th , 2010
% 

if isempty(StructCodes)
    StructCodes = NetProps.Structures;
end;

[OutputFilePath,OutputFileName,OutputFileExt] =  fileparts(OutputFile);
%%  Nodal Efficiency
if isfield(NetProps,'NodalEfficiency')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_NodalEfficiency',OutputFileExt];
    Props = NetProps.NodalEfficiency; 
    Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Vulnerability
if isfield(NetProps,'VulnerabilityMat')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Vulnerability',OutputFileExt];
    Props = NetProps.VulnerabilityMat; 
    Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Betweenness Centrality
if isfield(NetProps,'CentrBet')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Centrality',OutputFileExt];
    Props = NetProps.CentrBet;
    Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Normalized Betweenness Centrality
if isfield(NetProps,'CentrBetNorm')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Normalized_Centrality',OutputFileExt];
    Props = NetProps.CentrBetNorm;
    Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Most Connected Nodes
if isfield(NetProps,'MostConnect')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
    Props = NetProps.MostConnect; Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Node Connections
if isfield(NetProps,'NodeConnection')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
    Props = NetProps.NodeConnection; Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;
%%  Nodal Clustering Index
if isfield(NetProps,'NodalClux')
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Nodal_Clustering_Index',OutputFileExt];
    Props = NetProps.NodeConnection; Props = Props(:);
    SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp);
end;

return;

%%  ---- Internal Functions ---- %%
function SaveNodalProps2TxtXLS(Props,StructCodes,OutputFile_NodalProp)

N = length(StructCodes);
% --- Saving to Text File --- %
NodalPropList = cell(N,1);
fid = fopen(OutputFile_NodalProp,'w');
[Props,indi] = sort(Props,1,'descend');
for i=1:N
    NodalPropList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,'  : ', num2str(Props(i))];
    fprintf(fid,'%s  \r',NodalPropList{i});
end;
fclose(fid);
% --- Saving to Excel File --- %
data_xls = cell(N+1,2);
data_xls{1,1} = 'Structure'; data_xls{1,2} = 'Nodal Value';
for i=1:N
    data_xls{i+1,1} = StructCodes(indi(i)).Name;
    data_xls{i+1,2} = Props(indi(i));
end;
[XLSPath,XLSName] = fileparts(OutputFile_NodalProp);
XLSOutFile = [XLSPath,filesep,XLSName,'.xls'];
if exist(XLSOutFile,'file')
    delete(XLSOutFile);
end;
xlswrite(XLSOutFile,data_xls, 'Data');

return;
