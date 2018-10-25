function StructVol = Auto_Labelling_with_SPAMs(GMSegFile, WMSegFile, CSSegFile, AtlasFiles, SNFiles, Out_dir, Thresh)
%
% Syntax : 
% Atlas =   Auto_Labelling(GMSegFile, WMSegFile, CSSegFile, AtlasFile, transf_matname)
%
% This function returns an individual Atlas in Analyze format. 
% The first step is to find the voxels that belongs to gray matter tissue 
% using the tissues probabilities maps previously obatained by the segmentation
% process. Due to the thresholding process, some holes, as well as isolated 
% points are present at gray matter volume. To solve this problem is used the 
% matlab function "imfill" to refills the internal holes and an internal
% function to reduce the isolated points(Uncoment if you want to employ it).
% Then each gray matter voxel is labeled with one structure label using the
% space transformation matrix (obtained in the normalization step), and an 
% anatomical atlas (constructed by manual segmentation for a group of
% subjects).
%
% Input Parameters:
%  GMSegFile      : Gray Matter Segmentation File.
%  WMSegFile      : White Matter Segmentation File.
%  CSSegFile      : Cerebral Spinal Fluid Segmentation File.
%  AtlasFile      : Reference Atlas File.
%  Transf_matname : Normalization Transform File.
%  Out_dir        : Output directory for segmented, normalized and atlased
%                    files. If the user doesn't change the output directory,
%                    the resulting files are saved in the same address than the
%                    Gray Matter Segmentation File.
%  Thresh         : Threshold for gray matter segmentation. 
%                   Just the voxels with  higher probability than the threshold
%                   are taken into acount in the automatic labelling step. If 
%                   the threshold isn't specified then an automatic one is taken. 
%                   All voxels with higher gray matter probabillity than 1-(GM+WM+CSF)
%                   are taken into account in the automatic labelling step.
%                   Being:
%                   GM(A voxel V belongs to gray matter tissue with a probability GM).
%                   WM(A voxel V belongs to white matter tissue with a probability WM). 
%                   CSF(A voxel V belongs to cerebral spinal fluid with a probability CSF).
% Output Parameter:
%   OutputFiles   : Individual Gray Matter Atlas Filenames.
%
% Related References:
% 1.- Ashburner J, Friston K. Multimodal image coregistration and partitioning-- 
%     a unified framework. Neuroimage. 1997 Oct;6(3):209-17. 
% 3.- Evans AC, Collins DL, Milner B (1992). An MRI-based Stereotactic Brain
%     Atlas from 300 Young Normal Subjects, in: Proceedings of the 22nd Symposium 
%     of the Society for Neuroscience, Anaheim, 408.
%
% Note: The morphological treatment(erosion and dilation) are comented due 
%       to its dependence of the results with the structure element used to 
%       erode and dilate.      
%
% See also: imfill  imerode  imdilate  spm_segment atlasing spm_normalise
%__________________________________________________________________________
% Authors:  Yasser Alem�n G�mez & Lester Melie Garc�a  
% Neuroimaging Department
% Cuban Neuroscience Center
% Last update: November 15th 2005
% Version $1.0
% Last update: November 6th 2008 (Lester Melie Garcia) Comments: The SPAMs
% has been added.

%=====================Checking Input Parameters===========================%
if nargin==0
    [GMSegFile,sts] = spm_select([1 Inf],'image','Selecting Gray Matter Images','',cd);
    [WMSegFile,sts] = spm_select([1 Inf],'image','Selecting White Matter Images','',cd);
    [CSSegFile,sts] = spm_select([1 Inf],'image','Selecting Cerebral Spinal Fluid Images','',cd);
    [AtlasFile,sts] = spm_select([1 Inf],'image','Reading Reference Atlas File ...','',cd);
    [SNFiles,sts] = spm_select([1 Inf],'mat','Selecting Normalization Transform Files','',cd);
    [Out_dir,sts] = spm_select([1],'dir','Selecting Output Directory','',cd);
else
 if isempty(GMSegFile)
        [GMSegFile,sts] = spm_select([1 Inf],'image','Selecting Gray Matter Images','',cd);
    end;
    if isempty(WMSegFile)
        [WMSegFile,sts] = spm_select([1 Inf],'image','Selecting White Matter Images','',cd);
    end;
    if isempty(CSSegFile)
        [CSSegFile,sts] = spm_select([1 Inf],'image','Selecting Cerebral Spinal Fluid Images','',cd);
    end;
    if isempty(AtlasFiles)
        [AtlasFiles,sts] = spm_select([1 Inf],'image','Reading Reference Atlas File ...','',cd);
    end;
    if isempty(SNFiles)
        [SNFiles,sts] = spm_select([1 Inf],'mat','Selecting Normalization Transform Files','',cd);
    end;
    if isempty(Out_dir)
        [Out_dir,sts] = spm_select([1],'dir','Selecting Output Directory','',cd);
    end
