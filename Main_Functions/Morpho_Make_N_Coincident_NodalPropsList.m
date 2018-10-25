function Morpho_Make_N_Coincident_NodalPropsList(NetworkPropertiesFiles, N, OutputFile)

%
%    N :  N-most highest or lowest values of the Nodal Network property.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, March 31st , 2010
%

NNets = size(NetworkPropertiesFiles,1); % Number of NetProps Files.

for i=1:NNets
    NetProps_temp = load(deblank(NetworkPropertiesFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetProps{i} = NetProps_temp; %#ok
end;

StructCodes = NetProps{1}.Structures;
NStruct = length(StructCodes);

[OutputFilePath,OutputFileName,OutputFileExt] =  fileparts(OutputFile);
if isfield(NetProps{1},'NodalEfficiency')
    V = zeros(NStruct,NNets);
    for i=1:NNets
        Props = NetProps{i}.NodalEfficiency;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        Vtord = sort(Props,1,'descend');
        thres = Vtord(N);
        ind = Props>=thres;
        V(ind,i) = Props(ind);
    end;
    Vbin = V>0; Ncoinc = sum(Vbin,2);
    NodalPropList = cell(NStruct,1);
    NodalCoincList = cell(NStruct,1);
    NodalCoincListBow = cell(NStruct,1);
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_NodalEfficiency',OutputFileExt];
    OutputFile_Num_Coinc = [OutputFilePath,filesep,OutputFileName,'_NodalEfficiency_N_Coincidence',OutputFileExt];
    OutputFile_Num_CoincBow = [OutputFilePath,filesep,OutputFileName,'_NodalEfficiency_N_Coincidence_brainbow',OutputFileExt];
    if ispc
        fid = fopen(OutputFile_NodalProp,'wt');
        fid1 = fopen(OutputFile_Num_Coinc,'wt');
        fid2 = fopen(OutputFile_Num_CoincBow,'wt');
    else
        fid = fopen(OutputFile_NodalProp,'w');
        fid1 = fopen(OutputFile_Num_Coinc,'w');
        fid2 = fopen(OutputFile_Num_CoincBow,'w');
    end;
    for i=1:NStruct        
        NodalPropList{i}=[num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i)), ',',num2str(V(i,:))];        
        NodalCoincList{i} = [num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i))];
        NodalCoincListBow{i} = [num2str(StructCodes(i).Code),'  ',num2str(Ncoinc(i))];
        fprintf(fid,'%s  \n',NodalPropList{i});
        fprintf(fid1,'%s  \n',NodalCoincList{i});
        fprintf(fid2,'%s  \n',NodalCoincListBow{i});
    end;
    fclose(fid); fclose(fid1); fclose(fid2);  
end;

if isfield(NetProps{1},'VulnerabilityMat')
    V = zeros(NStruct,NNets);
    for i=1:NNets
        Props = NetProps{i}.VulnerabilityMat;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        Vtord = sort(Props,1,'descend');
        thres = Vtord(N);
        ind = Props>=thres;
        V(ind,i) = Props(ind);
    end;
    Vbin = V>0; Ncoinc = sum(Vbin,2);
    NodalPropList = cell(NStruct,1);
    NodalCoincList = cell(NStruct,1);
    NodalCoincListBow = cell(NStruct,1);
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Vulnerability',OutputFileExt];
    OutputFile_Num_Coinc = [OutputFilePath,filesep,OutputFileName,'_Vulnerability_N_Coincidence',OutputFileExt];
    OutputFile_Num_CoincBow = [OutputFilePath,filesep,OutputFileName,'_Vulnerability_N_Coincidence_brainbow',OutputFileExt];
    if ispc
        fid = fopen(OutputFile_NodalProp,'wt');
        fid1 = fopen(OutputFile_Num_Coinc,'wt');
        fid2 = fopen(OutputFile_Num_CoincBow,'wt');
    else
        fid = fopen(OutputFile_NodalProp,'w');
        fid1 = fopen(OutputFile_Num_Coinc,'w');
        fid2 = fopen(OutputFile_Num_CoincBow,'w');
    end;
    for i=1:NStruct        
        NodalPropList{i}=[num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i)), ',',num2str(V(i,:))];        
        NodalCoincList{i} = [num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i))];
        NodalCoincListBow{i} = [num2str(StructCodes(i).Code),'  ',num2str(Ncoinc(i))];
        fprintf(fid,'%s  \n',NodalPropList{i});
        fprintf(fid1,'%s  \n',NodalCoincList{i});
        fprintf(fid2,'%s  \n',NodalCoincListBow{i});
    end;
    fclose(fid); fclose(fid1); fclose(fid2);   
end;

