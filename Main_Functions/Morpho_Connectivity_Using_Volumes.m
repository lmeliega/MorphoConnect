function varargout = Morpho_Connectivity_Using_Volumes(varargin)
%MORPHO_CONNECTIVITY_USING_VOLUMES M-file for Morpho_Connectivity_Using_Volumes.fig
%      MORPHO_CONNECTIVITY_USING_VOLUMES, by itself, creates a new MORPHO_CONNECTIVITY_USING_VOLUMES or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTIVITY_USING_VOLUMES returns the handle to a new MORPHO_CONNECTIVITY_USING_VOLUMES or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTIVITY_USING_VOLUMES('Property','Value',...) creates a new MORPHO_CONNECTIVITY_USING_VOLUMES using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Connectivity_Using_Volumes_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTIVITY_USING_VOLUMES('CALLBACK') and MORPHO_CONNECTIVITY_USING_VOLUMES('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTIVITY_USING_VOLUMES.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Connectivity_Using_Volumes

% Last Modified by GUIDE v2.5 20-May-2009 15:12:55

global AgeList GenderList StructureCodesFile StructuresVolumeFile AtlasesFiles MorphoConnectMatrixFile OtherVariablesFile ...
       SubjectsList IndexStructureFile IntracranealVolumeFile SubjectsFullList

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Connectivity_Using_Volumes_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Connectivity_Using_Volumes_OutputFcn, ...
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


% --- Executes just before Morpho_Connectivity_Using_Volumes is made visible.
function Morpho_Connectivity_Using_Volumes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Connectivity_Using_Volumes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Atlas_Files');
set(h,'Enable','off');

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIntracranealVolume');
set(h,'Enable','off');

h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
set(h,'Enable','off');

h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','EditBootstrapFile');
set(h,'Enable','off');
h = findobj('Tag','PushbuttonBootstrapFile');
set(h,'Enable','off')
% UIWAIT makes Morpho_Connectivity_Using_Volumes wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Atlas_Files');
set(h,'Enable','off');

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','off');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','off');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIntracranealVolume');
set(h,'Enable','off');

h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
set(h,'Enable','off');

h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','EditBootstrapFile');
set(h,'Enable','off');
h = findobj('Tag','PushbuttonBootstrapFile');
set(h,'Enable','off')
% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Connectivity_Using_Volumes_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off
close;


% --- Executes on button press in BrowseButtonAgesFile.
function BrowseButtonAgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global AgeList

dir = cd;
AgeList = spm_select([1 Inf],'txt','Loading List of Age Files','',dir);

Cad_in = '';
[n,m] = size(AgeList);
for i =1:n
    Temp = AgeList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_AgesFile');
set(h,'String',Cad_in);


% --- Executes on button press in BrowseButtonGenderFile.
function BrowseButtonGenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonGenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GenderList

dir = cd;
GenderList = spm_select([1 Inf],'txt','Loading List of Gender Files','',dir);

Cad_in = '';
[n,m] = size(GenderList);
for i =1:n
    Temp = GenderList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_GenderFile');
set(h,'String',Cad_in);


% --- Executes on button press in BrowseButtonStructureCodes.
function BrowseButtonStructureCodes_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditStructureCodes');
set(h,'String',StructureCodesFile);


% --- Executes on button press in BrowseButtonStructVolsFile.
function BrowseButtonStructVolsFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructVolsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructuresVolumeFile

dir = cd;
StructuresVolumeFile = spm_select([1 Inf],'any','Loading Structure Volume Files','',dir);

Cad_in = '';
[n,m] = size(StructuresVolumeFile);
for i =1:n
    Temp = StructuresVolumeFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_StructuresVolumesFile');
set(h,'String', Cad_in);

Nm = size(StructuresVolumeFile,1); % Number of Data matrices.

if Nm==2
   h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
   set(h,'Enable','on');
   set(h,'Value',1);
   h = findobj('Tag', 'EditNBootstrap');
   set(h,'Enable','on');
   set(h,'String',num2str(300));
   h = findobj('Tag', 'TextNumberofBoostraps');
   set(h,'Enable','on');
