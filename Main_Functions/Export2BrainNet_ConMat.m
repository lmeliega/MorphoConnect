function Export2BrainNet_ConMat(ConMats,Centroids,Structures,Ni,OutputFolder)

%% This function exports nodal attributes to BrainNet plotting format.
%  This can be used for plotting hubs structures using the input parameter 'thres' to thres = 1.5 or 2.0.  
%
% Input Parametes:
%        ConMats : File containing Connectivity matrices or results coming
%                  from statistical differences between connectivity matrices. ('Z' matrices)
%     Structures : Filename or Struct with the anatomical structures' information.
%      Centroids : Filename or matrix providing the centroid information of the anatomical structures.
%            Ni  : Number of strongest connections. If Ni='all', all connections will be saved. If Ni='' (empty) or not defined the
%                  500 strongest connections will be saved to be plot in BrainNet.
%   OutputFolder : Output Folder where Brainnet files will be saved (*.node; *.edge)
%
%% Lester Melie-Garcia
% La Habana, February 16th, 2014

if exist('ConMats','var')
    if isempty(ConMats)
        ConMats = spm_select([1,Inf],'mat','Select Connectivity (or ConMat Statistics) Files ...','',cd);
    end;
else
     ConMats = spm_select([1,Inf],'mat','Select Connectivity (or ConMat Statistics) Files ...','',cd);
end;
if ~exist('Structures','var')
    Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
    Structures = ReadCodeFile(Structures);
end;
if ischar(Structures)&&(~isempty(Structures))
    Structures = ReadCodeFile(Structures);
end;
if exist('Centroids','var')
    if isempty(Centroids)
        Centroids = spm_select(1,'txt','Select Parcellation Centroid File ...','',cd);
    end;
else
     Centroids = spm_select(1,'txt','Select Parcellation Centroid File ...','',cd);
end;
if ischar(Centroids)
    Centroids = load(Centroids);
end;
if exist('OutputFolder','var')
    if isempty(OutputFolder)
        OutputFolder = uigetdir(cd, 'Select Folder to save BrainNet Files');
    end;
else
    OutputFolder = uigetdir(cd, 'Select Folder to save BrainNet Files');
end;
if ~strcmpi(OutputFolder(end),filesep)
    OutputFolder=[OutputFolder,filesep];    
end;

if exist('Ni','var')
    if isempty(Ni)
        Ni = 500;
    end;
else
     Ni = 500;
end;

saveNodeFile(ConMats,OutputFolder,Centroids,Structures,Ni);

return;

%% =======   Internal Functions    =======%%
function saveNodeFile(ConMats,OutputFolder,Centroids,Structures,Ni)

Nfiles = size(ConMats,1);
ConMatsT = cell(Nfiles,1);
FileNames = cell(Nfiles,1);
isBinary = false;
isWeakestConnections = false;

if ischar(ConMats)
    for i=1:Nfiles
        ConMatsTemp = load(deblank(ConMats(i,:)));
        if isfield(ConMatsTemp,'NetProps')
            ConMatsT{i} = ConMatsTemp.NetProps;
        else
            ConMatsT{i} = ConMatsTemp.ConnectMatrix;
        end;        
        [FilePath,FileNames{i}] = fileparts(deblank(ConMats(i,:)));
    end;    
    ConMats = ConMatsT;
end;

for j=1:Nfiles
    FileName = FileNames{j};
    OutputFile_Node = [OutputFolder,FileName,'_Node.node'];
    OutputFile_Edge = [OutputFolder,FileName,'_Edge.edge'];
    if isfield(ConMats{j},'Z')||isfield(ConMats{j},'ConMat')
        if isempty(Structures)
            Structures = ConMats{j}.Structures;
        end;
        if isfield(ConMats{j},'Z')
            ConMat = (ConMats{j}.Z).*(ConMats{j}.ConMat); % ConMats{j}.ConMat : Here the significant Z values are used.
            Conn = sum(ConMats{j}.ConMat,2);
            if ~ischar(Ni)
                ConMat = MakeConnectionsList(ConMat, Structures, Ni, isBinary, isWeakestConnections, '');
                ConMat = ConMat + ConMat';
            end;
            ind = find(sum(abs(ConMat),2)>0);
        else
            ConMat = ConMats{j}.ConMat;
            if size(ConMat,3)>1
                ConMat = mean(ConMat,3);
            end;
            if ~ischar(Ni)
                ConMat = MakeConnectionsList(ConMat, Structures, Ni, isBinary, isWeakestConnections, '');
                ConMat = ConMat + ConMat';
            end;
            Conn = sum(abs(ConMat),2)/(size(ConMat,1)-1);
            ind = find(Conn>0);
        end;        
        NStruct = length(ind);
        Conn = Conn(ind); Conn = Conn(:);
        ConMat = double(ConMat(ind,ind)); %#ok
        % Saving BrainNet *.node file.
        fid = fopen(OutputFile_Node,'wt');
        Text2File = cell(NStruct,1);
        node_color = 4;
        CC = node_color*ones(NStruct,1);        
        for i=1:NStruct
            Text2File{i} =[num2str(Centroids(ind(i),1)),' ',num2str(Centroids(ind(i),2)),' ',num2str(Centroids(ind(i),3)),' ', ...
                           num2str(CC(i)),' ',num2str(Conn(i)),' ',Structures(ind(i)).Name];
        end;
        for i=1:NStruct
            fprintf(fid,'%s  \r',Text2File{i});
        end;
        fclose(fid);
        disp(['File: ',OutputFile_Node,'... saved']);
        % Saving BrainNet *.edge file.        
        save(OutputFile_Edge,'ConMat','-ascii','-tabs');
        disp(['File: ',OutputFile_Edge,'... saved']);
    else
        disp(['The Connectivity Matrix is not defined in ',FileName,' ...']);
    end;
end;

return;