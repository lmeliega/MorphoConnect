function Split_Stats(StatsAll,OutputFolder)

if exist('StatsAll','var')
    if isempty(StatsAll)
        StatsAll = spm_select([1,Inf],'mat','Select Stats Files ...','',cd);
    end;
else
     StatsAll = spm_select([1,Inf],'mat','Select Stats Files ...','',cd);
end;
if exist('OutputFolder','var')
    if isempty(OutputFolder)
        OutputFolder = uigetdir(cd, 'Select Folder to save Target Attack Analysis Results ...');
    end;
else
    OutputFolder = uigetdir(cd, 'Select Folder to save Target Attack Analysis Results ...');
end;
if ~strcmp(OutputFolder(end),filesep)
    OutputFolder = [OutputFolder,filesep];
end;

StatsAll =  load(StatsAll);
StatsAll = StatsAll.Stats;
N = length(StatsAll);

for i=1:N
    OutputFile = [OutputFolder,StatsAll(i).Group1,'_vs_',StatsAll(i).Group2];
    Stats = StatsAll(i); %#ok
    save(OutputFile,'Stats');
end;

return;