function Coord = getStructCoord(AtlasFileName,StructureCodesFile)

% Input Parameters
%   AtlasFileName : Name of the input Image to extract structure
%                   coordinates
%  StructureCodesFile : File with Codes of the Cortical structures
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% February 13th, 2010

V = spm_vol(AtlasFileName);
StructInfo = ReadCodeFile(StructureCodesFile);

I = spm_read_vols(V);
[Nx,Ny,Nz] = size(I);

NStruct = length(StructInfo);
x = zeros(NStruct,1);
y = zeros(NStruct,1);
z = zeros(NStruct,1);
for i=1:NStruct
    indS = find(I(:)==StructInfo(i).Code);
    [xt,yt,zt] = ind2sub([Nx,Ny,Nz],indS);
    x(i) = mean(xt);
    y(i) = mean(yt);
    z(i) = mean(zt);
end;

d = sqrt(x.^2 + y.^2 +z.^2);
x = x/max(d);
y = y/max(d);
z = z/max(d);

Coord = [x,y,z];

return;