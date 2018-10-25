function varargout = Morpho_Connectivity_Variables_Fusion(varargin)
%MORPHO_CONNECTIVITY_VARIABLES_FUSION M-file for Morpho_Connectivity_Variables_Fusion.fig
%      MORPHO_CONNECTIVITY_VARIABLES_FUSION, by itself, creates a new MORPHO_CONNECTIVITY_VARIABLES_FUSION or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTIVITY_VARIABLES_FUSION returns the handle to a new MORPHO_CONNECTIVITY_VARIABLES_FUSION or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTIVITY_VARIABLES_FUSION('Property','Value',...) creates a new MORPHO_CONNECTIVITY_VARIABLES_FUSION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Connectivity_Variables_Fusion_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTIVITY_VARIABLES_FUSION('CALLBACK') and MORPHO_CONNECTIVITY_VARIABLES_FUSION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTIVITY_VARIABLES_FUSION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Connectivity_Variables_Fusion

% Last Modified by GUIDE v2.5 18-Nov-2008 18:24:15

global StructuresVolumeFile MeanThicknessFile StructureSurfaceAreaFile CorticalSurfaceAreaFile GenderList AgeList OtherVariablesFile ...
       StructureCodesFile GlobalMeanThicknessFile IntracranealVolumeFile SubjectsList MorphoConnectMatrixFile SubjectsFullList

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Connectivity_Variables_Fusion_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Connectivity_Variables_Fusion_OutputFcn, ...
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


% --- Executes just before Morpho_Connectivity_Variables_Fusion is made visible.
function Morpho_Connectivity_Variables_Fusion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Connectivity_Variables_Fusion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','on');
h = findobj('Tag','CheckboxIntracranealVolume');
set(h,'Enable','on');

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');


% h = findobj('Tag','Edit_Cortical_Labels');
% set(h,'Enable','off');
% h = findobj('Tag','BrowseButtonCorticalLabels');
% set(h,'Enable','off');
% h = findobj('Tag','Edit_Cortical_Thickness_Files');
% set(h,'Enable','off');
% h = findobj('Tag','BrowseButtonThicknessFiles');
% set(h,'Enable','off');
% h = findobj('Tag','Edit_StructuresMeanThicknessFile');
% set(h,'Enable','off');
% h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
% set(h,'Enable','off');
% h = findobj('Tag','EditIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag','PushButtonIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag','EditListSubjects');
% set(h,'Enable','on');
% h = findobj('Tag','PushButtonListSubjects');
% set(h,'Enable','on');
% h = findobj('Tag','EditIntracranealVolume');
% set(h,'Enable','off');
% h = findobj('Tag','PushButtonIntracranealVolume');
% set(h,'Enable','off');

% UIWAIT makes Morpho_Connectivity_Variables_Fusion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Connectivity_Variables_Fusion_OutputFcn(hObject, eventdata, handles)
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
warning off
close;


% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
close;


% --- Executes on button press in BrowseButtonStructVolsFile.
function BrowseButtonStructVolsFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructVolsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StructuresVolumeFile

dir = cd;
StructuresVolumeFile = spm_select(1,'any','Loading Structure Volumes File','',dir);
h = findobj('Tag', 'Edit_StructuresVolumesFile');
set(h,'String',StructuresVolumeFile);


% --- Executes on button press in BrowseButtonStructMeanThicknessFile.
function BrowseButtonStructMeanThicknessFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructMeanThicknessFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global MeanThicknessFile

dir = cd;
MeanThicknessFile = spm_select(1,'any','Loading File with all Thickness ','',dir);
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',MeanThicknessFile);

% --- Executes on button press in BrowseButtonStructureSurfaceAreaFile.
function BrowseButtonStructureSurfaceAreaFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructureSurfaceAreaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureSurfaceAreaFile

dir = cd;
StructureSurfaceAreaFile = spm_select(1,'any','Loading Structures Surface File ','',dir);
h = findobj('Tag', 'EditStructureSurfaceAreaFile');
set(h,'String',StructureSurfaceAreaFile);


% --- Executes on button press in BrowseButtonCorticalSurfaceFile.
function BrowseButtonCorticalSurfaceFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonCorticalSurfaceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalSurfaceAreaFile

dir = cd;
CorticalSurfaceAreaFile = spm_select(1,'any','Loading Cortical Surface File ','',dir);
h = findobj('Tag', 'EditCorticalSurfaceFile');
set(h,'String',CorticalSurfaceAreaFile);


% --- Executes on button press in BrowseButtonAgesFile.
function BrowseButtonAgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeList

