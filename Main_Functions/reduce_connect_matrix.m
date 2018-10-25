function reduce_connect_matrix(ConnectMatrixFile,StructureCodesFile,StructureCodesFile_reduced,ConnectMatrixFile_new)

% This function reduce the connectivity matrix saved in ConnectMatrixFile
% file. The list of the structures are defined in the files
% StructureCodesFile and StructureCodesFile_reduced.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, January 23rd, 2009

C = load(deblank(ConnectMatrixFile));
ConnectMatrix = C.ConnectMatrix;
Structures = ReadCodeFile(StructureCodesFile);
Structures_t = ReadCodeFile(StructureCodesFile_reduced);

N = length(Structures);
Nr = length(Structures_t);

c = 0;
ind = [];
for i=1:Nr
    for j=1:N
        if  Structures_t(i).Code==Structures(j).Code
            c = c + 1;
            ind(c) = j; %#ok
        end;
    end;
end;

ConnectMatrix.ConMat = ConnectMatrix.ConMat(ind,ind);
ConnectMatrix.Structures = Structures_t;

if isempty(ConnectMatrixFile_new)
   [pth,name,ext] = fileparts(ConnectMatrixFile);
   ConnectMatrixFile_new = [pth,filesep,name,'_reduced',ext];
end;

save(ConnectMatrixFile_new,'ConnectMatrix');
  
return;
