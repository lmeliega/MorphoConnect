function [data_xls,Area] = Morpho_Network_Props_Area_Computation2XLS(NetworkPropertiesFiles,OutputFolder,All_in_OneFileFlag,isMean,ind2trunc)

% This function computes the Areas under Network properties curves and exports them to XLS file.
% It is perfomed for Global Network properties ... Cluster Index, Characteristic path length, Global and local efficiency.
%
% Lester Melie-Garcia
% Bern, November 21st, 2013

if exist('NetworkPropertiesFiles','var')
    if isempty(NetworkPropertiesFiles)
        NetworkPropertiesFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
    end;
else
    NetworkPropertiesFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);    
end;
if exist('OutputFolder','var')
    if isempty(OutputFolder)
        OutputFolder = spm_select(1,'dir','Output Folder Name ...','',cd);
    end;
else
    OutputFolder = spm_select(1,'dir','Output Folder Name ...','',cd);    
end;
if ~strcmpi(OutputFolder(end),filesep)
    OutputFolder=[OutputFolder,filesep];    
end;

if exist('All_in_OneFileFlag','var')
    if isempty(All_in_OneFileFlag)
        All_in_OneFileFlag = true;
    end;
else
    All_in_OneFileFlag = true;
end;
if exist('isMean','var')
    if isempty(isMean)
        isMean = true;
    end;
else
    isMean = true;
end;

Nbins2Sub = 6; % It should be taken automatically .. (near future)
NetProps_Temp = load(deblank(NetworkPropertiesFiles(1,:)));
NetProps_Temp = NetProps_Temp.NetProps;
if exist('ind2trunc','var')    
    if isempty(ind2trunc)
        ind2trunc = length(NetProps_Temp.ThresBins)-Nbins2Sub;
    end;
else
    ind2trunc = length(NetProps_Temp.ThresBins)-Nbins2Sub;
end;

Ns = size(NetworkPropertiesFiles,1);
Area = cell(Ns,1);
for i=1:Ns
    NetProps = load(deblank(NetworkPropertiesFiles(i,:)));
    NetProps = NetProps.NetProps;
    Area{i} = Area_Computation(NetProps,isMean,ind2trunc);
    [FilePath,FileName] = fileparts(NetworkPropertiesFiles(i,:));
    Area{i}.Name = FileName;
end;

data_xls = Save_Area2XLSFile(Area,OutputFolder,All_in_OneFileFlag);
%disp('Local and Global Efficiencies, Characteristic Path Length, Clustering Index  ... Exporting  Done!');

return;

%% ======  Internal functions ======== %%
% function Area = Area_Computation(NetProps,isMean,ind2trunc)
% 
% if exist('ind2trunc','var')
%     if isempty(ind2trunc)
%         ind2trunc = length(NetProps.ThresBins);
%     end;
% else
%     ind2trunc = length(NetProps.ThresBins);
% end;
% isBinaryGraph = NetProps.isBinaryGraph;
% %% -------- Cluster index --------- %%
% if isfield(NetProps,'Clux')
%     disp('Computing for Cluster Index ...');
%     Clux = NetProps.Clux;
%     if isBinaryGraph
%         Clux = Clux(:,1:ind2trunc);
%         Area.Clux = trapz(Clux,2);
%     else
%         Area.Clux = Clux;
%     end;
%     if isMean
%         Area.Clux = mean(Area.Clux,1);
%     end;    
% end;
% %% -------- Characteristic Path length  --------- %%
% if isfield(NetProps,'CharPathL')
%     disp('Computing for Characteristic Path Length ...');
%     CharPathL = NetProps.CharPathL;
%     if isBinaryGraph
%         CharPathL = CharPathL(:,1:ind2trunc);
%         Area.CharPathL = trapz(CharPathL,2);
%     else
%         Area.CharPathL = CharPathL;
%     end;
%     if isMean
%         Area.CharPathL = mean(Area.CharPathL,1);
%     end;      
% end;
% %% -------- Efficiency  --------- %%
% if isfield(NetProps,'Efficiency')
%     disp('Computing for Global and Local Efficiency ...');
%     Efficiency = NetProps.Efficiency;
%     if isBinaryGraph
%         Eloc  = squeeze(Efficiency(1,:,:));
%         Eglob = squeeze(Efficiency(2,:,:));
%         Eloc  = Eloc(:,1:ind2trunc);
%         Eglob  = Eglob(:,1:ind2trunc);
%         Area.Local_Efficiency = trapz(Eloc,2);
%         Area.Global_Efficiency = trapz(Eglob,2);
%     else
%         Area.Local_Efficiency  = Efficiency(1);
%         Area.Global_Efficiency  = Efficiency(2);
%     end;
%     if isMean
%         Area.Local_Efficiency = mean(Area.Local_Efficiency,1);
%         Area.Global_Efficiency = mean(Area.Global_Efficiency,1);
%     end;     
% end;
% %% -------- Global Connectivity  --------- %%
% if isfield(NetProps,'NodeConnection')
%     disp('Computing for Node Connection ...');
%     NodeConnection = NetProps.NodeConnection;
%     if isMean
%         Area.GlobalConnectivity = mean(NodeConnection(:));
%     else
%         Area.GlobalConnectivity = mean(NodeConnection,1)';
%     end;    
% end;
% %% -------- Target Attack Connectivity  --------- %%
% if isfield(NetProps,'TargetAttack')
%     disp('Computing for Target Attack analysis ...');
%     if isfield(NetProps,'TargetAttackthresbins')
%         t = NetProps.TargetAttackthresbins;
%     else
%         t = 1:size(NetProps.TargetAttack,1); t = t/100;
%     end;
%     t = t(:);
%     TA = squeeze(trapz(t,NetProps.TargetAttack,1));    
%     if isBinaryGraph
%         TA = trapz(TA,2);
%     end;
%     Area.TargetAttack = TA;
%     if isMean
%         Area.TargetAttack = mean(TA);
%     end;
% end;
% %% -------- Small World Parameter  --------- %%
% if isfield(NetProps,'SmallWorld')
%     disp('Computing for Small World Parameter (Sigma) ...');
%     SmallWorldPar = NetProps.SmallWorld;
%     if isBinaryGraph
%         SigmaR  = squeeze(SmallWorldPar(3,:,1:ind2trunc));
%         Area.SmallWorld_Sigma = trapz(SigmaR,2);
%     else
%         Area.SmallWorld_Sigma  = SmallWorldPar(1);
%     end;
%     if isMean
%         Area.SmallWorld_Sigma = mean(Area.SmallWorld_Sigma,1);
%     end;     
% end;
% %% -------- Modularity --------- %%
% if isfield(NetProps,'Modularity')
%     disp('Computing for Modularity Index ...');
%     Modularity = NetProps.Modularity;
%     if isBinaryGraph
%         Modularity = Modularity(:,1:ind2trunc);
%         Area.Modularity = trapz(Modularity,2);
%     else
%         Area.Modularity = Modularity;
%     end;
%     if isMean
%         Area.Modularity = mean(Area.Modularity,1);
%     end;    
% end;
% %% -------- Mean Number of Modules --------- %%
% if isfield(NetProps,'ModulesNumber')
%     disp('Computing for Number of Modules ...');
%     ModulesNumber = NetProps.ModulesNumber;
%     if isBinaryGraph
%         ModulesNumber = ModulesNumber(:,1:ind2trunc);
%         Area.ModulesNumber = mean(ModulesNumber,2);
%     else
%         Area.ModulesNumber = ModulesNumber;
%     end;
%     if isMean
%         Area.ModulesNumber = mean(Area.Modularity(:));
%     end;    
% end;
% %% -------- Connection between homologous structures -------- %%
% if isfield(NetProps,'HomologousStructConnection')
%     disp('Computing for Connection between Homologous structures ...');
%     if isMean
%         Area.HomologousStructConnection = NetProps.HomologousStructConnection;
%     else
%         Area.HomologousStructConnection = NetProps.HomologousStructConnection;
%     end;    
% end;
% 
% return;

