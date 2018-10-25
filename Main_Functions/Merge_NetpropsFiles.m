function NetProps = Merge_NetpropsFiles(NetPropsFiles,OutputFileName)

%%  This function merges Network Properties Files
%  Input Parameters:
%     NetPropsFiles : Network Properties Files.
%    OutputFileName : Name of Output File where the merged Network attributes will be saved. It could not be defined from the beginning.
%
%  Output Parameters:
%        NetProps : Struct variable containing the merged information contained in the input Network attributes Files.
%
%% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, May 23rd, 2011

if exist('NetPropsFiles','var')
    if isempty(NetPropsFiles)
        NetPropsFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
    end;
else
    NetPropsFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
end;
if exist('OutputFileName','var')
    if isempty(OutputFileName)
        [OutputFile,OutPathName] = uiputfile('*.mat', 'File where Merged NetProps Information is saved ...');
        OutputFileName = [OutPathName,OutputFile];
    end;
else
    [OutputFile,OutPathName] = uiputfile('*.mat', 'File where Merged NetProps Information is saved ...');
    OutputFileName = [OutPathName,OutputFile];
end;

NNets = size(NetPropsFiles,1);
NetPropsT = cell(NNets,1);
for i=1:NNets
    NetProps_temp = load(deblank(NetPropsFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetPropsT{i} = NetProps_temp;
end;
Nthres = size(NetPropsT{1}.thresh,2);

%% -------- threshold  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'thresh');
end;
if c
    disp('Merging for threshold ...');
    NetProps.thresh = NetPropsT{1}.thresh;
    disp('threshold ...  Done!');    
end;
%% -------- threshold bins --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'ThresBins');
end;
if c
    NetProps.ThresBins = NetPropsT{1}.ThresBins;
end;
%% -------- logNnodes --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'logNnodes');
end;
if c
    NetProps.logNnodes = NetPropsT{1}.logNnodes;
end;
%% -------- WhichHemifield --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'WhichHemifield');
end;
if c
    NetProps.WhichHemifield = NetPropsT{1}.WhichHemifield;
end;
%% -------- Cluster index --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Clux');
end;
if c
    disp('Merging for Cluster Index ...');
    Clux = zeros(NNets,Nthres);
    for i=1:NNets
        Clux(i,:) = mean(NetPropsT{i}.Clux,1);
    end;
    NetProps.Clux = Clux;
    disp('Cluster Index ...  Done!');    
end;
%% --------  Nodal Clustering index  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'NodalClux');
end;
if c
    disp('Merging for Nodal Clustering index  ...');
    s = size(NetPropsT{1}.NodalClux);
    if length(s)==2
        s(3) = 1;
    end;
    NodalClux = zeros(s(1),NNets,s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            NodalClux(:,i,:) = squeeze(mean(NetPropsT{i}.NodalClux,2));
        else
            NodalClux(:,i,:) = NetPropsT{i}.NodalClux;
        end;
    end;
    NetProps.NodalClux = NodalClux;
    disp('Nodal Clustering index ...  Done!');    
end;
%% -------- Characteristic Path length  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'CharPathL');
end;
if c
    disp('Merging for Characteristic Path Length ...');
    CharPathL = zeros(NNets,Nthres);
    for i=1:NNets
        CharPathL(i,:) = mean(NetPropsT{i}.CharPathL,1);
    end;
    NetProps.CharPathL = CharPathL;
    disp('Characteristic Path Length ...  Done!');    
