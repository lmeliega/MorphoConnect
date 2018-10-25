function [D,Structs_Center] = Make_Structures_distance_Matrix(InputAtlasFile,StructureCodesFile)

% This function calculates the Euclidean distance between structure centroids defined in a Atlas File.
%
% Input Parameters:
%    InputAtlasFile : Atlas File 
%    StructureCodesFile : Files with the Structure Codes, or Structure
%                         information data.
%
% Output Parameters:
%
%    D : Matrix with the Euclidean distance between structure centroids. 
%  Structs_Center : Structure centroids.
%
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, December 7th 2008


if isempty(InputAtlasFile)
    InputAtlasFile = spm_select(1,'image','Loading Atlas File ...','',cd);
end;
if isempty(StructureCodesFile)
    StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',cd);
end;

V = spm_vol(InputAtlasFile);
Iatlas = spm_read_vols(V);
[Nx,Ny,Nz] = size(Iatlas);

if ~isstruct(StructureCodesFile)
    Structures = ReadCodeFile(StructureCodesFile);
else
    Structures = StructureCodesFile;
end;

NStruct = length(Structures);

Structs_Center = zeros(NStruct,3);

for i=1:NStruct
    ind = find(Iatlas==Structures(i).Code);
    [indx,indy,indz] = ind2sub([Nx,Ny,Nz],ind); 
    Structs_Center(i,:) = median([indx,indy,indz]);
end;

D = zeros(NStruct,NStruct);
for i=1:NStruct
    Ci = repmat(Structs_Center(i,:),NStruct,1);
    Ci = (Ci - Structs_Center).^2;    
    D(:,i) = sqrt(sum(Ci,2)); %
end;

return;