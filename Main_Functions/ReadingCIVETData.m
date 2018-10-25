function Y = ReadingCIVETData(InputFiles)

% This function reads data coming from CIVET (Montreal Neurological
% Institute (MNI) software). This is based on the SurfStat Toolbox developed by
% Dr. Keith Worsley.
%
%  Input Parameters:
%       InputFiles: CIVET Files (i.e. Cortical Thickness, Cortical Label Files)
%  
%  Output Parameters:
%        Y :  Read Data.
%
% Lester Melie-Garcia
% Cuban Neuroscience Center
% Havana, 25 October, 2008

InputFilesLeft = InputFiles(1:2:end,:);
InputFilesRight = InputFiles(2:2:end,:);
NFiles = size(InputFilesLeft,1);
files_left = cell(NFiles,1);
files_right = cell(NFiles,1);
for i=1:NFiles
    files_left{i} = deblank(InputFilesLeft(i,:));
    files_right{i} = deblank(InputFilesRight(i,:));
end;

Y = SurfStatReadData([files_left, files_right]); % Cortical thickness data

return;