end;
%% -------- Efficiency  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Efficiency');
end;
if c
    disp('Merging for Efficiency ...');
    s = size(NetPropsT{1}.Efficiency);
    if length(s)<3
        s(3) = 1;
    end;
    Efficiency = zeros(s(1),NNets,s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            Efficiency(:,i,:) = squeeze(mean(NetPropsT{i}.Efficiency,2));
        else
            Efficiency(:,i,:) = NetPropsT{i}.Efficiency;
        end;
    end;
    NetProps.Efficiency = Efficiency;
    disp('Efficiency ...  Done!');
end;
%% -------- Nodal Efficiency  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'NodalEfficiency');
end;
if c
    disp('Merging for Nodal Efficiency ...');
    s = size(NetPropsT{1}.NodalEfficiency);
    if length(s)==2
        s(3) = 1;
    end;
    NodalEfficiency = zeros(s(1),NNets,s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            NodalEfficiency(:,i,:) = squeeze(mean(NetPropsT{i}.NodalEfficiency,2));
        else
            NodalEfficiency(:,i,:) = NetPropsT{i}.NodalEfficiency;
        end;
    end;
    NetProps.NodalEfficiency = NodalEfficiency;
    disp('Nodal Efficiency ...  Done!');
end;
%% -------- Vulnmaxnode --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Vulnmaxnode');
end;
if c
    disp('Merging for Vulnerability ...');
    s = size(NetPropsT{1}.Vulnmaxnode);
    if length(s)==2
        s(3) = 1;
    end;
    Vulnmaxnode = zeros(NNets,s(2),s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            Vulnmaxnode(i,:,:) = squeeze(mean(NetPropsT{i}.Vulnmaxnode,1));
        else
            Vulnmaxnode(i,:,:) = NetPropsT{i}.Vulnmaxnode;
        end;
    end;
    NetProps.Vulnmaxnode = Vulnmaxnode;
    disp('Vulnerability ...  Done!');
end;
%% -------- VulnerabilityMat --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'VulnerabilityMat');
end;
if c
    s = size(NetPropsT{1}.VulnerabilityMat);
    if length(s)==2
        s(3) = 1;
    end;
    VulnerabilityMat = zeros(s(1),NNets,s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            VulnerabilityMat(:,i,:) = squeeze(mean(NetPropsT{i}.VulnerabilityMat,2));
        else
            VulnerabilityMat(:,i,:) = NetPropsT{i}.VulnerabilityMat;
        end;
    end;
    NetProps.VulnerabilityMat = VulnerabilityMat;
end;
%% -------- CentrBet --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'CentrBet');
end;
if c
    disp('Merging for Centrality ...');
    s = size(NetPropsT{1}.CentrBet);
    if length(s)==2
        s(3) = 1;
    end;
    CentrBet = zeros(s(1),NNets,s(3));
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            CentrBet(:,i,:) = squeeze(mean(NetPropsT{i}.CentrBet,2));
        else
            CentrBet(:,i,:) = NetPropsT{i}.CentrBet;
        end;
    end;
    NetProps.CentrBet = CentrBet;
    disp('Centrality ...  Done!');
end;
%% -------- CentrBetNorm --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'CentrBetNorm');
end;
if c
    disp('Merging for Normalized Centrality ...');
    s = size(NetPropsT{1}.CentrBet);
    if length(s)==2
        s(3) = 1;
    end;
    CentrBetNorm = zeros(s(1),NNets,s(3));    
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            CentrBetNorm(:,i,:) = squeeze(mean(NetPropsT{i}.CentrBetNorm,2));
        else
            CentrBetNorm(:,i,:) = NetPropsT{i}.CentrBetNorm;
        end;
    end;
    NetProps.CentrBetNorm = CentrBetNorm;
    disp('Normalized Centrality ...  Done!');
end;
%% -------- Node Connection --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'NodeConnection');
end;
if c
    disp('Merging for Node Connection ...');
    s = size(NetPropsT{1}.NodeConnection);
    NodeConnection = zeros(s(1),NNets);    
    for i=1:NNets
        NodeConnection(:,i) = mean(NetPropsT{i}.NodeConnection,2);
    end;
    NetProps.NodeConnection = NodeConnection;
    disp('Node Connection ...  Done!');
end;
%% -------- isBinaryGraph --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'isBinaryGraph');
end;
if c
    NetProps.isBinaryGraph = NetPropsT{1}.isBinaryGraph;
end;
%% -------- ConMat --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'ConMat');
end;
if c
    disp('Merging Connectivity Matrices ...');
    s = size(NetPropsT{1}.ConMat);
    if length(s)<4
        s(4) = 1;
    end;
    ConMat = zeros(s(1),s(2),NNets,s(4));      
    for i=1:NNets
        if NetPropsT{i}.Nwins>1
            ConMat(:,:,i,:) = squeeze(mean(NetPropsT{i}.ConMat,3));
        else
            ConMat(:,:,i,:) = NetPropsT{i}.ConMat;
        end;
    end;
    NetProps.ConMat = ConMat;
    disp('Connectivity Matrices ...  Done!');
end;
if isfield(NetPropsT{1},'Structures')
    NetProps.Structures = NetPropsT{1}.Structures;
elseif isfield(C.ConnectMatrix,'montage')
    NetProps.montage = NetPropsT{1}.montage;
end;
NetProps.Structures = NetPropsT{1}.Structures;
NetProps.NSubj = NNets;
NetProps.Name =  OutputFileName;
NetProps.MergedFiles = NetPropsFiles;
NetProps.info = 'Merged Network properties Variable ...';
NetProps.date = date;

save(OutputFileName,'NetProps','-mat');

return;