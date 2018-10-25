function S = Network_strength_functional_computation(ConMatFiles,OutputFile)

%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, June 26th, 2011

if exist('ConMatFiles','var')
    if isempty(ConMatFiles)
        ConMatFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices Files ...','',cd);
    end;
else
    ConMatFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices Files ...','',cd);
end;
if exist('OutputFile','var')
    if isempty(OutputFile)
        [OutPutFileName, OutputDir] = uiputfile('*.txt', 'Save File as');
        OutputFile = [OutputDir,OutPutFileName];
    end;
else
    [OutPutFileName, OutputDir] = uiputfile('*.txt', 'Save File as');
    OutputFile = [OutputDir,OutPutFileName];
end;

Ns = size(ConMatFiles,1);
S = zeros(Ns,1);
for i=1:Ns
    ConMat = load(ConMatFiles(i,:));
    ConMat = abs(ConMat.ConnectMatrix.ConMat);
    S(i) = mean(sum(ConMat,2)); 
end;

saveFiles = true;
if saveFiles
    T = S; %#ok
    save(OutputFile,'T','-ASCII');
end;

return;



