function ConnectMatrix = Merge_ConnectMatrixFiles(ConMatrixFiles,OutputFileName)

%%  This function merges Network Properties Files
%  Input Parameters:
%     ConMatrixFiles : Connectivity Matrices Files
%    OutputFileName : Name of Output File where the merged Connectivity Matrices will be saved. It could not be defined from the beginning.
%
%  Output Parameters:
%        NetProps : Struct variable containing the merged information coming from the input Network attributes Files.
%  
%% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, May 26th, 2011

if exist('ConMatrixFiles','var')
    if isempty(ConMatrixFiles)
        ConMatrixFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices Files ...','',cd);
    end;
else
    ConMatrixFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices Files ...','',cd);
end;
if exist('OutputFileName','var')
    if isempty(OutputFileName)
        [OutputFile,OutPathName] = uiputfile('*.mat', 'Merged Connectivity Matrices Output File ...');
        OutputFileName = [OutPathName,OutputFile];
    end;
else
    [OutputFile,OutPathName] = uiputfile('*.mat', 'Merged Connectivity Matrices Output File ...');
    OutputFileName = [OutPathName,OutputFile];
end;

Ns = size(ConMatrixFiles,1);

C = load(deblank(ConMatrixFiles(1,:)));
if isfield(C.ConnectMatrix,'Structures')
    ConnectMatrix.Structures = C.ConnectMatrix.Structures;
elseif isfield(C.ConnectMatrix,'montage')
    ConnectMatrix.montage = C.ConnectMatrix.montage;
end;

Ne = size(C.ConnectMatrix.ConMat,1);
ConnectMatrix.ConMat = zeros(Ne,Ne,Ns);
for i=1:Ns
    C = load(deblank(ConMatrixFiles(i,:)));
    ConnectMatrix.ConMat(:,:,i) = mean(C.ConnectMatrix.ConMat,3);
end;

ConnectMatrix.NSubj = Ns;
ConnectMatrix.Name =  OutputFileName;
ConnectMatrix.MergedFiles = ConMatrixFiles;
ConnectMatrix.info = 'Merged Connectiviy Matrices Variable ...';
ConnectMatrix.date = date;

if exist('OutputFileName','var')
    save(OutputFileName,'ConnectMatrix','-mat');
end;

return;