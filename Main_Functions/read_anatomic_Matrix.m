sub_folders = spm_select(Inf,'dir');
N = size(sub_folders,1);

ACPFileName = 'Matrix_ACP.mat';
ACDFileName = 'Matrix_ACD.mat';
ACSFileName = 'Matrix_ACS.mat';

ACP90 = zeros(82,82,N);
ACD90 = zeros(82,82,N);
ACS90 = zeros(82,82,N);
ACP70 = zeros(56,56,N);
ACD70 = zeros(56,56,N);
ACS70 = zeros(56,56,N);

% ind71 = [1,2,3,4,5,6,8,9,13,15,17,18,19,21,23,25,30,33,36,43,44,47,49, ...
%          51,55,56,57,59,60,61,62,63,67,68,70,7,10,11,12,14,20,22,24,26,27,28 ...
%          29,31,32,34,35,37,38,39,40,41,42,45,46,48,50,52,53,54,58,64,65,66,69,71];

% rigth_regions = [1 2 3 4 5 6 57 8 9 13 59 15 17 18 19 21 23 49 25 30 33 47 68 34 36 60 44 56 55 43 51 70 67 61 62];
% left_regions = [46 28 54 45 48 20 7 40 10 11 14 65 22 41 35 32 52 24 50 26 27 29 31 63 64 37 38 39 42 12 69 53 58 71 66];

rigth_regions = [1 2 3 4 5 6 57 8 59 15 19 21 23 49 25 33 47 68 34 36 60 56 55 43 51 67 61 62];
left_regions = [46 28 54 45 48 20 7 40 14 65 35 32 52 24 50 27 29 31 63 64 37 39 42 12 69 58 71 66];

ind71 =  [rigth_regions,left_regions];

ind90 = [2:2:90,1:2:90];   
ind90r = [36,37,38,39,81,82,83,84];
for i=1:length(ind90r)
    ind = find(ind90==ind90r(i));
    ind90(ind) = [];
end;

for i=1:N
    disp(['Subject --> ' num2str(i)]);
    FullPath90 = [deblank(sub_folders(i,:)),'90',filesep];
    T = load([FullPath90,ACPFileName]);
    M = T.Map; 
    ACP90(:,:,i) = M(ind90,ind90);    
    T = load([FullPath90,ACDFileName]);
    M = T.Map;
    ACD90(:,:,i) = M(ind90,ind90);    
    T = load([FullPath90,ACSFileName]);
    M = T.Map;
    ACS90(:,:,i) = M(ind90,ind90);
    % ---------------------------------------------- %
    FullPath71 = [deblank(sub_folders(i,:)),'71',filesep];
    T = load([FullPath71,ACPFileName]);
    M = T.Map; 
    ACP70(:,:,i) = M(ind71,ind71);
    T = load([FullPath71,ACDFileName]);
    M = T.Map;
    ACD70(:,:,i) = M(ind71,ind71);    
    T = load([FullPath71,ACSFileName]);
    M = T.Map;
    ACS70(:,:,i) = M(ind71,ind71);
end;

% Saving Connectivity Matrices ...

ConnectMatrix.ConMat = ACP90;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACP90.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

ConnectMatrix.ConMat = ACD90;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACD90.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

ConnectMatrix.ConMat = ACS90;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACS90.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

ConnectMatrix.ConMat = ACP70;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACP70.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

ConnectMatrix.ConMat = ACD70;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACD70.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

ConnectMatrix.ConMat = ACS70;
ConnectMatrixFile = ['G:\Connectivity\Anatomical&Morphological_ConnectFusion\Sex_Test\ACS70.mat'];
save(ConnectMatrixFile,'ConnectMatrix');

