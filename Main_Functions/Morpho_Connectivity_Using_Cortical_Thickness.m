function varargout = Morpho_Connectivity_Using_Cortical_Thickness(varargin)
%MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS M-file for Morpho_Connectivity_Using_Cortical_Thickness.fig
%      MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS, by itself, creates a new MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS returns the handle to a new MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS('Property','Value',...) creates a new MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Connectivity_Using_Cortical_Thickness_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS('CALLBACK') and MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTIVITY_USING_CORTICAL_THICKNESS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Connectivity_Using_Cortical_Thickness

% Last Modified by GUIDE v2.5 16-May-2009 13:14:06

global CorticalThicknessFiles AgeList GenderList StructuresInputMeanFile StructureCodesFile CorticalLabelFiles ...
       MorphoConnectMatrixFile SubjectsList OtherVariablesFile SubjectsFullList

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Connectivity_Using_Cortical_Thickness_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Connectivity_Using_Cortical_Thickness_OutputFcn, ...
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


% --- Executes just before Morpho_Connectivity_Using_Cortical_Thickness is made visible.
function Morpho_Connectivity_Using_Cortical_Thickness_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Connectivity_Using_Cortical_Thickness
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
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

% UIWAIT makes Morpho_Connectivity_Using_Cortical_Thickness wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Connectivity_Using_Cortical_Thickness_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);



function Edit_GenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_GenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_GenderFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_GenderFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_GenderFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_GenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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

% --- Executes on button press in BrowseButtonThicknessFiles.
function BrowseButtonThicknessFiles_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonThicknessFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalThicknessFiles

dir = cd;
CorticalThicknessFiles = spm_select([1 Inf],'txt','Selecting Cortical Thickness Files','',dir);

Cad_in = '';
[n,m] = size(CorticalThicknessFiles);
for i =1:n
    Temp = CorticalThicknessFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'String',Cad_in);

% --- Executes on button press in BrowseButtonThicknessFiles_Right.
function BrowseButtonThicknessFiles_Right_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonThicknessFiles_Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ListCorticalThicknessFilesRight

dir = cd;
ListCorticalThicknessFilesRight = spm_select(1,'mat','Loading List of Thickness Files (Right)','',dir,'right.*');
h = findobj('Tag', 'Edit_Cortical_Thickness_Right');
set(h,'String',ListCorticalThicknessFilesRight);


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
h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','on');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','on');

% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OtherVariablesFile AgeList GenderList

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
h = findobj('Tag','PushbuttonOtherVariables');
set(h,'Enable','off');
h = findobj('Tag','EditOtherVariables');
set(h,'Enable','off');
OtherVariablesFile = '';
h = findobj('Tag', 'EditOtherVariables');
set(h,'String',OtherVariablesFile);


h = findobj('Tag','BrowseButtonAgesFile');
set(h,'Enable','off');
AgeList = '';
h = findobj('Tag','Edit_AgesFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonGenderFile');
set(h,'Enable','off');
GenderList = '';
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','off');

% --- Executes on button press in RadioButtonLoadFile.
function RadioButtonLoadFile_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonLoadFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonLoadFile

CorticalThicknessFiles='';
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'String',CorticalThicknessFiles);

CorticalLabelFiles='';
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',CorticalLabelFiles);

CorticalLabelFiles='';
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',CorticalLabelFiles);

SubjectsList = '';
h = findobj('Tag', 'EditListSubjects');
set(h,'String',SubjectsList);

h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');

h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');

h = findobj('Tag','PushButtonFullListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditFullListSubjects');
set(h,'Enable','on');

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');

% --- Executes on button press in RadioButtonComputeHere.
function RadioButtonComputeHere_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonComputeHere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonComputeHere
global StructuresInputMeanFile CorticalThicknessFiles 

StructuresInputMeanFile = '';
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');

% --- Executes on button press in BrowseButtonStructMeanThicnessFile.
function BrowseButtonStructMeanThicnessFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructMeanThicnessFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StructuresInputMeanFile

dir = cd;
StructuresInputMeanFile = spm_select(1,'any','Loading File with all Thickness ','',dir);
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);

