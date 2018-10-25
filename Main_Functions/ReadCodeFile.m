function [Structures,Structures_cell] = ReadCodeFile(StructureCodesFile)

% This function read the Code Files (*.cod). This is the same type cod
% files used in IMAGIC Software NEURONIC S.A.
% 
% Syntax : Structures = Morpho_ReadCodeFile(StructureCodesFile)
% 
% Input Parameters:
%    StructureCodesFile: This is the structure Code File. 
%      *.cod files have the following structure: 
%              code1=NameStructure1
%              code2=NameStructure2
%                 ...
%              codeN=NameStructureN
%
% Output Parameters:
%    Structures: This a struct Matlab variable that contains the following information:
%            Structures(i).Name : Structure name of the ith structure.
%            Structures(i).Code : Structure Code of the ith structure.
% 
% Lester Melie Garcia
% Cuban Neuroscience Center
% October 3rd, 2008

fid = fopen(StructureCodesFile,'r');
i=0;
while ~feof(fid)
   i = i+1;
   jline = fgetl(fid);
   sep = strfind(jline,'=');
   Name = jline(sep+1:end);
   Code = str2double(jline(1:sep-1));
   Structures(i).Name = Name; %#ok
   Structures(i).Code = Code; %#ok
   Structures_cell(i,1) = {Name}; %#ok
   Structures_cell(i,2) = {Code}; %#ok
end; 

fclose(fid);

return;