%% ================ %
function data_xls = Save_Area2XLSFile(Area,OutputFolder,All_in_OneFileFlag)

Ns = length(Area); % Number of subjects or groups.
PropsNames = fieldnames(Area{1});
NFields = length(PropsNames)-1;
Nrep = length(getfield(Area{1},PropsNames{1})); %#ok
 
PropsNames = fieldnames(Area{1});
data_xls = cell(Ns*Nrep+1, NFields+1);
data_xls{1,1} = 'Group';
for i=1:NFields
    data_xls{1,i+1} = PropsNames{i};
end;
for j=1:NFields
    for i=1:Ns
        fieldExist = isfield(Area{i},PropsNames{j});
        if fieldExist
            X = getfield(Area{i},PropsNames{j}); %#ok
        else
            X = zeros(Nrep,1);
        end;
        for k=1:Nrep
            data_xls{(i-1)*Nrep+k+1,1} = Area{i}.Name;
            data_xls{(i-1)*Nrep+k+1,j+1} = X(k);
        end;
    end;
end;
if All_in_OneFileFlag
    OutName = [OutputFolder,'All_Netprops','.xls'];
    disp(['Saving Network attributes to the File: ',OutName,' ...']);
    xlswrite(OutName,data_xls, 'Data');
    disp(['Saving Network attributes to the File: ',OutName,' ... Done !']);
else
    disp('Saving Network attributes to different Files ...');
    for i=1:NFields
        OutName = [OutputFolder,'All_',PropsNames{i},'.xls'];
        data1 = data_xls(:,[1,i+1]);
        disp(['Saving ',OutName,'  ...']);
        xlswrite(OutName,data1, 'Data');
    end;
    disp('Saving Network attributes to different Files ... Done !');
end;

return;

%%
% function Save_Area2File(Area,OutputFolder,All_in_OneFileFlag)
% 
% Ns = length(Area);
% if All_in_OneFileFlag    
%     PropsNames = fieldnames(Area{1});
%     for j=1:length(PropsNames)-1
%         for i=1:Ns            
%             X(:,i)= getfield(Area{i},PropsNames{j}); %#ok
%         end;
%         OutName = [OutputFolder,'All_',PropsNames{j},'.txt'];
%         save(OutName,'X','-ascii');
%     end;
% else 
%     for i=1:Ns
%         PropsNames = fieldnames(Area{i});
%         for j=1:length(PropsNames)-1
%             OutName = [OutputFolder,PropsNames{j},'_',Area{i}.Name,'.txt'];
%             fid = fopen(OutName,'wt');
%             X = getfield(Area{i},PropsNames{j}); %#ok
%             fprintf(fid,'%12.8f\n',X);
%             fclose(fid);
%         end;
%     end;
% end;