[FilePath,FileName,FileExt] = fileparts(StructuresInputMeanFile);
if strcmpi(FileExt,'.mat')
    h = findobj('Tag', 'BrowseButtonCorticalLabels');
    set(h,'Enable','on');
    h = findobj('Tag', 'Edit_Cortical_Labels');
    set(h,'Enable','on');
else
    h = findobj('Tag', 'BrowseButtonCorticalLabels');
    set(h,'Enable','off');
    h = findobj('Tag', 'Edit_Cortical_Labels');
    set(h,'Enable','off');    
end;

% --- Executes on button press in BrowseButtonCorticalLabels.
function BrowseButtonCorticalLabels_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonCorticalLabels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalLabelFiles

dir = cd;
CorticalLabelFiles = spm_select([1 Inf],'txt','Selecting Cortical Label Files','',dir);
Cad_in = '';
[n,m] = size(CorticalLabelFiles);
for i =1:n
    Temp = CorticalLabelFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',Cad_in);


function EditStructureCodes_Callback(hObject, eventdata, handles)
% hObject    handle to EditStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditStructureCodes as text
%        str2double(get(hObject,'String')) returns contents of EditStructureCodes as a double


% --- Executes during object creation, after setting all properties.
function EditStructureCodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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

% --- Executes on button press in radiobuttonCortical_Nodes.
function radiobuttonCortical_Nodes_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCortical_Nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCortical_Nodes

% h = findobj('Tag', 'RadioButtonLoadFile');
% set(h,'Enable','off');

global StructuresInputMeanFile CorticalThicknessFiles 

set(hObject,'Value',1);

h = findobj('Tag', 'RadioButtonComputeHere');
set(h,'Value',1);

StructuresInputMeanFile = '';
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','on');

h = findobj('Tag','CheckboxBootstrapConnectMatrix');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
set(h,'Enable','off');

% --- Executes on button press in radiobuttonMean_Thickness.
function radiobuttonMean_Thickness_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonMean_Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonMean_Thickness

set(hObject,'Value',1);
h = findobj('Tag', 'RadioButtonLoadFile');
set(h,'Enable','on');
%isChecked = get(hObject,'Value');
h = findobj('Tag','CheckboxBootstrapConnectMatrix');
set(h,'Enable','on');

% --- Executes on button press in PushButtonListSubjects.
function PushButtonListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonListSubjects (see GCBO)
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

% --- Executes on button press in CheckboxBootstrapConnectMatrix.
function CheckboxBootstrapConnectMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxBootstrapConnectMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxBootstrapConnectMatrix

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','EditNBootstrap');
    set(h,'Enable','on');
    h = findobj('Tag','TextNumberofBoostraps');
    set(h,'Enable','on');
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


% --- Executes on button press in PushbuttonBootstrapFile.
function PushbuttonBootstrapFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonBootstrapFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global InputBootstrapFile

dir = cd;
InputBootstrapFile = spm_select(1,'mat','Loading Bootstraping File ...','',dir);

h = findobj('Tag', 'EditBootstrapFile');
set(h,'String',InputBootstrapFile);


% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalThicknessFiles AgeList GenderList StructuresInputMeanFile StructureCodesFile CorticalLabelFiles ...
       MorphoConnectMatrixFile SubjectsList OtherVariablesFile SubjectsFullList InputBootstrapFile

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

if M5
   OtherVariablesFile = '';
end;

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

h = findobj('Tag', 'radiobuttonMean_Thickness');
isMeanThickness = get(h,'Value');
h = findobj('Tag', 'RadioButtonComputeHere');
ComputeHere = get(h,'Value');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
isSPAMCorrectionNeeded = get(h,'Value');
h = findobj('Tag', 'CheckboxMeanThicknessEffect');
IsMeanEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
IsMakeBoostraping = get(h,'Value');
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
LoadBootstrapSamples = get(h,'Value');

NStruct = length(Structures);
if  ComputeHere
    if ~isempty(SubjectsList)
        CorticalThicknessFiles = findFiles(SubjectsList,CorticalThicknessFiles);
        CorticalLabelFiles = findFiles(SubjectsList,CorticalLabelFiles);
    end;
    disp('Loading Cortical Thickness Data for all Subjects ...')
    Y = ReadingCIVETData(CorticalThicknessFiles);    
    disp('Cortical Thickness data loaded ...')
    if isMeanThickness
        Y = MeanThicknessComputation(Y,StructureCodesFile,isSPAMCorrectionNeeded,CorticalLabelFiles);
    end;
