function vol = SurfStatReadVol( filenames, mask );

%Reads volumetric files in MINC, ANALYZE, NIFTI or AFNI format. 
% 
% Usage: vol = SurfStatReadVol( filenames [, mask] ). 
%
% filenames = file name with extension .mnc, .img, .nii or .brik as above 
%             (n=1) or n x 1 cell array of file names.
% mask      = 1 x N vector or nx x ny x nz matrix, 1=inside, 0=outside,  
%             [nx,ny,nz]=size(volume), N=nx*ny*nz, 
%           = ones(1,N), i.e. the whole volume, by default.
%
% vol.data   = n x v matrix of data, v=sum(mask(:))=#voxels in mask.
% vol.dim    = 1 x 3 vector of [nx,ny,nz].
% vol.vox    = 1 x 3 vector of voxel sizes in mm.
% vol.origin = position in mm of the first voxel.
% vol.mask   = mask.
% If n=1, vol.data is double precision; 
% if n>1, vol.data is single precision.

n=size(filenames,1);
if nargin<2
    if n==1
        d=SurfStatReadVol1(filenames,0,0);
    else
        d=SurfStatReadVol1(filenames{1},0,0);  
    end
    mask=ones(d.dim(1:3));
end
mask=mask>0;
slices=find(sum(sum(mask))>0);
slicedmask=mask(:,:,slices);

if n==1
    d=SurfStatReadVol1(filenames,slices,1);
    vol.data=d.data(slicedmask)';
else
    fprintf(1,'%s',[num2str(n) ' files to read, % remaining: 100 ']);
    n10=floor(n/10);
    v=sum(mask(:));
    vol.data=zeros(n,v,'single');
    for i=1:n
        if rem(i,n10)==0 
            fprintf(1,'%s',[num2str(round(100*(1-i/n))) ' ']);
        end
        d=SurfStatReadVol1(filenames{i},slices,1);
        vol.data(i,:)=single(d.data(slicedmask)');
    end
    fprintf(1,'%s\n','Done');
end
vol.dim=d.dim(1:3);
vol.vox=d.vox(1:3);
vol.origin=d.origin;
vol.mask=mask;

return;
end

