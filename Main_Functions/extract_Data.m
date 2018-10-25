function X = extract_Data(Y,SubjectsList,SubjectsFullList)

% This function extracts data from the big matrix of data using a reduce list of subjects 
% 
%
% Input Parameters:
%     Y : Matrix of data.
%    SubjectsList : Identifiers of the Files to be found. Can be more than
%                   one list of subjects.
%   SubjectsFullList: Full List of Files.
%
% Output Parameters:
%     X : Struct with the data extracted from the SubjectList variable. The
%         size of this variable must the same as SubjectList variable.
%
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% September 29th, 2009

NList = size(SubjectsList,1);

for i=1:NList
    indF = findIDsFiles(deblank(SubjectsList(i,:)),SubjectsFullList(1,:));
    
end;