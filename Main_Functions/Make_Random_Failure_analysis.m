function [Nc,thresbins,thres,thresS] = Make_Random_Failure_analysis(ConMatFiles,Nrep,thres)

% This function makes the random analysis of the Network
% for different connectivity matrices.
%
%% Input Parameters:
%    ConMatFiles : Connectivity Matrices Files.
%    thres : threshold for the Connectivity matrices.
%     Nrep :  Number of repetitions.
%    thres : global threshold used for the study.
%    thresS : threshold used for each connectivity matrix.
%
%% Output Parameters:
%     Nc  : curve of the largest component normalized in the Network.
% thresbins : sparsity degree's bins used for calculating previous measures.
%
%% Lester Melie-Garcia
% Neuroinformatics Department
% Cuban Neuroscience Center
% November 28th, 2012.

if exist('ConMatFiles','var')
    if isempty(ConMatFiles)
        ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
    end;
else
     ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
end;
if ~exist('Nrep','var')
    Nrep = 300;
end;

Nfiles = size(ConMatFiles,1);
ConMatT = cell(Nfiles,1);
FileNames = cell(Nfiles,1);
if ischar(ConMatFiles)
    for i=1:Nfiles
        ConMatTemp = load(deblank(ConMatFiles(i,:)));
        ConMatT{i} = ConMatTemp.ConnectMatrix;
        [FilePath,FileNames{i}] = fileparts(deblank(ConMatFiles(i,:)));
    end;    
end;

if ~exist('thres','var')
    thresC = zeros(Nfiles,1);
    thresS = zeros(Nfiles,1);
    for i=1:Nfiles
        ConMat = ConMatT{i}.ConMat;
        [Nc,thresC(i),thresS(i)] = Netlargest_comp(ConMat);
    end;
    thres = min(thresS);
end;

[Nc,thresbins] = Random_Failure_analysis(ConMat,thres,Nrep);
Nc = zeros(length(thresbins),Nfiles);
for i=1:Nfiles
    ConMat = ConMatT{i}.ConMat;
    Nc(:,i) = mean(Random_Failure_analysis(ConMat,thres,Nrep),2);
end;

Plot_Random_Failure_analysis(Nc,thresbins,FileNames);

return;