end
fclose('all');
%=========================================================================%
%
%=========================Main program=====================================

spm_defaults;
defaults.analyze.flip = 1; % Flipping Images
global defaults
VSeg =  spm_vol(GMSegFile);
VWM = spm_vol(WMSegFile);
VCS = spm_vol(CSSegFile);
[Apth,Aname,Aext] = fileparts(AtlasFile);  
Vatlas = spm_vol(AtlasFile); % Lester Melie Garcia
OutputFiles = '';
Ns = size(GMSegFile,1);
wmr = size(WMSegFile,1);
csr = size(CSSegFile,1);
sr  = size(SNFiles,1);
if (Ns~=wmr)|(Ns~=csr)|(Ns~=sr)
    errordlg('The number of files must be the same');
    return;
end
if (size(Out_dir,1)~=Ns)&(size(Out_dir,1)==1)
    Out_dir = repmat(Out_dir,[Ns 1]);
end
NAtlases = size(AtlasFile,1); % Lester Melie Garcia.
StructVol = zeros(Ns,NAtlases);
for i = 1:Ns
    Iseg_mask = zeros(VSeg(i).dim(1),VSeg(i).dim(2),VSeg(i).dim(3));
    %%%%%%%%%%%-----------------Thresholding-------------------%%%%%%%%%%%%%%%%
    for j=1:NAtlases
        Iatlas = spm_read_vols(Vatlas(j)); % Here the matrix Iatlas is loaded.
        for z = 1:VSeg(i).dim(3)
            %% tissues
            GM  = spm_slice_vol(VSeg(i),spm_matrix([0 0 z]),VSeg(i).dim(1:2),0);
            WM  = spm_slice_vol(VWM(i),spm_matrix([0 0 z]),VWM(i).dim(1:2),0);
            CSF = spm_slice_vol(VCS(i),spm_matrix([0 0 z]),VCS(i).dim(1:2),0);
            None = 1 - (GM + WM + CSF);
            %% inds
            if (~exist('Thresh','var'))||(isempty(Thresh))
                indGM = find((GM > WM) & (GM > CSF) & (GM > None));
            else
                indGM  = find(GM>=Thresh);
            end
            %% brain
            Brain = sparse(VSeg(i).dim(1),VSeg(i).dim(2));
            Brain(indGM) = 1;
            Iseg_mask(:,:,z) = full(Brain);
        end
        %%%%%%%%%-------------- End of Thresholding ---------------%%%%%%%%%%%%%%%%
        %disp(['Refilling...']);
        %Iseg_mask = imfill(logical(Iseg_mask),'holes');
        clear IWM ICS Iseg ind WM CSF None;        
        StructVol(i,j) = Get_Norm_Coord(VSeg(i),AtlasFile,SNFiles(i,:),Iseg_mask, Iatlas); % Structure Volume calculation.       
    end; % end for j=1:NAtlases
end; % end for i = 1:Ns

%========================End of main program==============================%
return;

%=====================Internal functions==================================%
function V = Get_Norm_Coord(VSeg, AtlasFile, Matname, Iseg_mask, Iatlas)
%
%
% Input Parameters:
%   VSeg        : Gray Matter Volume structure
%   AtlasFile   : Reference Atlas Filename
%   matname     : Normalisation Transform File
%   Iseg_mask   : Gray Matter Segmentation Mask
%   Iatlas      : Matrix containing the 3D reference atlas 
%
% Note: This is based on the function 'spm_write_sn' developed by PhD.John Ashburner(FIL,UCL).
%
%__________________________________________________________________________
% Authors:  Yasser Aleman Gomez & Pedro Valdes Hernandez  
% Neuroimaging Department
% Cuban Neuroscience Center
% Last update: November 15th 2005
% Version $1.0
% Last update: November 6th, 2008 (Lester Melie Garcia)

warning off
global defaults
defaults.analyze.flip = 1; % Flipping Images
Vatlas = spm_vol(AtlasFile);
if length(Vatlas.dim)==4
    dt = [Vatlas.dim(4) 0];
elseif length(Vatlas.dim)==3
    dt = Vatlas.dt;
end
load('-mat',Matname); 
mat = VSeg.mat; 
if spm('ver')=='SPM2'
    dim = [VF.dim(1:3) dt(1)];
