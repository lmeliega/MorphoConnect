function  Data = Morpho_Make_Data_File(InputDataFile, DataModality, DataType, AgeListFile,GenderListFile, ...
                                       SubjectsListFile,StructureCodesFile,MorphoOutputFile)

% Input Parameters:
%      AgeListFile : File of Ages.
%      InputDataFile : File with the data
%      GenderListFile : File of genders.
%      SubjectsListFile : File with the Subject's IDs
%      StructureCodesFile : Structures Information File
%      MorphoOutputFile : File where the new data will be saved.
%      DataModality : Modality of the input Data, DataModality = 1 : Morphological Data
%                                                 DataModality = 2 : Functional Data
%                                                 DataModality = 3 : Metabolic Data
%                                                 
%      DataType : Type of the input Data: 
%                                 DataType =  1 : Surface Area
%                                 DataType =  2 : Cortical Thickness
%                                 DataType =  3 : Volume
%                                 DataType =  4 : Gyrification Index
%                                 DataType =  5 : Curvature Index
%                                 DataType =  6 : fMRI
%                                 DataType =  7 : EEG
%                                 DataType =  8 : MEG
%                                 DataType =  9 : SPECT
%                                 DataType = 10 : PET
%
%  Output Parameter:
%        Data : Data with the MorphoConnect Toolbox format. 
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 20th, 2010

if ~isempty(GenderListFile)
    genders = textread(GenderListFile,'%s');
else
    genders = '';
end;
if ~isempty(AgeListFile)
    ages = importdata(AgeListFile);
else
    ages = '';
end;
if ~isempty(SubjectsListFile)
    SubjIDs = textread(SubjectsListFile,'%s');
else
    SubjIDs = '';
end;
if ~isempty(StructureCodesFile)
    Structures = ReadCodeFile(StructureCodesFile);
else
    Structures = '';
end;
switch DataModality
    case 1
        Modality = 'Morphological';
    case 2
        Modality = 'Functional';
    case 3
        Modality = 'Metabolic';
end;
switch DataType
    case 1
        Type = 'Surface_Area';
    case 2
        Type = 'Cortical_Thickness';
    case 3
        Type = 'Volume';
    case 4
        Type = 'Gyrification_Index';
    case 5
        Type = 'Curvature_Index';
    case 6
        Type = 'fMRI';
    case 7
        Type = 'EEG';
    case 8
        Type = 'MEG';
    case 9
        Type = 'SPECT';
    case 10
        Type = 'PET';
end;

[FilePath,FileName,FileExt] = fileparts(InputDataFile);
Y = load(deblank(InputDataFile));
if strcmpi(FileExt,'.mat')
    Vars = fieldnames(Y);
    eval(['Y =Y.' Vars{1} ';']);
end;

Data.Y = Y;
Data.Modality = Modality;
Data.Type = Type;
if ~isempty(GenderListFile)
    Data.SubjectsGender = genders;
end;
if ~isempty(AgeListFile)
    Data.SubjectsAge = ages;
end;
if ~isempty(SubjectsListFile)
    Data.SubjectsIDs = SubjIDs;
end;
if ~isempty(StructureCodesFile)
    Data.Structures = Structures;
end;

save(MorphoOutputFile,'Data');

return;