else
   h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
   set(h,'Value',0);
   h = findobj('Tag', 'EditNBootstrap');
   set(h,'String','');
   set(h,'Enable','off');   
   h = findobj('Tag', 'TextNumberofBoostraps');
   set(h,'Enable','off');    
end;

% --- Executes on button press in BrowseButtonAtlasFiles.
function BrowseButtonAtlasFiles_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAtlasFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global AtlasesFiles

dir = cd;
AtlasesFiles = spm_select([1 Inf],'any','Selecting Atlas Files (i.e. from IBASPM, CIVET)','',dir);

Cad_in = '';
[n,m] = size(AtlasesFiles);
for i =1:n
    Temp = AtlasesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'String',Cad_in);

% [PathFile,FileName,FileExt] = fileparts(deblank(AtlasesFiles(1,:)));
% if strcmpi(FileExt,'dat') % For CIVET Volume Files
%     h = findobj('Tag','BrowseButtonAtlasFiles');
%     set(h,'Enable','off');
%     h = findobj('Tag','Edit_Atlas_Files');
%     set(h,'Enable','off');
% else     
% end;

% --- Executes on button press in RadioButtonLoadFile.
function RadioButtonLoadFile_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonLoadFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonLoadFile

global AtlasesFiles SubjectsFullList SubjectsList

AtlasesFiles ='';
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'String',AtlasesFiles);

h = findobj('Tag','BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Atlas_Files');
set(h,'Enable','off');

h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','on');

% h = findobj('Tag','EditIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag','PushButtonIndexStructures');
% set(h,'Enable','off');

SubjectsFullList = '';
SubjectsList = '';
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','PushButtonFullListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditFullListSubjects');
set(h,'Enable','on');


% --- Executes on button press in RadioButtonComputeHere.
function RadioButtonComputeHere_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonComputeHere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonComputeHere

global StructuresVolumeFile SubjectsList IndexStructureFile SubjectsFullList

StructuresVolumeFile = '';

h = findobj('Tag', 'Edit_StructuresVolumesFile');
set(h,'String',StructuresVolumeFile);

h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','off');

h = findobj('Tag','BrowseButtonAtlasFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Atlas_Files');
set(h,'Enable','on');

% IndexStructureFile = '';
% h = findobj('Tag','EditIndexStructures');
% set(h,'String',IndexStructureFile);
% set(h,'Enable','on');
% h = findobj('Tag','PushButtonIndexStructures');
% set(h,'Enable','on');

SubjectsList = '';
h = findobj('Tag','EditListSubjects');
set(h,'String',SubjectsList);
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');

SubjectsFullList = '';
h = findobj('Tag','PushButtonFullListSubjects');
set(h,'Enable','off');
h = findobj('Tag','EditFullListSubjects');
set(h,'Enable','off');

% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','on');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9

set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','on');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10

set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','on');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11

set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);

h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','on');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);

h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','off');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','off');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','off');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','off');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','off');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','off');

% --- Executes on button press in ChangePushButton3.
function ChangePushButton3_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MorphoConnectMatrixFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
MorphoConnectMatrixFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'edit5');
    set(h,'String',MorphoConnectMatrixFile);
end;
% --- Executes on button press in PushbuttonOtherVariables.
function PushbuttonOtherVariables_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOtherVariables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OtherVariablesFile

dir = cd;
OtherVariablesFile = spm_select([1 Inf],'txt','Loading Other Variables File','',dir);

Cad_in = '';
[n,m] = size(OtherVariablesFile);
for i =1:n
    Temp = OtherVariablesFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditOtherVariables');
set(h,'String',Cad_in);

% --- Executes on button press in PushButtonListSubjects.
function PushButtonListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SubjectsList

dir = cd;
SubjectsList = spm_select([1 Inf],'txt','Loading Subject List File','',dir);

Cad_in = '';
[n,m] = size(SubjectsList);
for i =1:n
    Temp = SubjectsList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditListSubjects');
set(h,'String',Cad_in);