elseif spm('ver')=='SPM5'
    dim = [VF.dim(1:3)];
end
x = 1:VG(1).dim(1); y = 1:VG(1).dim(2); z = 1:VG(1).dim(3);
if ~isempty(Tr)
    BX = spm_dctmtx(VG(1).dim(1),size(Tr,1),x-1);
    BY = spm_dctmtx(VG(1).dim(2),size(Tr,2),y-1);
    BZ = spm_dctmtx(VG(1).dim(3),size(Tr,3),z-1);
end
[X,Y] = ndgrid(x,y); clear x y
y1 = single(0); y1(VG(1).dim(1),VG(1).dim(2),VG(1).dim(3)) = 0;
y2 = single(0); y2(VG(1).dim(1),VG(1).dim(2),VG(1).dim(3)) = 0;
y3 = single(0); y3(VG(1).dim(1),VG(1).dim(2),VG(1).dim(3)) = 0;
M = VG(1).mat;
for j=1:length(z);
    if ~isempty(Tr)
        X1 = X    + BX*get_2Dtrans(Tr(:,:,:,1),BZ,j)*BY';
        Y1 = Y    + BX*get_2Dtrans(Tr(:,:,:,2),BZ,j)*BY';
        Z1 = z(j) + BX*get_2Dtrans(Tr(:,:,:,3),BZ,j)*BY';
    else
        X1 = X; Y1 = Y; Z1 = z(j);
    end
    y1(:,:,j) = single(M(1,1)*X1 + M(1,2)*Y1 + M(1,3)*Z1 + M(1,4));
    y2(:,:,j) = single(M(2,1)*X1 + M(2,2)*Y1 + M(2,3)*Z1 + M(2,4));
    y3(:,:,j) = single(M(3,1)*X1 + M(3,2)*Y1 + M(3,3)*Z1 + M(3,4));
end
clear X1 Y1 Z1 X Y z
disp('Inverting the deformations field...'); 
M = Affine/VG(1).mat; M(4,:) = [0 0 0 1];
[iy1,iy2,iy3] = spm_invdef(y1,y2,y3,VF.dim(1:3),M,VG(1).mat);
clear y1 y2 y3
M = inv(Vatlas.mat);
disp('Labelling...');
%Iseg_mask = Iso_Rem(Iseg_mask,7); % Correcting Gray Matter Mask. Taking off isolated points.
IA = zeros(VF.dim(1),VF.dim(2),VF.dim(3));
IGM = spm_read_vols(VSeg); % Loading Gray matter image
for j = 1:VF.dim(3)
    A = zeros(VF.dim(1),VF.dim(2));
    disp(['Slice ----> ' num2str(j)]);
    if sum(sum(Iseg_mask(:,:,j  )))~=0
        X2 = M(1,1)*double(iy1(:,:,j)) + M(1,2)*double(iy2(:,:,j)) + M(1,3)*double(iy3(:,:,j)) + M(1,4);
        Y2 = M(2,1)*double(iy1(:,:,j)) + M(2,2)*double(iy2(:,:,j)) + M(2,3)*double(iy3(:,:,j)) + M(2,4);
        Z2 = M(3,1)*double(iy1(:,:,j)) + M(3,2)*double(iy2(:,:,j)) + M(3,3)*double(iy3(:,:,j)) + M(3,4);
        A = spm_sample_vol(Iatlas,X2,Y2,Z2,0); % Check here the interpolation, maybe could be trilinear interpolation.
    end
    IA(:,:,j) = A.*Iseg_mask(:,:,j).*IGM(:,:,j);  % 'A' matrix contains the SPAMs transformed to individual space.
end;

