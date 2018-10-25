function Put_outStructsAtlas(InputAtlas,InputCodeFile)

% Lester Melie-Garcia
% Cuban Neuroscience Center
% January, 21st, 2009


V = spm_vol(InputAtlas);
Iatlas = spm_read_vols(V);

ind = unique(Iatlas(:));

if ind(1)==0
    ind = ind(2:end);
end;

Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
NStruct_all = length(ind);

for i=1:NStruct_all
    find();
    if ind(i)==
        indt = Structures(i).Code;
    end;
end;