function [Y,SubjectLabels] = ReadingCIVETData(CorticalThicknessFiles,CorticalLabelFiles)

% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, 25 October, 2008

CorticalThicknessFilesLeft = CorticalThicknessFiles(1:2:end,:);
CorticalThicknessFilesRight = CorticalThicknessFiles(2:2:end,:);
NFiles = size(CorticalThicknessFilesLeft,1);
thickness_files_left = cell(NFiles,1);
thickness_files_right = cell(NFiles,1);
for i=1:NFiles
    thickness_files_left{i} = deblank(CorticalThicknessFilesLeft(i,:));
    thickness_files_right{i} = deblank(CorticalThicknessFilesRight(i,:));
end;
CorticalLabelFilesLeft = CorticalLabelFiles(1:2:end,:); %#ok
CorticalLabelFilesRight = CorticalLabelFiles(2:2:end,:); %#ok
LabelFilesLeft = cell(NFiles,1);
LabelFilesRight = cell(NFiles,1);
for i=1:NFiles
    LabelFilesLeft{i} = deblank(CorticalLabelFilesLeft(i,:));
    LabelFilesRight{i} = deblank(CorticalLabelFilesRight(i,:));
end;
disp('Loading Cortical Thickness Data for all Subjects ...')
Y = SurfStatReadData([thickness_files_left, thickness_files_right]); % Cortical thickness data
disp('Cortical Thickness data loaded ...')
disp('Loading Labels for all Subjects ...')
SubjectLabels = SurfStatReadData([LabelFilesLeft, LabelFilesRight]); % Label for all subjects
disp('Labels loaded ...')

return;