dir = cd;
AgeList = spm_select(1,'txt','Loading List of Ages File','',dir);
h = findobj('Tag', 'Edit_AgesFile');
set(h,'String',AgeList);


% --- Executes on button press in BrowseButtonGenderFile.
function BrowseButtonGenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonGenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global GenderList

dir = cd;
GenderList = spm_select(1,'txt','Loading List of Gender File','',dir);
h = findobj('Tag', 'Edit_GenderFile');
set(h,'String',GenderList);


% --- Executes on button press in PushbuttonOtherVariables.
function PushbuttonOtherVariables_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOtherVariables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OtherVariablesFile

dir = cd;
OtherVariablesFile = spm_select(1,'txt','Loading Other Variables File','',dir);
h = findobj('Tag', 'EditOtherVariables');
set(h,'String',OtherVariablesFile);


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


% --- Executes on button press in BrowseAllMeanThicknessFile.
function BrowseAllMeanThicknessFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseAllMeanThicknessFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GlobalMeanThicknessFile

dir = cd;
GlobalMeanThicknessFile = spm_select(1,'txt','Loading Global Mean Thickness File','',dir);
h = findobj('Tag', 'EditGlobalMeanThicknessFile');
set(h,'String',GlobalMeanThicknessFile);


% --- Executes on button press in BrowseButtonIntracranealVolume.
function BrowseButtonIntracranealVolume_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonIntracranealVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IntracranealVolumeFile

dir = cd;
IntracranealVolumeFile = spm_select(1,'txt','Loading Subject List File','',dir);
h = findobj('Tag', 'EditIntracranealVolume');
set(h,'String',IntracranealVolumeFile);


% --- Executes on button press in BrowseButtonListSubjects.
function BrowseButtonListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsList

dir = cd;
SubjectsList = spm_select(1,'txt','Loading Subject List File','',dir);
h = findobj('Tag', 'EditListSubjects');
set(h,'String',SubjectsList);


% --- Executes on button press in PushButtonFullListSubjects.
function PushButtonFullListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonFullListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsFullList

dir = cd;
SubjectsFullList = spm_select(1,'txt','Loading Full Subject List File','',dir);
h = findobj('Tag', 'EditFullListSubjects');
set(h,'String',SubjectsFullList);
% --- Executes on button press in ChangePushButton.
function ChangePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global MorphoConnectMatrixFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
MorphoConnectMatrixFile = [pathname, filename];
h = findobj('Tag', 'EditOutputFile');
set(h,'String',MorphoConnectMatrixFile);


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

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
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

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
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
set(h,'Enable','off');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','off');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
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
set(h,'Enable','off');
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','off');

h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','on');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','on');

h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','on');

h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
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

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','off');

h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');


% --- Executes on button press in CheckboxVolume.
function CheckboxVolume_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxVolume

isChecked = get(hObject,'Value');
h = findobj('Tag','CheckboxStructureSurface');
isCheckedStructureSurface = get(h,'Value');

if isChecked
    h = findobj('Tag','BrowseButtonStructVolsFile');
    set(h,'Enable','on');
    h = findobj('Tag','Edit_StructuresVolumesFile');
    set(h,'Enable','on');
    h = findobj('Tag','CheckboxIntracranealVolume');
    set(h,'Enable','on');
    h = findobj('Tag','CheckboxIncludeMeanEffect');
    set(h,'Enable','on');
else
    h = findobj('Tag','BrowseButtonStructVolsFile');
    set(h,'Enable','off');
    h = findobj('Tag','Edit_StructuresVolumesFile');
    set(h,'Enable','off');
    h = findobj('Tag','BrowseButtonIntracranealVolume');
    set(h,'Enable','off');
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','off');     
    h = findobj('Tag','CheckboxIntracranealVolume');
    set(h,'Enable','off');
    set(h,'Value',0);
    h = findobj('Tag','CheckboxIncludeMeanEffect');
    if isCheckedStructureSurface
        set(h,'Enable','on');
    else        
        set(h,'Enable','off');
        set(h,'Value',0);
    end;
end;

% --- Executes on button press in CheckboxThickness.
function CheckboxThickness_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxThickness

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','BrowseButtonStructMeanThicknessFile');
    set(h,'Enable','on');
    h = findobj('Tag','Edit_StructuresMeanThicknessFile');
    set(h,'Enable','on');
    h = findobj('Tag','CheckboxMeanThicknessEffect');
    set(h,'Enable','on');  
else
    h = findobj('Tag','BrowseButtonStructMeanThicknessFile');
    set(h,'Enable','off');
    h = findobj('Tag','Edit_StructuresMeanThicknessFile');
    set(h,'Enable','off');    
    h = findobj('Tag','BrowseAllMeanThicknessFile');
    set(h,'Enable','off');
    h = findobj('Tag','EditGlobalMeanThicknessFile');
    set(h,'Enable','off');     
    h = findobj('Tag','CheckboxMeanThicknessEffect');
    set(h,'Enable','off');
    set(h,'Value',0);
