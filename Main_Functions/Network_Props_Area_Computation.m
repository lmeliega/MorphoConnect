function Area = Network_Props_Area_Computation(NetworkPropertiesFiles,OutputFolder,ind2trunc)

%
%
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% June 29th, 2011.

if exist('NetPropsFiles','var')
    if isempty(NetPropsFiles)
        NetworkPropertiesFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);
    end;
else
    NetworkPropertiesFiles = spm_select([1,Inf],'mat','Loading Netprops Files ...','',cd);    
end;

if exist('OutputFolderName','var')
    if isempty(NetPropsFiles)
        OutputFolder = spm_select(1,'dir','Loading OutputFolder ...','',cd);
    end;
else
    OutputFolder = spm_select(1,'dir','Loading OutputFolder ...','',cd);
end;

NNets = size(NetworkPropertiesFiles,1);
NetPropsT = cell(NNets,1);
for i=1:NNets
    NetProps_temp = load(deblank(NetworkPropertiesFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetPropsT{i} = NetProps_temp;
end;
Nthres = length(NetPropsT{1}.ThresBins);

if exist('ind2trunc','var')
    if isempty(ind2trunc)
        ind2trunc = length(NetProps_temp.ThresBins);
    end;
else
    ind2trunc = length(NetProps_temp.ThresBins);
end;

%% -------- Cluster index --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Clux');
end;
if c
    disp('Computing for Cluster Index ...');
    Clux = zeros(NNets,Nthres);
    for i=1:NNets
        Clux(i,:) = NetPropsT{i}.Clux;
    end;
    Clux = Clux(:,1:ind2trunc);
    Area.Clux = trapz(Clux,2);
    OutName = [OutputFolder,filesep,'Clux.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Area.Clux);
    fclose(fid);
    disp('Cluster Index ...  Done!');
end;
%% -------- Characteristic Path length  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'CharPathL');
end;
if c
    disp('Computing for Characteristic Path Length ...');
    CharPathL = zeros(NNets,Nthres);
    for i=1:NNets
        CharPathL(i,:) = NetPropsT{i}.CharPathL;
    end;
    CharPathL = CharPathL(:,1:ind2trunc);
    Area.CharPathL = trapz(CharPathL,2);
    OutName = [OutputFolder,filesep,'CharPathL.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Area.CharPathL);
    fclose(fid);
    disp('Characteristic Path Length ...  Done!');
end;

%% -------- Efficiency  --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetPropsT{i},'Efficiency');
end;
if c
    disp('Computing for Efficiency ...');
    s = size(NetPropsT{1}.Efficiency);
    Efficiency = zeros(s(1),NNets,s(3));
    for i=1:NNets
        Efficiency(:,i,:) = NetPropsT{i}.Efficiency;
    end;
    Eloc  = squeeze(Efficiency(1,:,:));
    Eglob = squeeze(Efficiency(2,:,:));
    Eloc  = Eloc(:,1:ind2trunc);
    Eglob  = Eglob(:,1:ind2trunc);
    Area.Eloc = trapz(Eloc,2);
    Area.Eglob = trapz(Eglob,2);
    OutName = [OutputFolder,filesep,'Local_Efficiency.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Area.Eloc);
    fclose(fid);
    OutName = [OutputFolder,filesep,'Global_Efficiency.txt'];
    fid = fopen(OutName,'wt');
    fprintf(fid,'%12.8f\n',Area.Eglob);
    fclose(fid);
    disp('Efficiency ...  Done!');
end;

return;