% --- Executes on button press in PushButtonFullListSubjects.
function PushButtonFullListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonFullListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsFullList

dir = cd;
SubjectsFullList = spm_select([1 Inf],'txt','Loading Full Subject List File','',dir);

Cad_in = '';
[n,m] = size(SubjectsFullList);
for i =1:n
    Temp = SubjectsFullList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditFullListSubjects');
set(h,'String',Cad_in);

% --- Executes on button press in PushButtonIntracranealVolume.
function PushButtonIntracranealVolume_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonIntracranealVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IntracranealVolumeFile

dir = cd;
IntracranealVolumeFile = spm_select([1 Inf],'txt','Loading Intracraneal Volume File ...','',dir);

Cad_in = '';
[n,m] = size(IntracranealVolumeFile);
for i =1:n
    Temp = IntracranealVolumeFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditIntracranealVolume');
set(h,'String',Cad_in);

% --- Executes on button press in CheckboxIncludeMeanEffect.
function CheckboxIncludeMeanEffect_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxIncludeMeanEffect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxIncludeMeanEffect

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag', 'CheckboxIntracranealVolume');
    set(h,'Value',0);
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','off');
    h = findobj('Tag','PushButtonIntracranealVolume');
    set(h,'Enable','off');
end

% --- Executes on button press in CheckboxIntracranealVolume.
function CheckboxIntracranealVolume_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxIntracranealVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxIntracranealVolume

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag', 'CheckboxIncludeMeanEffect');
    set(h,'Value',0);
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','on');
    h = findobj('Tag','PushButtonIntracranealVolume');
    set(h,'Enable','on');
else
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','off');
    h = findobj('Tag','PushButtonIntracranealVolume');
    set(h,'Enable','off');
end

% --- Executes on button press in CheckboxBootstrapConnectMatrix.
function CheckboxBootstrapConnectMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxBootstrapConnectMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxBootstrapConnectMatrix
global StructuresVolumeFile

Nm = size(StructuresVolumeFile,1); % Number of Data matrices.

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','on');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','on');
    if Nm==1
        h = findobj('Tag','EditNSubjects');
        set(h,'Enable','on');
        h = findobj('Tag','TextNSubjects');
        set(h,'Enable','on');

        h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
        set(h,'Enable','on');
        set(h,'Value',0);
        h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
        set(h,'Enable','on');
        set(h,'Value',0);
        h = findobj('Tag','EditBootstrapFile');
        set(h,'Enable','off');
    else
        h = findobj('Tag','EditNSubjects');
        set(h,'Enable','off');
        h = findobj('Tag','TextNSubjects');
        set(h,'Enable','off');

        h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
        set(h,'Enable','off');
        set(h,'Value',0);
        h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
        set(h,'Enable','off');
        set(h,'Value',0);
        h = findobj('Tag','EditBootstrapFile');
        set(h,'Enable','off');        
    end;
else
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','off');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','off');
    h = findobj('Tag','EditNSubjects');
    set(h,'Enable','off');
    h = findobj('Tag','TextNSubjects');
    set(h,'Enable','off');
    h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
    set(h,'Enable','off');
    h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
    set(h,'Enable','off');
    h = findobj('Tag','EditBootstrapFile');
    set(h,'Enable','off');
end;

% --- Executes on button press in PushbuttonBootstrapFile.
function PushbuttonBootstrapFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonBootstrapFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global InputBootstrapFile

dir = cd;
InputBootstrapFile = spm_select([1 Inf],'mat','Loading Bootstraping File ...','',dir);

Cad_in = '';
[n,m] = size(InputBootstrapFile);
for i =1:n
    Temp = InputBootstrapFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditBootstrapFile');
set(h,'String',Cad_in);

% --- Executes on button press in RadiobuttonSaveBootstrapSamples.
function RadiobuttonSaveBootstrapSamples_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonSaveBootstrapSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonSaveBootstrapSamples

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
    set(h,'Value',0);
    h = findobj('Tag','EditBootstrapFile');
    set(h,'Enable','off');
    h = findobj('Tag','PushbuttonBootstrapFile');
    set(h,'Enable','off');
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','on');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','on');
    h = findobj('Tag','EditNSubjects');
    set(h,'Enable','on');
    h = findobj('Tag','TextNSubjects');
    set(h,'Enable','on');
