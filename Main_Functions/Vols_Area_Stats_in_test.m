function [V,A,Out_VolMatFile,Out_AreaMatFile] = Vols_Area_Stats(AImages,CodeFile,Out_files,StrL,chv,cha);
%
% Syntax :
% [V,A,Out_VolMatFile,Out_AreaMatFile] = Vols_Area_Stats(Images,CodeFile,Out_files,chv,cha);
%
% This function computes the volume and area for a specified structures list
% for a group of subjects.
% For 2 or more atlas images it will obtain also the mean and
% standar deviation for the volume and area of all the specified structures.
%
% Input Parameters:
%   AImages     : Individual Atlas files.
%   CodeFile    : Text File with the relationship between structures codes
%                 and structures names
%   Out_files   : Name of the results textfile
%   Out_dir     : Output directory for segmented, normalized and atlased
%                files. If the user doesn't change the output directory,
%                the resulting files are saved in the same address than the
%                individual Mask/Atlas files.
%   StList      : List of structures codes.
%   chv         : Boolean variable (0 do not compute structures volume, 1 compute structures volume).
%   cha         : Boolean variable (0 do not compute structures areas, 1 compute structures areas).
%
% Output Parameters:
%   V           : Matrix containing the structures volume  N(subjets)xM(structures)
%   A           : Matrix containing the structures areas  N(subjets)xM(structures)
% Out_VolMatFile: Mat File containing V.
% Out_AreaMatFile: Mat File containing A.
%
% Related references:
%
%
% See also: Atlasing Auto_Labelling
%__________________________________________________
% Authors: Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% December 1st 2006
% Version $1.0

warning off
fclose('all');
%=====================Checking Input Parameters===========================%
if nargin ==0
    [AImages,sts] = spm_select([1 Inf],'image','Selecting Atlased Images','',cd);
    [CodeFile,sts] = spm_select([1],'cod','Reading Reference Code File ...','',cd);
    [FileName, Out_dir] = uiputfile('*.txt','Saving Results...');
    Out_files = [Out_dir 'Vols_' FileName];
    Out_files = strvcat(Out_files,[Out_dir 'Area_' FileName]);
    StrL = input('Please enter the structures codes:  ','s');
    ar = input('Do you want to compute structures volume (ie: y/n ):  ','s');
    if ar =='y'
        chv = 1;
    elseif ar =='n'
        chv =0;
    end
    ar = input('Do you want to compute structures area (ie: y/n ):  ','s');
    if ar =='y'
        cha = 1;
    elseif ar =='n'
        cha = 0;
    end
end
%=========================================================================%
%===================== Reading the Structures Codes ======================%
fid = fopen(CodeFile);
cont = 0;
while 1
    cont = cont + 1;
    line = fgetl(fid);
    if ~ischar(line),   break,   end
    ind = strfind(line,'=');
    StructNames{1, cont} = line(ind+1:end);
    StructCodes(1,cont) = str2num(deblank(line(1:ind-1)));
end
fclose(fid);
clear tline cont;
%=========================================================================%
if strcmp(lower(StrL),'all')
    StrList = StructCodes;
else
    StrList = Sel_Structs(StrL,StructCodes);
end
NStruct = length(StrList);
VA = spm_vol(AImages);
Ns = length(VA);
NStruct = length(StrList);
[pth, nm, ext] = fileparts(Out_files(1,:));
if ~exist(pth)
    ptht = fileparts(pth);
    mkdir(ptht,'Vol_Area_Results');