if isfield(NetProps{1},'CentrBet')
    V = zeros(NStruct,NNets);
    for i=1:NNets
        Props = NetProps{i}.CentrBet;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        Vtord = sort(Props,1,'descend');
        thres = Vtord(N);
        ind = Props>=thres;
        V(ind,i) = Props(ind);
    end;
    Vbin = V>0; Ncoinc = sum(Vbin,2);
    NodalPropList = cell(NStruct,1);
    NodalCoincList = cell(NStruct,1);
    NodalCoincListBow = cell(NStruct,1);
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Centrality',OutputFileExt];
    OutputFile_Num_Coinc = [OutputFilePath,filesep,OutputFileName,'_Centrality_N_Coincidence',OutputFileExt];
    OutputFile_Num_CoincBow = [OutputFilePath,filesep,OutputFileName,'_Centrality_N_Coincidence_brainbow',OutputFileExt];
    if ispc
        fid = fopen(OutputFile_NodalProp,'wt');
        fid1 = fopen(OutputFile_Num_Coinc,'wt');
        fid2 = fopen(OutputFile_Num_CoincBow,'wt');
    else
        fid = fopen(OutputFile_NodalProp,'w');
        fid1 = fopen(OutputFile_Num_Coinc,'w');
        fid2 = fopen(OutputFile_Num_CoincBow,'w');
    end;
    for i=1:NStruct        
        NodalPropList{i}=[num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i)), ',',num2str(V(i,:))];        
        NodalCoincList{i} = [num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i))];
        NodalCoincListBow{i} = [num2str(StructCodes(i).Code),'  ',num2str(Ncoinc(i))];
        fprintf(fid,'%s  \n',NodalPropList{i});
        fprintf(fid1,'%s  \n',NodalCoincList{i});
        fprintf(fid2,'%s  \n',NodalCoincListBow{i});
    end;
    fclose(fid); fclose(fid1); fclose(fid2);  
end;

if isfield(NetProps{1},'MostConnect')
    V = zeros(NStruct,NNets);
    for i=1:NNets
        Props = NetProps{i}.MostConnect; Props = Props(:);
        Vtord = sort(Props,1,'descend');
        thres = Vtord(N);
        ind = Props>=thres;
        V(ind,i) = Props(ind);
    end;
    Vbin = V>0; Ncoinc = sum(Vbin,2);
    NodalPropList = cell(NStruct,1);
    NodalCoincList = cell(NStruct,1);
    NodalCoincListBow = cell(NStruct,1);
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
    OutputFile_Num_Coinc = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght_N_Coincidence',OutputFileExt];
    OutputFile_Num_CoincBow = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght_N_Coincidence_brainbow',OutputFileExt];
    if ispc
        fid = fopen(OutputFile_NodalProp,'wt');
        fid1 = fopen(OutputFile_Num_Coinc,'wt');
        fid2 = fopen(OutputFile_Num_CoincBow,'wt');
    else
        fid = fopen(OutputFile_NodalProp,'w');
        fid1 = fopen(OutputFile_Num_Coinc,'w');
        fid2 = fopen(OutputFile_Num_CoincBow,'w');    
    end;
    for i=1:NStruct        
        NodalPropList{i}=[num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i)), ',',num2str(V(i,:))];
        NodalCoincList{i} = [num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i))];
        NodalCoincListBow{i} = [num2str(StructCodes(i).Code),'  ',num2str(Ncoinc(i))];
        fprintf(fid,'%s  \n',NodalPropList{i});
        fprintf(fid1,'%s  \n',NodalCoincList{i});
        fprintf(fid2,'%s  \n',NodalCoincListBow{i});
    end;
    fclose(fid); fclose(fid1); fclose(fid2); 
end;

if isfield(NetProps{1},'NodeConnection')
    V = zeros(NStruct,NNets);
    for i=1:NNets
        Props = NetProps{i}.NodeConnection; Props = Props(:);
        Vtord = sort(Props,1,'descend');
        thres = Vtord(N);
        ind = Props>=thres;
        V(ind,i) = Props(ind);
    end;
    Vbin = V>0; Ncoinc = sum(Vbin,2);
    NodalPropList = cell(NStruct,1);
    NodalCoincList = cell(NStruct,1);
    NodalCoincListBow = cell(NStruct,1);
    OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
    OutputFile_Num_Coinc = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght_N_Coincidence',OutputFileExt];
    OutputFile_Num_CoincBow = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght_N_Coincidence_brainbow',OutputFileExt];
    if ispc
        fid = fopen(OutputFile_NodalProp,'wt');
        fid1 = fopen(OutputFile_Num_Coinc,'wt');
        fid2 = fopen(OutputFile_Num_CoincBow,'wt'); 
    else
        fid = fopen(OutputFile_NodalProp,'w');
        fid1 = fopen(OutputFile_Num_Coinc,'w');
        fid2 = fopen(OutputFile_Num_CoincBow,'w'); 
    end;
    for i=1:NStruct        
        NodalPropList{i}=[num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i)), ',',num2str(V(i,:))];
        NodalCoincList{i} = [num2str(i) ' -- ' StructCodes(i).Name,' : ', num2str(Ncoinc(i))];
        NodalCoincListBow{i} = [num2str(StructCodes(i).Code),'  ',num2str(Ncoinc(i))];
        fprintf(fid,'%s  \n',NodalPropList{i});
        fprintf(fid1,'%s  \n',NodalCoincList{i});
        fprintf(fid2,'%s  \n',NodalCoincListBow{i});
    end;
    fclose(fid); fclose(fid1); fclose(fid2); 
end;

return;