end;


% --- Executes on button press in RadiobuttonLoadBootstrapSamples.
function RadiobuttonLoadBootstrapSamples_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonLoadBootstrapSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonLoadBootstrapSamples

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
    set(h,'Value',0);
    h = findobj('Tag','EditBootstrapFile');
    set(h,'Enable','on');
    h = findobj('Tag','PushbuttonBootstrapFile');
    set(h,'Enable','on');
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','off');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','off');
    h = findobj('Tag','EditNSubjects');
    set(h,'Enable','off');
    h = findobj('Tag','TextNSubjects');
    set(h,'Enable','off');
else
    h = findobj('Tag','EditBootstrapFile');
    set(h,'Enable','off');
    h = findobj('Tag','PushbuttonBootstrapFile');
    set(h,'Enable','off');
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','on');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','on');
    h = findobj('Tag','EditNSubjects');
    set(h,'Enable','on');
    h = findobj('Tag','TextNSubjects');
    set(h,'Enable','on');    
end;

% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeList GenderList StructureCodesFile StructuresVolumeFile AtlasesFiles MorphoConnectMatrixFile OtherVariablesFile ...
       SubjectsList IntracranealVolumeFile SubjectsFullList InputBootstrapFile

warning off;

h = findobj('Tag', 'radiobutton8');
M1 = get(h,'Value');
h = findobj('Tag', 'radiobutton9');
M2 = get(h,'Value');
h = findobj('Tag', 'radiobutton10');
M3 = get(h,'Value');
h = findobj('Tag', 'radiobutton11');
M4 = get(h,'Value');
h = findobj('Tag', 'radiobutton15');
M5 = get(h,'Value');

glm_Model = [M1,M2,M3,M4,M5];
glm_Model = find(glm_Model);

h = findobj('Tag', 'CheckboxJointData');
IsSubractingJointEffect = get(h,'Value');

Nm = size(StructuresVolumeFile,1); % Number of Data matrices.

if (~isempty(SubjectsList))&&(~isempty(SubjectsFullList))
    indF = findIDsFiles(SubjectsList(1,:),SubjectsFullList(1,:));  % Finding indexes of the reduced list of subjects for the first data.
    if Nm==2
       indF2= findIDsFiles(SubjectsList(2,:),SubjectsFullList(2,:));  % Finding indexes of the reduced list of subjects for the second data.
    end;
else
    indF = [];
    if Nm==2
        indF2 = [];
    end;
end;

Gender = ''; Gender2 = '';
Age = ''; Age2 = '';

if glm_Model~=5
    if glm_Model~=3
        gender = textread(GenderList(1,:),'%s');
        if ~isempty(indF)
            gender = gender(indF);
        end;
        Gender = term(gender);
        if Nm==2
            gender2 = textread(GenderList(2,:),'%s');
            if ~isempty(indF2)
                gender2 = gender2(indF2);
            end;            
            if IsSubractingJointEffect
                gender = [gender;gender2];
                Gender = term(gender);
            else
                Gender2 = term(gender2);
            end;
        end;
    end;
    if glm_Model~=4
        age = importdata(AgeList(1,:));
        if ~isempty(indF)
            age = age(indF);
        end;
        Age = term(age);
        if Nm==2
            age2 = importdata(AgeList(2,:));
            if ~isempty(indF2)
                age2 = age2(indF2);
            end;
            if IsSubractingJointEffect
                age = [age;age2];
                Age = term(age);
            else
                Age2 = term(age2);
            end;
        end;
    end;   
end;

h = findobj('Tag', 'RadioButtonComputeHere');
ComputeHere = get(h,'Value');

h = findobj('Tag', 'CheckboxIncludeMeanEffect');
IsMeanEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxIntracranealVolume');
IsVolumeEffectIncluded = get(h,'Value');

