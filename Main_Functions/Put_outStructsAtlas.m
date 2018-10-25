function Put_outStructsAtlas(InputAtlas,StructureCodesFile)

% Lester Melie-Garcia
% Cuban Neuroscience Center
% January, 21st, 2009

V = spm_vol(InputAtlas);
Iatlas = spm_read_vols(V);

Iout = Iatlas; 

ind = unique(Iatlas(:));

if ind(1)==0
    ind = ind(2:end);
end;

Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
Codes = zeros(NStruct,1);
for i=1:NStruct
    Codes(i) = Structures(i).Code; 
end;
NStruct_all = length(ind);
for i=1:NStruct_all
    ind_temp = find(ind(i)==Codes);
    if isempty(ind_temp)
        indt = find(Iatlas==ind(i));
        Iout(indt)=0;
    end;
end;

Vout = V;
[pth,name,ext] = fileparts(V.fname);
Vout.fname = [pth,filesep,name,'_reduced',ext];
spm_write_vol(Vout,Iout);

% Vatlas = spm_vol(AtlasFile);
% if length(Vatlas.dim)==4
%     dt = [Vatlas.dim(4) 0];
% elseif length(Vatlas.dim)==3
%     dt = Vatlas.dt;
% end
% if spm('ver')=='SPM2'
%     dim = [V.dim(1:3) dt(1)];
% elseif spm('ver')=='SPM5'
%     dim = [V.dim(1:3)];
% end
% Vol = struct('fname','','dim',dim,'mat',mat,'pinfo',[1 0 0]',...
%     'descrip','Atlas image','dt',dt);
% Vol.fname =[char(Output_dir) filesep 'Atlased' filesep nm ext(1:4)];
% Vol = spm_create_vol(Vol);

return;