end;


% --- Executes on button press in CheckboxStructureSurface.
function CheckboxStructureSurface_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxStructureSurface (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxStructureSurface

isChecked = get(hObject,'Value');

h = findobj('Tag','CheckboxVolume');
isCheckedVolumeEffect = get(h,'Value');

if isChecked
    h = findobj('Tag','BrowseButtonStructureSurfaceAreaFile');
    set(h,'Enable','on');
    h = findobj('Tag','EditStructureSurfaceAreaFile');
    set(h,'Enable','on');
    h = findobj('Tag','CheckboxIncludeMeanEffect');
    set(h,'Enable','on');
else
    h = findobj('Tag','BrowseButtonStructureSurfaceAreaFile');
    set(h,'Enable','off');
    h = findobj('Tag','CheckboxIncludeMeanEffect');
    if isCheckedVolumeEffect
        set(h,'Enable','on');
    else
        set(h,'Enable','off');
        set(h,'Value',0);
    end;    
    h = findobj('Tag','EditStructureSurfaceAreaFile');
    set(h,'Enable','off');
end;


% --- Executes on button press in CheckboxCorticalSurface.
function CheckboxCorticalSurface_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxCorticalSurface (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxCorticalSurface
isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','BrowseButtonCorticalSurfaceFile');
    set(h,'Enable','on');
    h = findobj('Tag','EditCorticalSurfaceFile');
    set(h,'Enable','on');
else
    h = findobj('Tag','BrowseButtonCorticalSurfaceFile');
    set(h,'Enable','off');
    h = findobj('Tag','EditCorticalSurfaceFile');
    set(h,'Enable','off');
end;


% --- Executes on button press in CheckboxMeanThicknessEffect.
function CheckboxMeanThicknessEffect_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxMeanThicknessEffect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxMeanThicknessEffect

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','BrowseAllMeanThicknessFile');
    set(h,'Enable','on');
    h = findobj('Tag','EditGlobalMeanThicknessFile');
    set(h,'Enable','on');
else
    h = findobj('Tag','BrowseAllMeanThicknessFile');
    set(h,'Enable','off');
    h = findobj('Tag','EditGlobalMeanThicknessFile');
    set(h,'Enable','off');
end;


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
    h = findobj('Tag','BrowseButtonIntracranealVolume');
    set(h,'Enable','on');
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','on');
else
    h = findobj('Tag','BrowseButtonIntracranealVolume');
    set(h,'Enable','off');
    h = findobj('Tag','EditIntracranealVolume');
    set(h,'Enable','off');
end;


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
% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructuresVolumeFile MeanThicknessFile StructureSurfaceAreaFile CorticalSurfaceAreaFile GenderList AgeList OtherVariablesFile ...
       StructureCodesFile GlobalMeanThicknessFile IntracranealVolumeFile SubjectsList MorphoConnectMatrixFile SubjectsFullList

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

if (~isempty(SubjectsList))&&(~isempty(SubjectsFullList))
    indF = findIDsFiles(SubjectsList,SubjectsFullList);  % Finding indexes of the reduced list of subjects.
else
    indF = [];
end;

Gender = '';
Age = '';
if glm_Model~=5
    if glm_Model~=3        
        gender = textread(GenderList,'%s');
        if ~isempty(indF)
            gender = gender(indF);
        end;
        Gender = term(gender);
    end;
    if glm_Model~=4
        age = importdata(AgeList);
        if ~isempty(indF)
            age = age(indF);
        end;
        Age = term(age);
    end;   
end;

% Reading Code File
Structures = ReadCodeFile(StructureCodesFile);

% Reading Morphometric Variables status 
h = findobj('Tag', 'CheckboxVolume');
isVolumeVar = get(h,'Value');
h = findobj('Tag', 'CheckboxThickness');
isThickness = get(h,'Value');
h = findobj('Tag', 'CheckboxStructureSurface');
isStructureSurface = get(h,'Value');
h = findobj('Tag', 'CheckboxCorticalSurface');
isCorticalSurface = get(h,'Value');

h = findobj('Tag', 'CheckboxIncludeMeanEffect');
IsMeanEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxIntracranealVolume');
IsVolumeEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxMeanThicknessEffect');
IsMeanThicknessEffectIncluded = get(h,'Value');

if IsMeanThicknessEffectIncluded
    MeanThickness = load(deblank(GlobalMeanThicknessFile));
    if ~isempty(indF)
        MeanThickness = MeanThickness(indF);
    end;
    MeanThickness = term(MeanThickness);
else
    MeanThickness = '';
end;
if ~isempty(OtherVariablesFile)
    OtherVars = load(OtherVariablesFile);
    if ~isempty(indF)
        OtherVars = OtherVars(indF,:);
    end;
    OtherVars = term(OtherVars);
else
    OtherVars = 0;
    OtherVars = term(OtherVars);
end;

% Reading data Files ...
YVol = []; YThick = []; YStructSur = []; YCortSur = [];
if isVolumeVar
    YVol = load(StructuresVolumeFile);
    if isstruct(YVol)        
        if isfield(YVol,'V')
            YVol = YVol.V;
        else
            YVol = YVol.Y;
        end;
    end;
    if ~isempty(indF)
        YVol = YVol(indF,:);
    end;
    [Ns,NStruct] = size(YVol);
    GrayMatVolume = '';
    if IsMeanEffectIncluded
        GrayMatVolume = sum(YVol,2);
        GrayMatVolume = term(GrayMatVolume);
    end;
    if IsVolumeEffectIncluded
        GrayMatVolume = load(deblank(IntracranealVolumeFile));
        if ~isempty(indF)
            GrayMatVolume = GrayMatVolume(indF,:);
        end;
        GrayMatVolume = term(GrayMatVolume);
    end;
    [YVol,GLMModel] = SubstractEffects_GLM(YVol, glm_Model, IsMeanEffectIncluded||IsVolumeEffectIncluded, ...
                                           Age, Gender, GrayMatVolume, OtherVars);
end;
if isThickness
    YThick = load(MeanThicknessFile);
    if isstruct(YThick)
        YThick = YThick.Y;
    end;
    if ~isempty(indF)
        YThick = YThick(indF,:);
    end;
    [Ns,NStruct] = size(YThick);
    [YThick,GLMModel] = SubstractEffects_GLM(YThick, glm_Model, IsMeanThicknessEffectIncluded, Age, Gender, MeanThickness, OtherVars);
end;
if isStructureSurface
    %IsMeanStructureSurfIncluded = 0;  
    YStructSur = load(StructureSurfaceAreaFile);
    if isstruct(YStructSur)
        YStructSur = YStructSur.Y;
    end;    
    if ~isempty(indF)
        YStructSur = YStructSur(indF,:);
    end;
    [Ns,NStruct] = size(YStructSur);
    GrayMatVolume = '';
    if IsMeanEffectIncluded
        GrayMatVolume = sum(YStructSur,2);
        GrayMatVolume = term(GrayMatVolume);
    end;
    [YStructSur,GLMModel] = SubstractEffects_GLM(YStructSur, glm_Model,IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
end;
if isCorticalSurface
    IsMeanCorticalSurfIncluded = 0;
    GrayMatVolume = '';
    YCortSur = load(CorticalSurfaceAreaFile);
    if isstruct(YCortSur)
        YCortSur = YCortSur.Y;
    end;        
    if ~isempty(indF)
        YCortSur = YCortSur(indF,:);
    end;
    [Ns,NStruct] = size(YCortSur);
    [YCortSur,GLMModel] = SubstractEffects_GLM(YCortSur, glm_Model, IsMeanCorticalSurfIncluded, Age, Gender, GrayMatVolume, OtherVars);
end;

Nv = double(isVolumeVar) + double(isThickness) + double(isStructureSurface) + double(isCorticalSurface); % Number of active Morphometric Variables ...
%Ytemp = YVol + YThick + YStructSur + YCortSur;

Y = [YVol,YThick,YStructSur,YCortSur];
Ymean = mean(Y,1);
Ystd = std(Y,0,1);
Y = (Y-repmat(Ymean,[Ns,1]))./(repmat(Ystd,[Ns,1])); % Standarizig Data Matrix.

Y = reshape(Y,[Ns,NStruct,Nv]); 
h = findobj('Tag', 'PopupmenuCorrelationMethod');
method = get(h,'Value'); % % Method = 1 --> Mardia definition of Correlation. 
                         %   Method = 2 --> Canonical Correlation. The first canonical
                         %                  correlation.
ConnectMatrix = vectorcorrM(Y,method);
ConnectMatrix = 0.5*(ConnectMatrix + ConnectMatrix');


thres = 0.05;
ConnectMatrix.ConMat = ConnectMatrix;
ConnectMatrix.Structures = Structures;
ConnectMatrix.GLMModel = GLMModel;
ConnectMatrix.thres = thres;

save(MorphoConnectMatrixFile,'ConnectMatrix');

close;


