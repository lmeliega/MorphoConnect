function varargout = Morpho_Preprocessing(varargin)
%PREPROCESSING M-file for Preprocessing.fig
%      PREPROCESSING, by itself, creates a new PREPROCESSING or raises the existing
%      singleton*.
%
%      H = PREPROCESSING returns the handle to a new PREPROCESSING or the handle to
%      the existing singleton*.
%
%      PREPROCESSING('Property','Value',...) creates a new PREPROCESSING using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Preprocessing_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PREPROCESSING('CALLBACK') and PREPROCESSING('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PREPROCESSING.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Preprocessing

% Last Modified by GUIDE v2.5 27-Sep-2008 20:53:20

% Global Variables.
global CorticalThicknessFilesLeft CorticalThicknessFilesRight CorticalSurfaceFiles_Left CorticalSurfaceFiles_Right OutputThicknessListFile AverageSurfaceFile

%
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Preprocessing_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Preprocessing_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes just before Preprocessing is made visible.
function Morpho_Preprocessing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Preprocessing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Preprocessing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Preprocessing_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in BrowsePushButton1.
function BrowsePushButton1_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalThicknessFilesLeft

dir = cd;
CorticalThicknessFilesLeft = spm_select([1 Inf],'txt','Selecting Cortical Thickness Files','',dir,'left.*');

Cad_in = '';
[n,m] = size(CorticalThicknessFilesLeft);
for i =1:n
    Temp = CorticalThicknessFilesLeft(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Cortical_Thickness_Left');
set(h,'String',Cad_in);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalThicknessFilesRight

dir = cd;
CorticalThicknessFilesRight = spm_select([1 Inf],'txt','Selecting Cortical Thickness Files','',dir,'right.*');

Cad_in = '';
[n,m] = size(CorticalThicknessFilesRight);
for i =1:n
    Temp = CorticalThicknessFilesRight(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Cortical_Thickness_Right');
set(h,'String',Cad_in);


% --- Executes on button press in BrowsePushButton2.
function BrowsePushButton2_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalSurfaceFiles_Left 

dir = cd;
CorticalSurfaceFiles_Left = spm_select([1 Inf],'obj','Selecting Cortical Surface Files','',dir,'left.*');
%CorticalSurfaceFiles = spm_select([1 Inf],'*left*.obj','Selecting Cortical Surface Files','',dir,'left*.obj');

Cad_in = '';
[n,m] = size(CorticalSurfaceFiles_Left);
for i =1:n
    Temp = CorticalSurfaceFiles_Left(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_CorticalSurfaceFiles_Left');
set(h,'String',Cad_in);


% --- Executes on button press in ChangePushButton3.
function ChangePushButton3_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputThicknessListFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
OutputThicknessListFile = [pathname, filename];
h = findobj('Tag', 'edit5');
set(h,'String',OutputThicknessListFile);


% --- Executes on button press in ChangePushButton.
function ChangePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AverageSurfaceFile

[filename, pathname] = uiputfile({'*.obj';'*.*'},'Save as');
AverageSurfaceFile = [pathname, filename];
h = findobj('Tag', 'edit3');
set(h,'String',AverageSurfaceFile);


% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalSurfaceFiles_Right 

dir = cd;
CorticalSurfaceFiles_Right  = spm_select([1 Inf],'obj','Selecting Cortical Surface Files','',dir,'right.*');
%CorticalSurfaceFiles = spm_select([1 Inf],'*left*.obj','Selecting Cortical Surface Files','',dir,'left*.obj');

Cad_in = '';
[n,m] = size(CorticalSurfaceFiles_Right );
for i =1:n
    Temp = CorticalSurfaceFiles_Right (i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_CorticalSurfaceFiles_Right');
set(h,'String',Cad_in);

% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalThicknessFilesLeft CorticalThicknessFilesRight CorticalSurfaceFiles_Left CorticalSurfaceFiles_Right OutputThicknessListFile AverageSurfaceFile

warning off
% Doing Cortical Thickness File & Saving
NFiles = size(CorticalThicknessFilesLeft,1);
thickness_files_left = cell(NFiles,1);
thickness_files_right = cell(NFiles,1);
for i=1:NFiles
    thickness_files_left{i} = deblank(CorticalThicknessFilesLeft(i,:));
    thickness_files_right{i} = deblank(CorticalThicknessFilesRight(i,:));
end;
[FilePath,FileName] = fileparts(OutputThicknessListFile);
OutputThicknessListFile_Left = [FilePath,filesep,FileName,'_left.mat'];
OutputThicknessListFile_Rigth = [FilePath,filesep,FileName,'_right.mat'];
save(OutputThicknessListFile_Left,'thickness_files_left');
save(OutputThicknessListFile_Rigth,'thickness_files_right');

% Average Surface Computation & Saving
NFiles = size(CorticalSurfaceFiles_Left,1);
CorticalSurfaceFiles_Left01 = cell(NFiles,1);
CorticalSurfaceFiles_Right01 = cell(NFiles,1);
for i=1:NFiles
    CorticalSurfaceFiles_Left01{i} = deblank(CorticalSurfaceFiles_Left(i,:));
    CorticalSurfaceFiles_Right01{i} = deblank(CorticalSurfaceFiles_Right(i,:));
end;
CorticalSurfaceFiles_all = [CorticalSurfaceFiles_Left01 CorticalSurfaceFiles_Right01];

avsurf = SurfStatAv(CorticalSurfaceFiles_all); % Average surface computation.
SurfStatWriteSurf(AverageSurfaceFile,avsurf);
%mask = SurfStatMaskCut(avsurf); % calculo de la máscara
close;