else
    % If Matlab file then: this file is of NFiles x Np , where Np
    % is the number of points in the Cortical Surface.
    [FilePath,FileName,FileExt] = fileparts(StructuresInputMeanFile);    
    Y = load(StructuresInputMeanFile);    
    if strcmpi(FileExt,'.mat') % This is a full Thickness Matrix
        Y = Y.Y;
        if ~isempty(indF)
            Y = Y(indF,:);
            CorticalLabelFiles = findFiles(SubjectsList,CorticalLabelFiles);
        end;
        if isMeanThickness            
            Y = MeanThicknessComputation(Y,StructureCodesFile,isSPAMCorrectionNeeded,CorticalLabelFiles);
        end;
    else
        if ~isempty(indF)
            Y = Y(indF,:);
        end;
    end;
end;

if IsMeanEffectIncluded
    SubjectThicknessMeans = mean(Y,2);
    ThickMean = term(SubjectThicknessMeans);
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

switch glm_Model
    case 1  % Model : 1 + Age + Gender + Age*Gender
        if IsMeanEffectIncluded
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + ThickMean + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + ThickMean + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + ThickMean);
                GLMModel = '1 + Age + Gender + Age*Gender + ThickMean';
            end;
        else
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender);
                GLMModel = '1 + Age + Gender + Age*Gender';                
            end;
        end;
    case 2  % Model : 1 + Age + Gender
        if IsMeanEffectIncluded
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age + Gender  + ThickMean + OtherVars);
                GLMModel = '1 + Age + Gender  + ThickMean  + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender  + ThickMean);
                GLMModel = '1 + Age + Gender  + ThickMean';                
            end;
        else
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age + Gender  + OtherVars);
                GLMModel = '1 + Age + Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender);
                GLMModel = '1 + Age + Gender';                
            end;
        end;
    case 3  % Model : 1 + Age
        if IsMeanEffectIncluded
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age  + ThickMean + OtherVars);
                GLMModel = '1 + Age + ThickMean + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age  + ThickMean);
                GLMModel = '1 + Age + ThickMean';                
            end;
        else
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Age + OtherVars);
                GLMModel = '1 + Age + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age);
                GLMModel = '1 + Age';                
            end;
        end;
    case 4  % Model : 1 + Gender
        if IsMeanEffectIncluded
             if ~isempty(OtherVariablesFile)
                 slm = SurfStatLinMod(Y, 1 + Gender  + ThickMean + OtherVars);
                 GLMModel = '1 + Gender + ThickMean + OtherVars';
             else
                 slm = SurfStatLinMod(Y, 1 + Gender  + ThickMean);
                 GLMModel = '1 + Gender + ThickMean';                 
             end;
        else
            if ~isempty(OtherVariablesFile)
                slm = SurfStatLinMod(Y, 1 + Gender + OtherVars);
                GLMModel = '1 + Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Gender);
                GLMModel = '1 + Gender';                
            end;
        end;
    case 5
        if IsMeanEffectIncluded
            slm = SurfStatLinMod(Y, 1 + ThickMean);
            GLMModel = '1 + ThickMean';
        else
            GLMModel = 'None';
        end;
end;