end
H = waitbar(0,['Subject ' num2str(1) ' of ' num2str(Ns)  ' : Number of Structures = ' num2str(NStruct)],'Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
for i = 1:Ns
    disp(['Subject ===> ' num2str(i) ' of ' num2str(Ns)  ' : Number of Structures = ' num2str(NStruct)]);
    voxsize = sqrt(sum(VA(i).mat(1:3,1:3).^2)); voxvol = prod(voxsize);
    I = spm_read_vols(VA(i));
    It = imfill(I,'holes');clear I;
    for j =1:NStruct
        ind  = find(It == StrList(j));
        if chv ==1
            Nv = length(ind);
            Vt = voxvol*Nv/1000;%cm^3
        else
            Vt = 0;
        end
        if cha ==1
            dat = zeros(size(It));
            dat(ind) = 1;
            [Vtem,P] = crop_st(dat,VA(i),[2 2 2]);
            [At] = Ver_Ext(Vtem,P);
        else
            At = 0;
        end
        A(i,j) = At;
        V(i,j) = Vt;
    end
    waitbar(i/Ns,H,['Subject ' num2str(i) ' of ' num2str(Ns)  ' : Number of Structures = ' num2str(NStruct)]);
    clear dat It P;
end
close(H);
if size(A,1) == 1
    Am = mean(A,1);As = std(A,1);
    Vm = mean(V,1)';Vs = std(V,1)';
else
    Am = mean(A)';As = std(A)';
    Vm = mean(V)';Vs = std(V)';
end
for i=1:NStruct
    a(i) = length(char(StructNames{1,i}));
end;
L = max(a); % Maximum Length of Structure Names
S0 = repmat(' ',1,round(L/2)-round(length('Structure')/2));
S1 = repmat(' ',1,round(L/2));
%Saving Results
if chv ==1
    [pth,nm,ext] = fileparts(Out_files(1,:));
    Out_VolMatFile = [pth filesep nm '.mat'];
    save(Out_VolMatFile,'V');
end
if cha ==1
    [pth,nm,ext] = fileparts(Out_files(2,:));
    Out_AreaMatFile = [pth filesep nm '.mat'];
    save(Out_AreaMatFile,'A');
end
fidv = fopen(Out_files(1,:),'w');
fida = fopen(Out_files(2,:),'w');
if Ns==1
    fprintf(fidv,'%s%s%s%s    \r',S0,'Structure',S1,'Volume (cm^3)');
    fprintf(fida,'%s%s%s%s    \r',S0,'Structure',S1,'Area (cm^2)');
    fprintf(fidv,'\r');
    fprintf(fida,'\r');
    for i=1:NStruct
        sL = length(char(StructNames{1,i}));
        sp = L-sL;
        S = repmat('_',1,sp);
        fprintf(fidv,'%s  %s  %8.4f\r',char(StructNames{StrList(1,i)}),S,V(1,i));
        fprintf(fida,'%s  %s  %8.4f\r',char(StructNames{StrList(1,i)}),S,A(1,i));
    end;
else
    Statv = [Vm Vs];
    Stata = [Am As];
    fprintf(fidv,'%s%s%s%s    %s \r',S0,'Structure',S1,'Mean (cm^3)','STD (cm^3) ');
    fprintf(fida,'%s%s%s%s    %s \r',S0,'Structure',S1,'Mean (cm^2)','STD (cm^2) ');
    fprintf(fidv,'\r');
    fprintf(fida,'\r');
    for i=1:NStruct
        sL = length(char(StructNames{StrList(1,i)}));
        sp = L-sL;
        S = repmat('_',1,sp);
        fprintf(fidv,'%s  %s  %8.4f     %8.4f\r',char(StructNames{StrList(1,i)}),S,Statv(i,1),Statv(i,2));
        fprintf(fida,'%s  %s  %8.4f     %8.4f\r',char(StructNames{StrList(1,i)}),S,Stata(i,1),Stata(i,2));
    end;
end;
fclose(fidv);
fclose(fida);
if chv ==0
    delete(Out_files(1,:));
end
if cha ==0
   delete(Out_files(2,:));
end

%=================== Internal Functions ==================================%
function StrList = Sel_Structs(StrL,StructCodes);
% (subfunction)
% Select a number of structures.
%
% Author: Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% December 22th 2005
% Version $1.0

StrL = lower(StrL);
if ~strcmp(StrL,'all')
    Del = strread(StrL,'%s','delimiter',',');
    StrList = 0;
    for i = 1:length(Del)
        Temp = strread(Del{i,1},'%s','delimiter','-');
        if length(Temp)==2
            StrList = [StrList eval([Temp{1,1} ':' Temp{2,1} ])];
        else
            StrList = [StrList str2num(cell2mat(Temp))];
        end
    end
    StrList(1) =[];
else
    StrList = 1:length(StructCodes);
end

function [At] = Ver_Ext(Vtem,dat);
% (subfunction)
% Extract a mesh from a binary mask using matlab script isosurface.
%
% Author: Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% December 1 2006
% Version $1.0
dim = Vtem.dim(1:3)';
siz = sqrt(sum(Vtem.mat(1:3,1:3).^2));;
x = siz(1)*[1:dim(1)]'; y = siz(2)*[1:dim(2)]'; z = siz(3)*[1:dim(3)]';
meshx = x;meshy = y;meshz = z;
[meshx,meshy,meshz]=meshgrid(meshx,meshy,meshz);
dat=permute(dat,[2 1 3]);
fv=isosurface(meshx,meshy,meshz,dat);
[At] = Area_Comp(fv);

function [At] = Area_Comp(fv);
% (subfunction)
% Function to compute a mesh area.
%
% Author: Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% December 1 2006
% Version $1.0
At = 0;
N = length(fv.faces);
for i = 1:N;
    di = dist(fv.vertices(fv.faces(i,:),:)');
    A = abs(di(1,2));
    B = abs(di(1,3));
    C = abs(di(2,3));
    p = (A+B+C)/2;
    Ar = sqrt(p*(p-A)*(p-B)*(p-C));
    At = At+Ar;
end
At = real(At)/100;% cm^2
return

function [V, P] = crop_st(P,VA, borders);
% (subfunction)
% Function to crop structures inside an atlas file.
%
% Author: Yasser Aleman Gomez
% Neuroimaging Department
% Cuban Neuroscience Center
% March 1 2005
% Version $1.0
S = size(P);
borders = 2*borders;
ind = find(P);
[x,y,z] = ind2sub(S,ind);
P = P(min(x):max(x),min(y):max(y),min(z):max(z));
S = size(P);
P(end + borders(1),end + borders(2),end + borders(3)) = 0;
d = round((size(P)/2) - (S/2));
P = translateImageN0(P,d(1),d(2),d(3));
[pathstr,name,ext,vers] = fileparts(VA.fname);
V = VA;
V.dim(1:3) = size(P);
vec = [min(x)-1 min(y)-1 min(z)-1] - borders/2; vec = V.mat(1:3,1:3)*vec';
V.mat(1:3,4) = V.mat(1:3,4) + vec;
return;

function r = translateImageN0(f,di,dj,dk)

% (subfunction)
% Translation of a ND image in 3D space
%
% Author: Pedro Antonio Valdes-Hernandez
% Neuroimaging Department
% Cuban Neuroscience Center
% March 1 2001
% Version $4.0

S = size(f);
r = zeros(S);
N = S(1); M = S(2); P = S(3);
if di > 0
    iindr =  di+1:N;
    iindf =  1:N-di;
elseif di < 0
    iindr =  1:N+di;
    iindf = -di+1:N;
else
    iindr = 1:N;
    iindf = 1:N;
end
if dj > 0
    jindr =  dj+1:M;
    jindf =  1:M-dj;
elseif dj < 0
    jindr =  1:M+dj;
    jindf = -dj+1:M;
else
    jindr = 1:M;
    jindf = 1:M;
end
if dk > 0
    kindr =  dk+1:P;
    kindf =  1:P-dk;
elseif dk < 0
    kindr =  1:P+dk;
    kindf = -dk+1:P;
else
    kindr = 1:P;
    kindf = 1:P;
end
r(iindr,jindr,kindr,:) = f(iindf,jindf,kindf,:);
return;