V = sum(IA(:)); % Volume calculation. 
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function T2 = get_2Dtrans(T3,B,j)
d   = [size(T3) 1 1 1];
tmp = reshape(T3,d(1)*d(2),d(3));
T2  = reshape(tmp*B(j,:)',d(1),d(2));
return;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function I = Iso_Rem(T,Nhood);
%
%This function removes isolated points from a mask. 
%
% Input Parameters:
%   T            : Mask
%   Nhood        : Minimun number of neighbors. 
% Output Parameters:
%   I            : Mask without isolated points  
%__________________________________________________________________________
% Authors:  Yasser Aleman Gomez 
% Neuroimaging Department
% Cuban Neuroscience Center
% Last update: November 15th 2005
% Version $1.0

warning off
I = logical(zeros(size(T)+2));
I(2:end-1,2:end-1,2:end-1) = T;
clear T
ind = find(I);
[x,y,z] = ind2sub(size(I), ind);
[X, Y, Z] = meshgrid(-1:1,-1:1,-1:1);
X = int16(X(:));Y = int16(Y(:));Z = int16(Z(:));
Neib = [X Y Z];clear X Y Z;l = 1;
pos = find(ismember(Neib,[0 0 0],'rows'));
Neib(pos,:) = [];
Temp = zeros(size(ind,1),size(Neib,1)+2);
Temp(:,1) = ind;clear ind;
for j = 1:size(Neib,1)
    S = repmat(double(Neib(j,:)),[size(Temp(:,1),1) 1]) + [x y z];
    indtmp = sub2ind(size(I),S(:,1),S(:,2),S(:,3));
    Temp(:,j+2) = I(indtmp);
end
Temp(:,2) = sum(logical(Temp(:,3:end))')';
ind = uint32(find(Temp(:,2)<Nhood));
I(Temp(ind,1)) =0;
I = I(2:end-1,2:end-1,2:end-1);
return;

function [IA] = Atlas_Corr(Iseg,IA);
%
% Syntax : 
% [IA] = Atlas_Corr(Iseg,IA);
%
% This function corrects the erros ocurred during the atlasing process. 
% It assings a label to the points of gray matter mask that didn't get any 
% during the labelling step.   
%
% Input Parameters:
%  Iseg           : Gray Matter Mask.
%  IA             : Individual Atlas without correction.
%  
% Output Parameter:
%  IA             : Corrected Individual Gray Matter Atlas.
%__________________________________________________________________________
% Authors:  Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% Last update: November 15th 2006
% Version $1.0
Isegt = zeros(size(Iseg)+2);Isegt(2:end-1,2:end-1,2:end-1) = Iseg;Iseg = Isegt; clear Isegt;
IAt = zeros(size(IA)+2);IAt(2:end-1,2:end-1,2:end-1) = IA;IA = IAt;clear IAt;
ind = find((Iseg==1)&(IA==0));
[X, Y, Z] = meshgrid(-1:1,-1:1,-1:1);
X = int16(X(:));Y = int16(Y(:));Z = int16(Z(:));
Neib = [X Y Z];clear X Y Z;l = 1;indr = 0;
pos = find(ismember(Neib,[0 0 0],'rows'));
Neib(pos,:) = [];
while ~isempty(ind)&(l>0)
    [x,y,z] = ind2sub(size(Iseg), ind);
    pos = find(ismember(Neib,[0 0 0],'rows'));
    Neib(pos,:) = [];
    Temp = zeros(size(ind,1),size(Neib,1)+2);
    Temp(:,1) = ind;
    for j = 1:size(Neib,1)
        S = repmat(double(Neib(j,:)),[size(Temp(:,1),1) 1]) + [x y z];
        indtmp = sub2ind(size(IA),S(:,1),S(:,2),S(:,3));
        Temp(:,j+2) = IA(indtmp);
    end
    Temp(:,2) = sum(logical(Temp(:,3:end))')';
    [xt,yt] = sort(Temp(:,2),'descend');indtemp = find(xt>5);
    Temp1 = Temp(yt(indtemp),:);clear Temp; Temp = Temp1; clear Temp1;
    for j = 1:length(Temp(:,1))
        T = Temp(j,3:end);indp =find(T==0);T(indp) = [];
        c = accumarray(T',ones(length(T),1));
        indpos = find(c == max(c));
        if length(indpos)>1
            [xo,yo,zo] = ind2sub(size(Iseg),Temp(j,1));
            TNeib = Neib;TNeib(indp,:) = [];
            S = repmat(int32([xo yo zo]),[size(TNeib,1) 1]) + int32(TNeib);
            ind2 = sub2ind(size(Iseg),S(:,1),S(:,2),S(:,3));
            temp = ismember(IA(ind2),indpos);
            Vect = [xo yo zo;S(temp,1) S(temp,2) S(temp,3)];
            D = dist(Vect');D = D(1,2:end);
            indt = find(D == min(D));
            indpos = IA(Vect(indt(1)+1,1),Vect(indt(1)+1,2),Vect(indt(1)+1,3));
        end
        IA(Temp(j,1)) = indpos;
    end
    clear x y z X Y Z S xo yo zo ind2 indt indpos Vect T;
    indr= find((Iseg==1)&(IA==0));
    l = size(Temp,1);
    ind = indr; 
end
IAt = IA(2:end-1,2:end-1,2:end-1);
IAt = Iseg(2:end-1,2:end-1,2:end-1).*IAt;
IA = IAt; clear IAt;
return;