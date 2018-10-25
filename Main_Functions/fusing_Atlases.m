function fusing_Atlases(AtlasFileName1,AtlasFileName2,StructureCodesFile)

% Lester Melie-Garcia
% Cuban Neuroscience Center
% January 21st, 2009


V = spm_vol(AtlasFileName1);
Iatlas = spm_read_vols(V);
Vreduced = spm_vol(AtlasFileName2);
Iatlas_reduced = spm_read_vols(Vreduced);
Iatlas_reduced = flipdim(Iatlas_reduced,1);

Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
Codes = zeros(NStruct,1);
for i=1:NStruct
    Codes(i) = Structures(i).Code; 
end;

for i=1:NStruct
    ind = find(Iatlas_reduced==Codes(i));
    Iatlas(ind) = Iatlas_reduced(ind);
end;

Vout = V;
[pth,name,ext] = fileparts(V.fname);
Vout.fname = [pth,filesep,name,'_fused',ext];
spm_write_vol(Vout,Iatlas);

return;

