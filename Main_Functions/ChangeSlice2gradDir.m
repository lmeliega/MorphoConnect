function ChangeSlice2gradDir(InputFiles)

% This function rearranges the diffusion files ordered one file one slice
% all diffusion gradient direction to one file all slices one diffusion
% gradient direction.
%
% Input Parameters:
%     InputFiles : Input Files List.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 18th, 2008

warning off
dir = cd;
if nargin==0
    InputFiles = spm_select([1 Inf],'any','Loading Input Images to convert ...','',dir);
end;

V = spm_vol(InputFiles);

NSlices = length(V);
Nx = V(1).dim(1);
Ny = V(1).dim(2);
NDir = V(1).dim(3);

Vout = V(1);
Vout.dim(3) = NSlices;
[FilePath,FileName,FileExt] = fileparts(V(1).fname);
for i=1:NDir
    disp(['Converting to Gradient Direction ' num2str(i) ' of ' num2str(NDir)]);
    I = zeros(Nx,Ny,NSlices);
    for j=1:NSlices
        I(:,:,j) = spm_slice_vol(V(j),spm_matrix([0 0 i]),V(j).dim(1:2),0);
    end;    
    Vout.fname = [FilePath,filesep,FileName,'_dir',num2str(i),FileExt];
    spm_write_vol(Vout,I);
end;

return;