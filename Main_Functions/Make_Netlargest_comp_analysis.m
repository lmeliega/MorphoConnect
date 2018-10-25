function [Nc,thresC,thresS,thresAve,thresbins] = Make_Netlargest_comp_analysis(ConMatFiles)

% This function calculates the largest component for a set of connectivity
% matrices.
%
% Input Parameters:
%    ConMatFiles : Connectivity Matrices.
%
% Output Parameters:
%     Nc  : curve of the largest component in the Network.
%  thresC : value of the threshold for the connectivity matrix.
%  thresS : value of the threshold for the sparsity degree.
% thresAve : value of the threshold for the average degree where the theoretical value for calculating 
%            sigma network property is possible (2*log(N)).
% thresbins : sparsity degree's bins used for calculating previous measures.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% December 18th, 2010.

if exist('ConMatFiles','var')
    if isempty(ConMatFiles)
        ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
    end;
else
     ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
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

thresC = zeros(Nfiles,1);
thresS = zeros(Nfiles,1);
ConMat = ConMatT{1}.ConMat;
Nc = Netlargest_comp(ConMat);
Nc = zeros(length(Nc),Nfiles);
for i=1:Nfiles
    ConMat = ConMatT{i}.ConMat;
    [Nc(:,i),thresC(i),thresS(i),thresAve,thresbins] = Netlargest_comp(ConMat);
end;
%thres = min(thresS);

return;