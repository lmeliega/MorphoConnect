function DataMatrix = Morpho_Reduce_Data_Matrix(DataMatrix,Structures,NewStructures,SubjectsList,SubjectsFullList)

% This function reduces a Data Matrix in both subject and structure dimensions. 
% Input Parameters:
%       DataMatrix : Data Matrix or Filename of the Data Matrix, Ns x Nstruct.
%       NewStructures : New Code File (*.cod) or struct variable with the new structures information.
%       Structures : Code File (*.cod) or struct variable with the structures information of the Data Matrix.
%       SubjectsList,SubjectsFullList : File names of the subject codes.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, March 27th, 2010
% Last update: March 12, 2017, Lausanne

if ~isnumeric(DataMatrix)
    [~,~,FileExt] = fileparts(DataMatrix);
    DataMatrix = load(deblank(DataMatrix));
    if strcmpi(FileExt,'.mat')
        if isfield(DataMatrix,'V')
            DataMatrix = DataMatrix.V;
            isstructData = false;
        else
            if exist(DataMatrix,'Data')
                Data = DataMatrix.Data;
                DataMatrix = Data.Y;
                isstructData = true;
            else
                DataMatrix = DataMatrix.Y;
                isstructData = false;
            end;
        end;
    end;
end;

isSubjectChange = false;
if exist('SubjectsList','var')&&exist('SubjectsFullList','var')    
    if (~isempty(SubjectsList))&&(~isempty(SubjectsFullList))
        isSubjectChange = true;
        indF = findIDsFiles(SubjectsList,SubjectsFullList);  % Finding indexes of the reduced list of subjects for the first data.
        DataMatrix = DataMatrix(indF,:);
    end;
end;

isStructChange = false;
if (~isempty(Structures))&&(~isempty(NewStructures))
    isStructChange = true;
    if ~isstruct(NewStructures)
        NewStructures = ReadCodeFile(NewStructures);
    end;
    if ~isstruct(Structures)
        Structures = ReadCodeFile(Structures);
    end;
    NStruct = length(Structures);
    Codes = zeros(NStruct,1);
    for i=1:NStruct  % Reading old codes
        Codes(i) = Structures(i).Code;
    end;
    NewNStruct = length(NewStructures);
    NewCodes = zeros(NewNStruct,1);
    j = 0;
    for i=1:NewNStruct  % Reading new codes and defining new Structures struct.
        NewCodes(i) = NewStructures(i).Code;
        if ismember(Codes,NewCodes(i))            
            StructuresNew(j+1).Name = NewStructures(i).Name; %#ok
            StructuresNew(j+1).Code = NewStructures(i).Code; %#ok
            ind(j+1)=i; %#ok
        end;
    end;
    %ind = ismember(Codes,NewCodes);
    DataMatrix = DataMatrix(:,ind);
end;

if isstructData    
    Data.Y = DataMatrix;
    if isfield(Data,'SubjectsGender')
        if isSubjectChange
            Data.SubjectsGender = Data.SubjectsGender(indF);
        end;
    end;
    if isfield(Data,'SubjectsAge')
        if isSubjectChange
            Data.SubjectsAge = Data.SubjectsAge(indF);
        end;
    end;
    if isfield(Data,'SubjectsIDs')
        if isSubjectChange
            Data.SubjectsIDs = Data.SubjectsIDs(indF);
        end;
    end;
    if isfield(Data,'Structures')
        if isStructChange
            Data.Structures = StructuresNew;
        end;
    end;
    DataMatrix = Data;
end;

end