% ---------  New Approach --------------%
% SubjectThicknessMeans = mean(Y,2);
% ThickMean = term(SubjectThicknessMeans);
% 
% M1 = 1 + Age + Gender + Age*Gender + ThickMean;
% M2 = 1 + Age + Gender + Age*Gender;
% M3 = 1 + Age + Gender;
% M4 = 1 + Age;
% M5 = 1 + Gender;
% %M6 = 1 + ThickMean;
% 
% slm1 = SurfStatLinMod(Y,M1);
% slm2 = SurfStatLinMod(Y,M2);
% slm3 = SurfStatLinMod(Y,M3);
% slm4 = SurfStatLinMod(Y,M4);
% slm5 = SurfStatLinMod(Y,M5);
% %slm6 = SurfStatLinMod(Y,M6);
% 
% SSE1 = sum(Y-slm1.X*slm1.coef).^2;
% SSE2 = sum(Y-slm2.X*slm2.coef).^2;
% SSE3 = sum(Y-slm3.X*slm3.coef).^2;
% SSE4 = sum(Y-slm4.X*slm4.coef).^2;
% SSE5 = sum(Y-slm5.X*slm5.coef).^2;
% %SSE6 = sum(Y-slm6.X*slm6.coef).^2;
% 
% n = size(Y,1); % Data size.
% 
% AIC1 = 2*size(M1,2) + n *(log(2*pi*SSE1'./n) + 1);
% AIC2 = 2*size(M2,2) + n *(log(2*pi*SSE2'./n) + 1);
% AIC3 = 2*size(M3,2) + n *(log(2*pi*SSE3'./n) + 1);
% AIC4 = 2*size(M4,2) + n *(log(2*pi*SSE4'./n) + 1);
% AIC5 = 2*size(M5,2) + n *(log(2*pi*SSE5'./n) + 1);
% %AIC6 = 2*size(M6,2) + n *(log(2*pi*SSE6'./n) + 1);
% 
% AIC = [AIC1 AIC2 AIC3 AIC4 AIC5]; % AIC6];
% 
% [YI,I] = min(AIC,[],2);
% 
% SLM(1).slm = slm1;
% SLM(2).slm = slm2;
% SLM(3).slm = slm3;
% SLM(4).slm = slm4;
% SLM(5).slm = slm5;
% %SLM(6).slm = slm6;
% 
% Y_hat = zeros(size(Y));
% for i=1:NStruct
%     jM = I(i);
%     Y_hat(:,i) = SLM(jM).slm.X*SLM(jM).slm.coef(:,i);
% end;
% Y = Y - Y_hat;
% ---------  End New Approach --------------%
%pvalue = 0.05/NStruct; % Bonferroni Correction of the p-values.
if glm_Model~=5
%     Nreg = size(slm.X,2);
%     Mask = zeros(Nreg,NStruct);
%     for i=1:Nreg
%         c = zeros(1,Nreg);
%         c(i) = 1;
%         %slm1 = SurfStatT(slm,slm.X*c');
%         slm1 = Morpho_SurfStatT(slm,c);
%         pp = 1 - tcdf(slm1.t',slm1.df); 
%         Mask(i,:) = pp';
%     end;
%     Mask = Mask<pvalue;
%     Y_hat = slm.X*(slm.coef.*Mask);
    Y_hat = slm.X*slm.coef;
    Y = Y - Y_hat;
end;

h = findobj('Tag', 'Popupmenu_Connectivity_Method'); % Type of Correlation Method: 1) Pearson Correlation; 2) Partial Correlation. 
Connectivity_Method = get(h,'Value'); 
switch Connectivity_Method
    case 1
        Connectivity_Method_Label = 'Pearson Correlation';
    case 2
        Connectivity_Method_Label = 'Partial Correlation';        
end;

if isMeanThickness
    if IsMakeBoostraping
        h = findobj('Tag', 'EditNBootstrap');
        Nboot = str2double(get(h,'String'));
        h = findobj('Tag', 'EditNSubjects');
        Nsubj = str2double(get(h,'String'));
        if LoadBootstrapSamples
            ind = load(InputBootstrapFile);
            ind = ind.indbootstrap;
            ConnectMatrix = Morpho_bootstrap01(Y,'',0,0,ind,Connectivity_Method); %#ok % Case of one dataset.
        else
            [ConnectMatrix,XX,indbootstrap] = Morpho_bootstrap01(Y,'',Nboot,Nsubj,'',Connectivity_Method); %#ok % Case of one dataset.
        end;
    else
        switch Connectivity_Method
            case 1  % Pearson Correlation
                ConnectMatrix = corrcoef(Y);
            case 2  % Partial Correlation
                ConnectMatrix = partial_correlation(Y);
        end;
        % Zeroing diagonal elements of Connectivity matrix
        i = 1:NStruct;
        inddiag = (i-1)*NStruct + i;
        ConnectMatrix(inddiag) = 0; %#ok
        ConnectMatrix = 0.5*(ConnectMatrix + ConnectMatrix');
    end;
else % Calculation for all points in the cortical surface.
    %[CorrFilePath,CorrFileName,CorrFileExt] = fileparts(MorphoConnectMatrixFile);
    tic;
    SubjectLabels = ReadingCIVETData(CorticalLabelFiles); 
    ConnectMatrix = zeros(NStruct);
    ConnectMatrixMax = zeros(NStruct);
    NFiles = size(SubjectLabels,1);
    for i=1:NStruct 
        disp(['Structure -->' num2str(i) ' of ' num2str(NStruct)]);
        Structure1_Code = num2str(Structures(i).Code); %#ok
        Structure1_Name = num2str(Structures(i).Name); %#ok        
        ind1 = SubjectLabels==Structures(i).Code;
        Prob1 = (1/NFiles)*sum(ind1,1)';
        ind1 = find(Prob1~=0);
        N1 = length(ind1); 
        for j=i+1:NStruct
            ind2 = SubjectLabels==Structures(j).Code;
            Prob2 = (1/NFiles)*sum(ind2,1)';
            ind2 = find(Prob2~=0);
            CorrMatrix = corrcoef([Y(:,ind1), Y(:,ind2)]); %#ok
            CorrMatrix = 0.5*(CorrMatrix + CorrMatrix');
            %Structure2_Code = num2str(Structures(j).Code);
            %Structure2_Name = num2str(Structures(j).Name); %#ok
            %OuputFileName = [CorrFilePath,filesep,CorrFileName,'_region_',Structure1_Code,'_region_',Structure2_Code,CorrFileExt];
            %save(OuputFileName,'CorrMatrix','Structures','GLMModel','Structure1_Code','Structure1_Name','Structure2_Code','Structure2_Name','ind1','ind2');
            % --------------------------%
            SPAMWeig = Prob1(ind1)*Prob2(ind2)';
            Connect = abs(CorrMatrix(1:N1,N1+1:end)); % Here the correlation values are forced to be positive.
            ind = ismember(ind2,ind1);            
            ind = not(ind);
            S1 = Connect(:,ind).*SPAMWeig(:,ind); % Here it is eliminated the overlap points in the second structure. This happens for neigbour structures.
            %N = numel(S1);
            S1_max = max(S1(:));
            S1 = mean(S1(:)); % Here we are taking the mean value. Other measures can be used (i.e. maximum).
            %---------------------------%
            ind = ismember(ind1,ind2);            
            ind = not(ind);
            S2 = Connect(ind,:).*SPAMWeig(ind,:); % Here the overlap points in the first structure is eliminated. This happens for neigbour structures.
            %N = numel(S2);
            S2_max = max(S2(:));
            S2 = mean(S2(:)); % Here we are taking the mean value. Other measures can be used (i.e. maximum). 
            %---------------------------%
            ConnectMatrix(i,j) = S1;
            ConnectMatrix(j,i) = S2;
            ConnectMatrixMax(i,j) = S1_max;
            ConnectMatrixMax(j,i) = S2_max;
        end;
    end;
    toc;
end;
% Thresholding Connectivity matrix using False Discovery rate.
% fdr_thres = 0.2; 
% Cfdr = locfdr(ConnectMatrix(:)); %,bre,pct,pct0); Here the default parameters are used.
% ind = Cfdr>fdr_thres;
% thres = max(Cfdr(ind));

thres = 0.5;
ConnectMatrix.ConMat = ConnectMatrix;
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

[FilePath,FileName,FileExt] = fileparts(MorphoConnectMatrixFile); 
if ~isMeanThickness    
    ConnectMatrixMax.ConMat = ConnectMatrixMax;
    ConnectMatrixMax.Structures = Structures;
    ConnectMatrixMax.GLMModel = GLMModel;
    ConnectMatrixMax.thres = thres;
    FileName = [FileName '_max'];
    MorphoConnectMatrixMaxFile = [FilePath,FileName,FileExt];
    save(MorphoConnectMatrixMaxFile,'ConnectMatrixMax');
end;

close;
