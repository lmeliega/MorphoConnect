Lleft = load('G:\Morphological_Connectivity\Data\labels\MC0000001_animal_surface_labels_left.txt');
Lright = load('G:\Morphological_Connectivity\Data\labels\MC0000001_animal_surface_labels_right.txt');
L = [Lleft;Lright];

%Structures = load('G:\Morphological_Connectivity\Interface_Development\atlas54_ordenadas.cod');
StructureCodesFile = 'G:\Morphological_Connectivity\Interface_Development\atlas54_ordenadas.cod';
fid = fopen(StructureCodesFile,'r');
i=0;
while ~feof(fid)
   i = i+1;
   jline = fgetl(fid);
   sep = findstr(jline,'=');
   Structures(i).Name = jline(sep+1:end);
   Structures(i).Code = str2num(jline(1:sep-1));
end;    
%StructCodes = load(StructureCodesFile);
fclose(fid);
NStruct = length(Structures);


Nstruct = length(Structures);
Nodes = zeros(Nstruct,1);
for i=1:Nstruct
    Nodes(i) = sum(L==Structures(i).Code);
end;
    