if ComputeHere
    [PathFile,FileName,FileExt] = fileparts(deblank(AtlasesFiles(1,:)));
    isCIVET = strcmpi(FileExt,'.dat');  % Identifying type of files: from CIVET or IBASPM
    %isIBASPM = strcmpi(FileExt,'.img');
end;
% Reading Code File
Structures = ReadCodeFile(StructureCodesFile);

NStruct = length(Structures);
FilePath = fileparts(MorphoConnectMatrixFile);
VolStatsFile = [FilePath,filesep,'AllStructVols.txt'];
VolStatsFile = strvcat(VolStatsFile,VolStatsFile);
if  ComputeHere     
    if ~isempty(SubjectsList)
        AtlasesFiles = findFiles(SubjectsList,AtlasesFiles);
    end;
    if isCIVET
        Y = readVolsCIVET(AtlasesFiles,StructureCodesFile);
    else % Reading IBASPM Atlases, in Nifti or Analyze format
        chv = 1; % To compute structure volumes.
        cha = 0; % The Structures areas will not be calculated.
        Y = Vols_Area_Stats(AtlasesFiles,StructureCodesFile,VolStatsFile,'all',chv,cha);
    end;
else
    [FilePath,FileName,FileExt] = fileparts(StructuresVolumeFile(1,:));
    Y1 = load(deblank(StructuresVolumeFile(1,:))); 
    if strcmpi(FileExt,'.mat')
        if isfield(Y1,'V')
            Y1 = Y1.V;
        else
            Y1 = Y1.Y;
        end;
    end;
    Y2 = [];
    if Nm==2
        Y2 = load(deblank(StructuresVolumeFile(2,:)));
        if strcmpi(FileExt,'.mat')
            if isfield(Y2,'V')
                Y2 = Y2.V;
            else
                Y2 = Y2.Y;
            end;
        end;
    end;    
end;
if ~isempty(indF)
    Y1 = Y1(indF,:);
end;
if Nm==2
    if ~isempty(indF2)
        Y2 = Y2(indF2,:);
    end;
end;
GrayMatVolume = [];
GrayMatVolume2 = [];
if IsMeanEffectIncluded
    GrayMatVolume1 = sum(Y1,2);
    GrayMatVolume = term(GrayMatVolume1);
    if Nm==2
        GrayMatVolume2 = sum(Y2,2);
        if IsSubractingJointEffect
            GrayMatVolume = [GrayMatVolume1;GrayMatVolume2];
            GrayMatVolume = term(GrayMatVolume);
        else
            GrayMatVolume2 = term(GrayMatVolume2);
        end;
    end;    
end;
if IsVolumeEffectIncluded
    GrayMatVolume1 = load(deblank(IntracranealVolumeFile(1,:)));
    if ~isempty(indF)
        GrayMatVolume1 = GrayMatVolume1(indF);
    end;
    GrayMatVolume = term(GrayMatVolume1);
    if Nm==2
        GrayMatVolume2 = load(deblank(IntracranealVolumeFile(2,:)));
        if ~isempty(indF2)
            GrayMatVolume2 = GrayMatVolume2(indF2);
        end;
        if IsSubractingJointEffect
            GrayMatVolume = [GrayMatVolume1;GrayMatVolume2];
            GrayMatVolume = term(GrayMatVolume);
        else
            GrayMatVolume2 = term(GrayMatVolume2);
        end;
    end;
    
end;
if ~isempty(OtherVariablesFile)
    fid = fopen(deblank(OtherVariablesFile(1,:)));
    first_char = fgetl(fid);
    fclose(fid);
    if isnumeric(first_char)
        OtherVars1 = importdata(OtherVariablesFile(1,:));
        OtherVars2 = [];
    else
        OtherVars1 = textread(OtherVariablesFile(1,:),'%s');
        OtherVars2 = {};
    end;    
    if ~isempty(indF)
        OtherVars1 = OtherVars1(indF,:);
    end;    
    if Nm==2
        if isnumeric(first_char)
            OtherVars2 = importdata(OtherVariablesFile(2,:));
        else
            OtherVars2 = textread(OtherVariablesFile(2,:),'%s');
        end;
        if ~isempty(indF2)
            OtherVars2 = OtherVars2(indF2,:);
        end;
    end;
    OtherVars = term(OtherVars1);
    if IsSubractingJointEffect
        OtherVars = [OtherVars1;OtherVars2];
        OtherVars = term(OtherVars);
    else
        OtherVars2 = term(OtherVars2);
    end;
