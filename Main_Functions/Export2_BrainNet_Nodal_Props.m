function Export2_BrainNet_Nodal_Props(NetProps,Structures,Centroids,OutputFolder)

%% This function exports nodal attributes to BrainNet plotting format.
%  This can be used for plotting hubs structures using the input parameter 'thres' to thres = 1.5 or 2.0.  
%
% Input Parametes:
%     NetProps : Network properties Files. These could be also Files coming from Nodal attributes statistics.
%   Structures : Filename or Struct with the anatomical structures' information.
%    Centroids : Filename or matrix providing the centroid information of the anatomical structures.
%   OutputFolder : Output Folder where Brainnet files will be saved (*.node)
%
%% Lester Melie-Garcia
% La Habana, February 15th, 2014

if exist('NetProps','var')
    if isempty(NetProps)
        NetProps = spm_select([1,Inf],'mat','Select NetProps File ...','',cd);
    end;
else
     NetProps = spm_select([1,Inf],'mat','Select NetProps File ...','',cd);
end;
% if exist('Structures','var')
%     if isempty(Structures)
%         Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
%     end;
% else
%      Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
% end;
% if ischar(Structures)
%     Structures = ReadCodeFile(Structures);
% end;
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
disp(['Exported Files will be saved in: ',OutputFolder]);
Nfiles = size(NetProps,1);
NetPropsT = cell(Nfiles,1);
FileNames = cell(Nfiles,1);
if ischar(NetProps)
    for i=1:Nfiles
        NetPropsTemp = load(deblank(NetProps(i,:)));
        if isfield(NetPropsTemp,'Stats')
            NetPropsT{i} = NetPropsTemp.Stats;
        else
            NetPropsT{i} = NetPropsTemp.NetProps;
        end;        
        [FilePath,FileNames{i}] = fileparts(deblank(NetProps(i,:)));
    end;    
    NetProps = NetPropsT;
end;

if ~exist('Structures','var')
    Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
end;
if ischar(Structures)&&(~isempty(Structures))
    Structures = ReadCodeFile(Structures);
end;

%% Nodal Clustering index
disp('Exporting Clustering Index to BrainNet format ...');
NetPropName = 'NodalClux';
wasSaved = saveNodeFile(NetProps,NetPropName,OutputFolder,FileNames,Centroids,Structures);
if wasSaved
    disp('Exporting Clustering Index to BrainNet format ... Done!');
end;
%% Nodal Efficiency
disp('Exporting Nodal Efficiency to BrainNet format ...');
NetPropName = 'NodalEfficiency';
wasSaved = saveNodeFile(NetProps,NetPropName,OutputFolder,FileNames,Centroids,Structures);
if wasSaved
    disp('Exporting Nodal Efficiency to BrainNet format ... Done!');
end;
%% Nodal Betweenness Centrality
disp('Exporting Nodal Betweenness Centrality to BrainNet format ...');
NetPropName = 'CentrBet';
wasSaved = saveNodeFile(NetProps,NetPropName,OutputFolder,FileNames,Centroids,Structures);
if wasSaved
    disp('Exporting Nodal Betweenness Centrality to BrainNet format ... Done!');
end;
%% Nodal Normalized Betweenness Centrality
disp('Exporting Nodal Normalized Betweenness Centrality to BrainNet format ...');
NetPropName = 'CentrBetNorm';
wasSaved = saveNodeFile(NetProps,NetPropName,OutputFolder,FileNames,Centroids,Structures);
if wasSaved
    disp('Exporting Nodal Normalized Betweenness Centrality to BrainNet format ... Done!');
end;
%% Nodal Strength Connection
disp('Exporting Nodal Strength Connection to BrainNet format ...');
NetPropName = 'NodeConnection';
wasSaved = saveNodeFile(NetProps,NetPropName,OutputFolder,FileNames,Centroids,Structures);
if wasSaved
    disp('Exporting Nodal Strength Connection to BrainNet format ... Done!');
end;

return;

%% =======   Internal Functions    =======%%
function wasSaved = saveNodeFile(NetPropsT,NetPropName,OutputFolder,FileNames,Centroids,Structures)

Nfiles = size(NetPropsT,1);
for j=1:Nfiles
    FileName = FileNames{j};    
    if isfield(NetPropsT{j},NetPropName)
        if ~isempty(getfield(NetPropsT{j},NetPropName))
            if isempty(Structures)
                Structures = NetPropsT{j}.Structures;
            end;
            OutputFile = [OutputFolder,FileName,'_',NetPropName,'.node'];
            if isfield(NetPropsT{j},'isStats') % For nodal statistics files.
                NP = getfield(NetPropsT{j},['Diff',NetPropName]); %#ok
                indstruct = find(getfield(NetPropsT{j},NetPropName)); %#ok
                NP = NP(indstruct);
                NStruct = length(NP);
            else
                % For standard Nodal attributes files.
                NP = getfield(NetPropsT{j},NetPropName); %#ok
                [NStruct,Nboot,Nthres] = size(NP);
                if size(NP,3)>1
                    NP = reshape(NP,[NStruct,Nthres*Nboot]);
                end;
                NP = mean(NP,2);
                indstruct = 1:NStruct;
            end;
            fid = fopen(OutputFile,'wt');
            Text2File = cell(NStruct,1);
            node_color = 4; node_color_neg = 5;
            CC = node_color*ones(NStruct,1);
            indneg = (NP<0); % Finding negative values in nodal network attribute to change the color.
            if sum(indneg)>0
                CC(indneg)= node_color_neg;
            end;
            NP = abs(NP);
            for i=1:NStruct
                Text2File{i} =[num2str(Centroids(indstruct(i),1)),' ',num2str(Centroids(indstruct(i),2)),' ',num2str(Centroids(indstruct(i),3)),' ', ...
                    num2str(CC(i)),' ',num2str(NP(i)),' ',Structures(indstruct(i)).Name];
            end;
            for i=1:NStruct
                fprintf(fid,'%s  \r',Text2File{i});
            end;
            fclose(fid);
            wasSaved = true;
        else
            disp(['The nodal attribute ',NetPropName,' is empty ... for ',FileName]);
            wasSaved = false;
        end;        
    else
        disp(['The nodal attribute ',NetPropName,' doesnt exist ... for ',FileName]);
        wasSaved = false;
    end;
end;

return;



