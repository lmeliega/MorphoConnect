function Export_Netprops_txt_Files(NetPropsFiles,OutputFolderName)

%%  
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, May 31st, 2011

if exist('NetPropsFiles','var')
    if isempty(NetPropsFiles)
        NetPropsFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
    end;
else
    NetPropsFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
end;

if exist('OutputFolderName','var')
    if isempty(NetPropsFiles)
        OutputFolderName = spm_select(1,'dir','Loading OutputFolder ...','',cd);
    end;
else
    OutputFolderName = spm_select(1,'dir','Loading OutputFolder ...','',cd);
end;
    
FolderName = 'ExportedNetProps';
mkdir(OutputFolderName,FolderName);
OutputFolder = [OutputFolderName,FolderName];

NNets = size(NetPropsFiles,1);
NetPropsT = cell(NNets,1);
for i=1:NNets
    NetProps_temp = load(deblank(NetPropsFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetPropsT{i} = NetProps_temp;
end;

Nthres = size(NetPropsT{1}.thresh,2);

%% -------- Cluster index --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Clux');
end;
if c
    disp('For Cluster Index ...');
    Clux = zeros(NNets,Nthres);
    for i=1:NNets
        Clux(i,:) = NetPropsT{i}.Clux;
    end;
    OutName = [OutputFolder,filesep,'Clux.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Clux);
    fclose(fid);
    disp('Cluster Index ...  Done!');    
end;

%% --------  Nodal Clustering index  --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'NodalClux');
% end;
% if c
%     disp('Merging for Nodal Clustering index  ...');
%     s = size(NetPropsT{1}.NodalClux);
%     NodalClux = zeros(s(1),NNets,s(3));
%     for i=1:NNets
%         NodalClux(:,i,:) = NetPropsT{i}.NodalClux;
%     end;
%     NetProps.NodalClux = NodalClux;
%     disp('Nodal Clustering index ...  Done!');    
% end;

%% -------- Characteristic Path length  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'CharPathL');
end;
if c
    disp('Characteristic Path Length ...');
    CharPathL = zeros(NNets,Nthres);
    for i=1:NNets
        CharPathL(i,:) = NetPropsT{i}.CharPathL;
    end;
    OutName = [OutputFolder,filesep,'CharPathL.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',CharPathL);
    fclose(fid);    
    disp('Characteristic Path Length ...  Done!');    
end;

%% -------- Efficiency  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Efficiency');
end;
if c
    disp('For Efficiency ...');
    s = size(NetPropsT{1}.Efficiency);
    if length(s)<3
        Efficiency = zeros(s(1),NNets);
    else
        Efficiency = zeros(s(1),NNets,s(3));
    end;
    for i=1:NNets
        Efficiency(:,i,:) = NetPropsT{i}.Efficiency;
    end;
    Eloc  = Efficiency(1,:,:); Eloc = Eloc';
    Eglob = Efficiency(2,:,:); Eglob = Eglob';
    OutName = [OutputFolder,filesep,'Local_Efficiency.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Eloc);    
    fclose(fid);
    OutName = [OutputFolder,filesep,'Global_Efficiency.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Eglob);    
    fclose(fid); 
    disp('Efficiency ...  Done!');
end;

%[Eloc;Eglobal;rEloc;rEglobal];
% [gamna;lambda;sigma];

%% -------- Nodal Efficiency  --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'NodalEfficiency');
% end;
% if c
%     disp('Merging for Nodal Efficiency ...');
%     s = size(NetPropsT{1}.NodalEfficiency);
%     NodalEfficiency = zeros(s(1),NNets,s(3));
%     for i=1:NNets
%         NodalEfficiency(:,i,:) = NetPropsT{i}.NodalEfficiency;
%     end;
%     NetProps.NodalEfficiency = NodalEfficiency;
%     disp('Nodal Efficiency ...  Done!');
% end;

%% -------- Vulnmaxnode --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'Vulnmaxnode');
% end;
% if c
%     disp('Merging for Vulnerability ...');
%     s = size(NetPropsT{1}.Vulnmaxnode);
%     Vulnmaxnode = zeros(NNets,s(2),s(3));
%     for i=1:NNets
%         Vulnmaxnode(i,:,:) = NetPropsT{i}.Vulnmaxnode;
%     end;
%     NetProps.Vulnmaxnode = Vulnmaxnode;
%     disp('Vulnerability ...  Done!');
% end;

%% -------- VulnerabilityMat --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'VulnerabilityMat');
% end;
% if c
%     s = size(NetPropsT{1}.VulnerabilityMat);
%     VulnerabilityMat = zeros(s(1),NNets,s(3));
%     for i=1:NNets
%         VulnerabilityMat(:,i,:) = NetPropsT{i}.VulnerabilityMat;
%     end;
%     NetProps.VulnerabilityMat = VulnerabilityMat;
% end;

%% -------- CentrBet --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'CentrBet');
% end;
% if c
%     disp('Merging for Centrality ...');
%     s = size(NetPropsT{1}.CentrBet);
%     CentrBet = zeros(s(1),NNets,s(3));
%     for i=1:NNets
%         CentrBet(:,i,:) = NetPropsT{i}.CentrBet;
%     end;
%     NetProps.CentrBet = CentrBet;
%     disp('Centrality ...  Done!');
% end;

%% -------- CentrBetNorm --------- %%
% c = true;
% for i=1:NNets
%     c = c&&isfield(NetPropsT{i},'CentrBetNorm');
% end;
% if c
%     disp('Merging for Normalized Centrality ...');
%     s = size(NetPropsT{1}.CentrBet);
%     CentrBetNorm = zeros(s(1),NNets,s(3));    
%     for i=1:NNets
%         CentrBetNorm(:,i,:) = NetPropsT{i}.CentrBetNorm;
%     end;
%     NetProps.CentrBetNorm = CentrBetNorm;
%     disp('Normalized Centrality ...  Done!');
% end;

return;