else
    OtherVars = 0;
    OtherVars = term(OtherVars);
    OtherVars2 = OtherVars;
end;

Ns1 = size(Y1,1);   % Number of subjects of the first Data set

IsMeanEffectIncluded = IsMeanEffectIncluded||IsVolumeEffectIncluded;
if Nm==2
    if IsSubractingJointEffect
        Y = [Y1;Y2]; % Joining data from two possible dataset ...
        [Y,GLMModel] = SubstractEffects_GLM(Y, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
        Y1 = Y(1:Ns1,:);
        Y2 = Y(Ns1+1:end,:); 
    else
        [Y1,GLMModel] = SubstractEffects_GLM(Y1, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
        [Y2,GLMModel] = SubstractEffects_GLM(Y2, glm_Model, IsMeanEffectIncluded, Age2, Gender2, GrayMatVolume2, OtherVars2);        
    end;
else % Case of one dataset.    
    [Y1,GLMModel] = SubstractEffects_GLM(Y1, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
end;

h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
IsMakeBoostraping = get(h,'Value');
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
LoadBootstrapSamples = get(h,'Value');

h = findobj('Tag', 'Popupmenu_Connectivity_Method'); % Type of Correlation Method: 1) Pearson Correlation; 2) Partial Correlation. 
Connectivity_Method = get(h,'Value'); 
switch Connectivity_Method
    case 1
        Connectivity_Method_Label = 'Pearson Correlation';
    case 2
        Connectivity_Method_Label = 'Partial Correlation';
    case 3
        Connectivity_Method_Label = 'Distance Correlation';        
end;

if IsMakeBoostraping
    h = findobj('Tag','EditNBootstrap');
    Nboot = str2double(get(h,'String'));       
    if Nm==2
        switch Connectivity_Method
            case 1  % Pearson Correlation
                ConnectMatrix1 = corrcoef(Y1);
                ConnectMatrix2 = corrcoef(Y2);
            case 2  % Partial Correlation
                ConnectMatrix1 = partial_correlation(Y1);
                ConnectMatrix2 = partial_correlation(Y2);
            case 3  % Distance Correlation
                ConnectMatrix1 = distancecorrM(Y1);
                ConnectMatrix2 = distancecorrM(Y2);
        end;
        % Zeroing diagonal elements of Connectivity matrix
        i = 1:NStruct;
        inddiag = (i-1)*NStruct + i;
        ConnectMatrix1(inddiag) = 0; %#ok
        ConnectMatrix1 = 0.5*(ConnectMatrix1 + ConnectMatrix1');
        ConnectMatrix2(inddiag) = 0; %#ok
        ConnectMatrix2 = 0.5*(ConnectMatrix2 + ConnectMatrix2');
        [ConnectMatrix1_boot,ConnectMatrix2_boot] = Morpho_bootstrap01(Y1,Y2,Nboot,1,0,Connectivity_Method);
    else
        h = findobj('Tag', 'EditNSubjects'); 
        Nsubj = str2double(get(h,'String'));
        if LoadBootstrapSamples
            ind = load(InputBootstrapFile);
            ind = ind.indbootstrap;
            ConnectMatrix1 = Morpho_bootstrap01(Y1,'',0,0,ind,Connectivity_Method); %#ok % Case of one dataset.
        else
            [ConnectMatrix1,XX,indbootstrap] = Morpho_bootstrap01(Y1,'',Nboot,Nsubj,'',Connectivity_Method); %#ok % Case of one dataset.
        end;
    end;
else
    switch Connectivity_Method
        case 1  % Pearson Correlation
            ConnectMatrix1 = corrcoef(Y1);
        case 2  % Partial Correlation
            ConnectMatrix1 = partial_correlation(Y1);
        case 3  % Distance Correlation
            ConnectMatrix1 = distancecorrM(Y1);
    end;
    % Zeroing diagonal elements of Connectivity matrix
    i = 1:NStruct;
    inddiag = (i-1)*NStruct + i;
    ConnectMatrix1(inddiag) = 0; %#ok
    ConnectMatrix1 = 0.5*(ConnectMatrix1 + ConnectMatrix1');
    if Nm==2
        switch Connectivity_Method
            case 1  % Pearson Correlation
                ConnectMatrix2 = corrcoef(Y2);
            case 2  % Partial Correlation
                ConnectMatrix2 = partial_correlation(Y2);
            case 3  % Distance Correlation
                ConnectMatrix1 = distancecorrM(Y2);
        end;
        % Zeroing diagonal elements of Connectivity matrix
        i = 1:NStruct;
        inddiag = (i-1)*NStruct + i;
        ConnectMatrix2(inddiag) = 0; %#ok
        ConnectMatrix2 = 0.5*(ConnectMatrix2 + ConnectMatrix2');
    end;
end;

% Saving Connectivity matrices ...
thres = 0.05;
if Nm==2  % Case of two dataset.   
    % Saving 1st group
    ConnectMatrix.ConMat = ConnectMatrix1;
    ConnectMatrix.Structures = Structures;
    ConnectMatrix.GLMModel = GLMModel;
    ConnectMatrix.thres = thres;
    ConnectMatrix.Connectivity_Method = Connectivity_Method_Label;
    [pth,name,ext] = fileparts(MorphoConnectMatrixFile);
    [pth_in1,name_in1] = fileparts(StructuresVolumeFile(1,:));
    name_in1 = [name_in1,'_1st'];
    MorphoConnectMatrixFile1 = [pth,filesep,'Connect_Matrix_',name_in1,'.mat'];
    save(MorphoConnectMatrixFile1,'ConnectMatrix');

    % Saving 2nd group
    ConnectMatrix.ConMat = ConnectMatrix2;
    [pth_in2,name_in2] = fileparts(StructuresVolumeFile(2,:));
    name_in2 = [name_in2,'_2nd'];
    MorphoConnectMatrixFile2 = [pth,filesep,'Connect_Matrix_',name_in2,'.mat'];
    save(MorphoConnectMatrixFile2,'ConnectMatrix');
    
    if IsMakeBoostraping
        % Saving Boostrap 1st group
        ConnectMatrix.Nboot = Nboot;
        ConnectMatrix.ConMat = ConnectMatrix1_boot;
        MorphoConnectMatrixFile1 = [pth,filesep,'Connect_Matrix_',name_in1,'_bootstrap.mat'];
        save(MorphoConnectMatrixFile1,'ConnectMatrix');

        % Saving Boostrap 2nd group
        ConnectMatrix.ConMat = ConnectMatrix2_boot;
        MorphoConnectMatrixFile2 = [pth,filesep,'Connect_Matrix_',name_in2,'_bootstrap.mat'];
        save(MorphoConnectMatrixFile2,'ConnectMatrix');
    end;
else  % Case of one dataset.
    ConnectMatrix.ConMat = ConnectMatrix1;
    ConnectMatrix.Structures = Structures;
    ConnectMatrix.GLMModel = GLMModel;
    ConnectMatrix.thres = thres;
    ConnectMatrix.Connectivity_Method = Connectivity_Method_Label;    
    if IsMakeBoostraping
        if LoadBootstrapSamples
            [Nsubj,Nboot] = size(ind);
        end;
        ConnectMatrix.Nboot = Nboot;
        ConnectMatrix.Nsubj = Nsubj;
    end;
    save(MorphoConnectMatrixFile,'ConnectMatrix');
    h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
    SaveBootstrapSamples = get(h,'Value');
    if SaveBootstrapSamples
        [pth,name,ext] = fileparts(MorphoConnectMatrixFile);
        IndbootstrapFile = [pth,filesep,'Bootstraping_samples_',name,ext];
        save(IndbootstrapFile,'indbootstrap');
    end;
end;

close;