function data_xls = Export_ModulesConnectivity2XLS(ConnectivityModuleFiles,OutputFolder)

%% Lester Melie Garcia
% LREN, Lausanne
% March 24th, 2016

if exist('ConnectivityModuleFiles','var')
    if isempty(ConnectivityModuleFiles)
        ConnectivityModuleFiles = spm_select([1,Inf],'mat','Loading Modules Connectivity Files ...','',cd);
    end;
else
    ConnectivityModuleFiles = spm_select([1,Inf],'mat','Loading Modules Connectivity Files ...','',cd);  
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

ConMat = load(deblank(ConnectivityModuleFiles(1,:)));
Structures = ConMat.ConnectMatrix.Structures;

Ng = size(ConnectivityModuleFiles,1); 
InterConn = cell(Ng,1); FileNames = cell(Ng,1);
for i=1:Ng
    ConMat = load(deblank(ConnectivityModuleFiles(i,:)));
    ConMat = ConMat.ConnectMatrix.ConMat;
    InterConn{i} = getInterConnectivity(ConMat);
    [~,FileNames{i}] = fileparts(deblank(ConnectivityModuleFiles(i,:))); 
end;
InterLobesLabels = getLobesLabels(Structures);

data_xls = Save_2XLSFile(InterConn,InterLobesLabels,FileNames,OutputFolder);

end

%% =============== Internal Functions =============== %%
function InterConn = getInterConnectivity(ConMat)

[N,~,Nrep] = size(ConMat); 
M = 0.5*N*(N-1) + N;
InterConn = zeros(Nrep,M);
for i=1:N
    Y = ConMat(i,i,:); 
    InterConn(:,i) = Y(:); 
end;
c = N;
for i=1:N
    for j=i+1:N
        c = c + 1;
        Y = ConMat(i,j,:); 
        InterConn(:,c) = Y(:);
    end;
end;

end

%% InterLobesLabels = getLobesLabels(Structures)
function InterLobesLabels = getLobesLabels(Structures)

N =  length(Structures);
M = 0.5*N*(N-1) + N;
LobesLabels = cell(N,1);
for i=1:N
    LobesLabels{i} = Structures(i).Name;
end;

InterLobesLabels = cell(M,1);
InterLobesLabels(1:N) = LobesLabels; 
c = N;
for i=1:N
    for j=i+1:N
        c = c + 1;
        InterLobesLabels{c} = [LobesLabels{i},'-',LobesLabels{j}]; 
    end;
end;

end

%% data_xls = Save_2XLSFile(Connects,OutputFolder)
function data_xls = Save_2XLSFile(InterConn,InterLobesLabels,FileNames,OutputFolder)

Ns = length(InterConn); % Number of subjects or groups.
Nf = length(InterLobesLabels);

Nt = 0;
for i=1:Ns
    Nt = Nt + size(InterConn{i},1);
end;
data_xls = cell(Nt+1,Nf+1);
data_xls{1,1} = 'Group';
data_xls(1,2:end) = InterLobesLabels;

Group = cell(size(InterConn{1},1),1);
Group(1:end) = FileNames(1);
I = InterConn{1};
for i=2:Ns
    G = cell(size(InterConn{i},1),1);
    G(1:end) = FileNames(i);
    Group = vertcat(Group,G); %#ok
    I = [I;InterConn{i}]; %#ok
end;

I = mat2cell(I,ones(size(I,1),1),ones(size(I,2),1)); %#ok

data_xls(2:end,1) = Group;
data_xls(2:end,2:end) = I;

OutName = [OutputFolder,'All_Lobes_Connections','.xls'];
disp(['Saving Lobes Connections in File: ',OutName,' ...']);
xlswrite(OutName,data_xls, 'Data');
disp(['Saving Lobes Connections in File: ',OutName,' ...',' ... Done !']);

end