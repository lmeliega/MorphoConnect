function varargout = Morpho_Data_Effects_Subtraction_GUI(varargin)
%MORPHO_DATA_EFFECTS_SUBTRACTION_GUI M-file for Morpho_Data_Effects_Subtraction_GUI.fig
%      MORPHO_DATA_EFFECTS_SUBTRACTION_GUI, by itself, creates a new MORPHO_DATA_EFFECTS_SUBTRACTION_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_DATA_EFFECTS_SUBTRACTION_GUI returns the handle to a new MORPHO_DATA_EFFECTS_SUBTRACTION_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_DATA_EFFECTS_SUBTRACTION_GUI('Property','Value',...) creates a new MORPHO_DATA_EFFECTS_SUBTRACTION_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Data_Effects_Subtraction_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_DATA_EFFECTS_SUBTRACTION_GUI('CALLBACK') and MORPHO_DATA_EFFECTS_SUBTRACTION_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_DATA_EFFECTS_SUBTRACTION_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Data_Effects_Subtraction_GUI

% Last Modified by GUIDE v2.5 08-Sep-2010 19:19:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Data_Effects_Subtraction_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Data_Effects_Subtraction_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Data_Effects_Subtraction_GUI is made visible.
function Morpho_Data_Effects_Subtraction_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Data_Effects_Subtraction_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Data_Effects_Subtraction_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

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


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Data_Effects_Subtraction_GUI_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off
close;
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

% --- Executes on button press in ChangePushButton3.
function ChangePushButton3_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDataFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
OutputDataFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'edit5');
    set(h,'String',OutputDataFile);
end;

% --- Executes on button press in BrowseButtonStructVolsFile.
function BrowseButtonStructVolsFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructVolsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global InputDataFiles

dir = cd;
InputDataFiles = spm_select([1 Inf],'any','Loading Structure Volume Files','',dir);

Cad_in = '';
[n,m] = size(InputDataFiles);
for i =1:n
    Temp = InputDataFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_StructuresVolumesFile');
set(h,'String', Cad_in);

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

% --- Executes on button press in BrowseButtonAgesFile.
function BrowseButtonAgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeList

dir = cd;
AgeList = spm_select([1 Inf],'txt','Loading Age Files','',dir);

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
set(h,'Enable','off');
h = findobj('Tag','Edit_GenderFile');
set(h,'Enable','off');

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

% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeList GenderList StructureCodesFile InputDataFiles OtherVariablesFile ...
       SubjectsList IntracranealVolumeFile SubjectsFullList OutputDataFile

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

Nm = size(InputDataFiles,1); % Number of Data matrices.

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

h = findobj('Tag', 'CheckboxIncludeMeanEffect');
IsMeanEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxIntracranealVolume');
IsVolumeEffectIncluded = get(h,'Value');

if ~isempty(StructureCodesFile)
    Structures = ReadCodeFile(StructureCodesFile);
else
    Structures = 'Not Defined';
end;

[FilePath,FileName,FileExt] = fileparts(InputDataFiles(1,:));
Y1 = load(deblank(InputDataFiles(1,:)));
if strcmpi(FileExt,'.mat')
    if isfield(Y1,'V')
        Y1 = Y1.V;
    else
        Y1 = Y1.Y;
    end;
end;
Y2 = [];
if Nm==2
    Y2 = load(deblank(InputDataFiles(2,:)));
    if strcmpi(FileExt,'.mat')
        if isfield(Y2,'V')
            Y2 = Y2.V;
        else
            Y2 = Y2.Y;
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
    Y = [Y1;Y2]; % Joining data from two possible dataset ...
    [Y,GLMModel] = SubstractEffects_GLM(Y, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
    Y1 = Y(1:Ns1,:);
    Y2 = Y(Ns1+1:end,:);
    % Saving process ...
    OutFilePath = fileparts(OutputDataFile);
    % 1st data
    [InFilePath,InFileName] = fileparts(InputDataFiles(1,:));    
    Y = Y1;   
    OutputFileName = [OutFilePath,filesep,InFileName,'_effects_sub.mat'];
    save(OutputFileName,'Y','GLMModel','Structures');
     % 2nd data
    [InFilePath,InFileName] = fileparts(InputDataFiles(2,:));    
    Y = Y2;
    OutputFileName = [OutFilePath,filesep,InFileName,'_effects_sub.mat'];
    save(OutputFileName,'Y','GLMModel','Structures');    
else % Case of one dataset.
    [Y,GLMModel] = SubstractEffects_GLM(Y1, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
    save(OutputDataFile,'Y','GLMModel','Structures');   
end;

close;


