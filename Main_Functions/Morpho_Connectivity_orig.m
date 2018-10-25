function varargout = Morpho_Connectivity(varargin)
%MORPHO_CONNECTIVITY M-file for Morpho_Connectivity.fig
%      MORPHO_CONNECTIVITY, by itself, creates a new MORPHO_CONNECTIVITY or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTIVITY returns the handle to a new MORPHO_CONNECTIVITY or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTIVITY('Property','Value',...) creates a new MORPHO_CONNECTIVITY using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Connectivity_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTIVITY('CALLBACK') and MORPHO_CONNECTIVITY('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTIVITY.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Connectivity

% Last Modified by GUIDE v2.5 17-Jan-2017 14:50:07

global AgeList GenderList StructureCodesFile StructuresVolumeFile AtlasesFiles MorphoConnectMatrixFile OtherVariablesFile ...
       SubjectsList IndexStructureFile IntracranealVolumeFile SubjectsFullList

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Connectivity_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Connectivity_OutputFcn, ...
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


% --- Executes just before Morpho_Connectivity is made visible.
function Morpho_Connectivity_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Connectivity
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','on');
% h = findobj('Tag','BrowseButtonAtlasFiles');
% set(h,'Enable','off');
% h = findobj('Tag','Edit_Atlas_Files');
% set(h,'Enable','off');

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
h = findobj('Tag','Checkbox_Sampling_With_Replacement');
set(h,'Enable','off');

% UIWAIT makes Morpho_Connectivity wait for user response (see UIRESUME)
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
% h = findobj('Tag','BrowseButtonAtlasFiles');
% set(h,'Enable','off');
% h = findobj('Tag','Edit_Atlas_Files');
% set(h,'Enable','off');

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
h = findobj('Tag','Checkbox_Sampling_With_Replacement');
set(h,'Enable','off');      
% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Connectivity_OutputFcn(hObject, eventdata, handles)
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



function EditNSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to EditNSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditNSubjects as text
%        str2double(get(hObject,'String')) returns contents of EditNSubjects as a double


% --- Executes during object creation, after setting all properties.
function EditNSubjects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditNSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditNBootstrap_Callback(hObject, eventdata, handles)
% hObject    handle to EditNBootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditNBootstrap as text
%        str2double(get(hObject,'String')) returns contents of EditNBootstrap as a double


% --- Executes during object creation, after setting all properties.
function EditNBootstrap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditNBootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CheckboxJointData.
function CheckboxJointData_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxJointData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxJointData


% --- Executes on selection change in Popupmenu_Connectivity_Method.
function Popupmenu_Connectivity_Method_Callback(hObject, eventdata, handles)
% hObject    handle to Popupmenu_Connectivity_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns Popupmenu_Connectivity_Method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popupmenu_Connectivity_Method


% --- Executes during object creation, after setting all properties.
function Popupmenu_Connectivity_Method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popupmenu_Connectivity_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_StructuresVolumesFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_StructuresVolumesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_StructuresVolumesFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_StructuresVolumesFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_StructuresVolumesFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_StructuresVolumesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditFullListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to EditFullListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditFullListSubjects as text
%        str2double(get(hObject,'String')) returns contents of EditFullListSubjects as a double


% --- Executes during object creation, after setting all properties.
function EditFullListSubjects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFullListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditIntracranealVolume_Callback(hObject, eventdata, handles)
% hObject    handle to EditIntracranealVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditIntracranealVolume as text
%        str2double(get(hObject,'String')) returns contents of EditIntracranealVolume as a double


% --- Executes during object creation, after setting all properties.
function EditIntracranealVolume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditIntracranealVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to EditListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditListSubjects as text
%        str2double(get(hObject,'String')) returns contents of EditListSubjects as a double


% --- Executes during object creation, after setting all properties.
function EditListSubjects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function Edit_AgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_AgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_AgesFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_AgesFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_AgesFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_AgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditOtherVariables_Callback(hObject, eventdata, handles)
% hObject    handle to EditOtherVariables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOtherVariables as text
%        str2double(get(hObject,'String')) returns contents of EditOtherVariables as a double


% --- Executes during object creation, after setting all properties.
function EditOtherVariables_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOtherVariables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function EditBootstrapFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditBootstrapFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditBootstrapFile as text
%        str2double(get(hObject,'String')) returns contents of EditBootstrapFile as a double


% --- Executes during object creation, after setting all properties.
function EditBootstrapFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditBootstrapFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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
StructuresVolumeFile = spm_select([1 Inf],'any','Loading Data Files','',dir);

Cad_in = '';
[n,m] = size(StructuresVolumeFile);
for i =1:n
    Temp = StructuresVolumeFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_StructuresVolumesFile');
set(h,'String', Cad_in);

if ~isempty(StructuresVolumeFile)
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
        h = findobj('Tag','EditNSubjects');
        set(h,'Enable','on');
        set(h,'String','');
        h = findobj('Tag','TextNSubjects');
        set(h,'Enable','on');
    else
        h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
        set(h,'Value',0);
        h = findobj('Tag', 'EditNBootstrap');
        set(h,'String','');
        set(h,'Enable','off');
        h = findobj('Tag', 'TextNumberofBoostraps');
        set(h,'Enable','off');
        h = findobj('Tag', 'EditNSubjects');
        set(h,'Enable','off');
        set(h,'String','');
        h = findobj('Tag','TextNSubjects');
        set(h,'Enable','off');
    end;
    X = load(deblank(StructuresVolumeFile(1,:)));
    if isstruct(X)
        Vars = fieldnames(X);
        eval(['Data=X.' Vars{1} ';']); clear X;
        if isfield(Data,'SubjectsGender')
            h = findobj('Tag','Edit_GenderFile');
            set(h,'String',['{Loaded from Data file : ',num2str(length(Data.SubjectsGender)), ' subjects}'],'FontAngle','italic','ForegroundColor',[0,0.4,0]);
        end;
        if isfield(Data,'SubjectsAge')
            h = findobj('Tag','Edit_AgesFile');
            set(h,'String',['{Loaded from Data file : ',num2str(length(Data.SubjectsAge)), ' subjects}'],'FontAngle','italic','ForegroundColor',[0,0.4,0]);
        end;
        if isfield(Data,'SubjectsIDs')
            h = findobj('Tag','EditFullListSubjects');
            set(h,'String',['{Loaded from Data file : ',num2str(length(Data.SubjectsIDs)), ' subjects}'],'FontAngle','italic','ForegroundColor',[0,0.4,0]);
        end;
        if isfield(Data,'Structures')
            h = findobj('Tag','EditStructureCodes');
            set(h,'String',['{Loaded from Data file : ',num2str(length(Data.Structures)), ' structures}'],'FontAngle','italic','ForegroundColor',[0,0.4,0]);
        end;
    end;
end;

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
OtherVariablesFile = spm_select([1 Inf],'any','Loading Other Variables File','',dir);

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

% --- Executes on button press in CheckboxSubstractPCA.
function CheckboxSubstractPCA_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxSubstractPCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxSubstractPCA


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
    %if Nm==1
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
        h = findobj('Tag','Checkbox_Sampling_With_Replacement');
        set(h,'Enable','on');        
%     else
%         h = findobj('Tag','EditNSubjects');
%         set(h,'Enable','off');
%         h = findobj('Tag','TextNSubjects');
%         set(h,'Enable','off');
% 
%         h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
%         set(h,'Enable','off');
%         set(h,'Value',0);
%         h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
%         set(h,'Enable','off');
%         set(h,'Value',0);
%         h = findobj('Tag','EditBootstrapFile');
%         set(h,'Enable','off');
%         h = findobj('Tag','Checkbox_Sampling_With_Replacement');
%         set(h,'Enable','off');
%     end;
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
    h = findobj('Tag','Checkbox_Sampling_With_Replacement');
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

% --- Executes on button press in Checkbox_Sampling_With_Replacement.
function Checkbox_Sampling_With_Replacement_Callback(hObject, eventdata, handles)
% hObject    handle to Checkbox_Sampling_With_Replacement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of
% Checkbox_Sampling_With_Replacement
% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeList GenderList StructureCodesFile StructuresVolumeFile MorphoConnectMatrixFile OtherVariablesFile ...
       SubjectsList IntracranealVolumeFile SubjectsFullList InputBootstrapFile

warning('off');

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

% Reading Data
[FilePath,FileName,FileExt] = fileparts(StructuresVolumeFile(1,:));
Data1 = load(deblank(StructuresVolumeFile(1,:)));
if strcmpi(deblank(FileExt),'.mat')
    if isfield(Data1,'V')
        Y1 = Data1.V;
    end;
    if isfield(Data1,'Y')
        Y1 = Data1.Y;
    end;
    if isfield(Data1,'Data')
        Y1 = Data1.Data.Y;
        Data1 = Data1.Data;
    end;
else
    Y1 = Data1;
end;
Y2 = [];
if Nm==2
    Data2 = load(deblank(StructuresVolumeFile(2,:)));
    if strcmpi(deblank(FileExt),'.mat')
        if isfield(Data2,'V')
            Y2 = Data2.V;
        end;
        if isfield(Data2,'Y')
            Y2 = Data2.Y;
        end;
        if isfield(Data2,'Data')
            Y2 = Data2.Data.Y;
            Data2 = Data2.Data;
        end;
    else
        Y2 = Data2;
    end;
end;

if ~isfield(Data1,'SubjectsIDs')
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
else
    if ~isempty(SubjectsList)
        indF = findIDsFiles(SubjectsList(1,:),Data1.SubjectsIDs);  % Finding indexes of the reduced list of subjects for the first data.
        if Nm==2
            indF2= findIDsFiles(SubjectsList(2,:),Data2.SubjectsIDs);  % Finding indexes of the reduced list of subjects for the second data.
        end;       
    else
        indF = [];
        if Nm==2
            indF2 = [];
        end;        
    end;
end;

Gender = ''; Gender2 = '';
Age = ''; Age2 = '';

if glm_Model~=5
    if glm_Model~=3
        if ~isfield(Data1,'SubjectsGender')
            gender = textread(GenderList(1,:),'%s');
        else
            gender = Data1.SubjectsGender;
        end;
        if ~isempty(indF)
            gender = gender(indF);
        end;
        Gender = term(gender);
        if Nm==2
            if ~isfield(Data2,'SubjectsGender')
                gender2 = textread(GenderList(2,:),'%s');
            else
                gender2 = Data2.SubjectsGender;
            end;
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
        if ~isfield(Data1,'SubjectsAge')
            age = importdata(AgeList(1,:));
        else
            age = Data1.SubjectsAge;
        end;
        if ~isempty(indF)
            age = age(indF);
        end;
        Age = term(age);
        if Nm==2
            if ~isfield(Data2,'SubjectsAge')
                age2 = importdata(AgeList(2,:));
            else
                age2 = Data2.SubjectsAge;
            end;
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

% Reading Code File
if ~isfield(Data1,'Structures')
    Structures = ReadCodeFile(StructureCodesFile);
else
    if ~isempty(StructureCodesFile)
        Structures = ReadCodeFile(StructureCodesFile);
        Y1 = Morpho_Reduce_Data_Matrix(Y1,Data1.Structures,Structures);
        if Nm==2
            Y2 = Morpho_Reduce_Data_Matrix(Y2,Data2.Structures,Structures);
        end;
    else
        Structures = Data1.Structures;
    end;
end;

h = findobj('Tag', 'CheckboxIncludeMeanEffect');
IsMeanEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxIntracranealVolume');
IsVolumeEffectIncluded = get(h,'Value');
h = findobj('Tag', 'CheckboxSubstractPCA');
IsPCAEffectIncluded = get(h,'Value');

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
    if IsPCAEffectIncluded
        GrayMatVolume1 = findPCA(Y1,GrayMatVolume1);
    end;
    GrayMatVolume = term(GrayMatVolume1);
    if Nm==2
        GrayMatVolume2 = sum(Y2,2);
        if IsPCAEffectIncluded
            GrayMatVolume2 = findPCA(Y2,GrayMatVolume2);
        end;
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
    if IsPCAEffectIncluded
        GrayMatVolume1 = findPCA(Y1,GrayMatVolume1);
    end;
    GrayMatVolume = term(GrayMatVolume1);
    if Nm==2
        GrayMatVolume2 = load(deblank(IntracranealVolumeFile(2,:)));
        if ~isempty(indF2)
            GrayMatVolume2 = GrayMatVolume2(indF2);
        end;
        if IsPCAEffectIncluded
            GrayMatVolume2 = findPCA(Y2,GrayMatVolume2);
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
    [OthersFilePath,OthersFileName,OthersExt] = fileparts(OtherVariablesFile(1,:));
    if ~strcmpi(OthersExt,'.mat')
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
    else
        XX = load(OtherVariablesFile(1,:));
        Vars = fieldnames(XX);
        eval(['OtherVars1=XX.' Vars{1} ';']); clear XX;
        OtherVars2 = '';
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
    Nothers = size(OtherVars,2); 
    NStruct = size(Y1,2);
    if Nothers==NStruct
        % Substracting effects different for each structure (column of Y1).
        Yout = zeros(size(Y1));
        for i=1:NStruct
            OtherVars_i = OtherVars(i,:);
            OtherVars_i = term(OtherVars_i);
            [Ytemp,GLMModel] = SubstractEffects_GLM(Y1(:,i), glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars_i);
            Yout(:,i) = Ytemp;
        end;
        Y1 = Yout;
    else
        [Y1,GLMModel] = SubstractEffects_GLM(Y1, glm_Model, IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars);
    end;
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
    case 4
        Connectivity_Method_Label = 'Pearson Distance';
    case 5
        Connectivity_Method_Label = 'Euclidean Distance';
    case 6
        Connectivity_Method_Label = 'Singular Partial Correlation';
end;

if IsMakeBoostraping
    h = findobj('Tag','EditNBootstrap');
    Nboot = str2double(get(h,'String'));       
    [ConnectMatrix1,ConMat1p] = ConnectMatrixCalc(Y1, Connectivity_Method);
    if Nm==2
        [ConnectMatrix2,ConMat2p] = ConnectMatrixCalc(Y2, Connectivity_Method);
        %[ConnectMatrix1_boot,ConnectMatrix2_boot] = Morpho_bootstrap01(Y1,Y2,Nboot,1,0,Connectivity_Method); this is for permutation
        h = findobj('Tag', 'EditNSubjects');
        Nsubj = str2num(get(h,'String'));
        if length(Nsubj)==1
            Nsubj = [Nsubj,Nsubj];
        end;
        h = findobj('Tag','Checkbox_Sampling_With_Replacement');
        isReplacement = logical(get(h,'Value'));
        if LoadBootstrapSamples
            ind1 = load(deblank(InputBootstrapFile(1,:)));
            ind1 = ind1.indbootstrap;
            [ConnectMatrix1_boot,~,ind1,~,ConnectMatrix1_jack]= Morpho_bootstrap01(Y1,'',0,0,ind1,Connectivity_Method); % Case of one dataset.
            ind2 = load(deblank(InputBootstrapFile(2,:)));
            ind2 = ind2.indbootstrap;
            [ConnectMatrix2_boot,~,ind2,~,ConnectMatrix2_jack]= Morpho_bootstrap01(Y2,'',0,0,ind2,Connectivity_Method);  % Case of one dataset.
        else
            [ConnectMatrix1_boot,~,indbootstrap1,~,ConnectMatrix1_jack] = Morpho_bootstrap01(Y1,'',Nboot,Nsubj(1),'',Connectivity_Method,isReplacement); %#ok % Case of one dataset.
            [ConnectMatrix2_boot,~,indbootstrap2,~,ConnectMatrix2_jack] = Morpho_bootstrap01(Y2,'',Nboot,Nsubj(2),'',Connectivity_Method,isReplacement); %#ok % Case of one dataset.
        end;
    else
        h = findobj('Tag', 'EditNSubjects'); 
        Nsubj = str2double(get(h,'String'));
        h = findobj('Tag','Checkbox_Sampling_With_Replacement');
        isReplacement = logical(get(h,'Value'));
        if LoadBootstrapSamples
            ind = load(InputBootstrapFile);
            ind = ind.indbootstrap;
            [ConnectMatrix1_boot,~,ind,ConMat1p]= Morpho_bootstrap01(Y1,'',0,0,ind,Connectivity_Method); % Case of one dataset.
        else
            [ConnectMatrix1_boot,~,indbootstrap,ConMat1p] = Morpho_bootstrap01(Y1,'',Nboot,Nsubj,'',Connectivity_Method,isReplacement); % Case of one dataset.
        end;        
    end;
else
    [ConnectMatrix1,ConMat1p] = ConnectMatrixCalc(Y1, Connectivity_Method);
    if Nm==2
        [ConnectMatrix2,ConMat2p] = ConnectMatrixCalc(Y2, Connectivity_Method);
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
    ConnectMatrix.NSubjects = size(Y1,1);
    ConnectMatrix.pValues = ConMat1p;
    [pth,name,ext] = fileparts(MorphoConnectMatrixFile); %#ok
    [~,name_in1] = fileparts(StructuresVolumeFile(1,:));
    name_in1 = [name_in1,'_1st'];
    MorphoConnectMatrixFile1 = [pth,filesep,'Connect_Matrix_',name_in1,'.mat'];
    Y_corrected = Y1; %#ok
    save(MorphoConnectMatrixFile1,'ConnectMatrix','Y_corrected');
    
    % Saving 2nd group
    ConnectMatrix.ConMat = ConnectMatrix2;
    ConnectMatrix.NSubjects = size(Y2,1);
    ConnectMatrix.pValues = ConMat2p;
    [~,name_in2] = fileparts(StructuresVolumeFile(2,:));
    name_in2 = [name_in2,'_2nd'];
    MorphoConnectMatrixFile2 = [pth,filesep,'Connect_Matrix_',name_in2,'.mat'];
    Y_corrected = Y2; %#ok
    save(MorphoConnectMatrixFile2,'ConnectMatrix','Y_corrected');
    
    if IsMakeBoostraping
        % Saving Boostrap 1st group
        if LoadBootstrapSamples
            [Nsubj1,Nboot1] = size(ind1);
            [Nsubj2,Nboot2] = size(ind2);
        else
            Nsubj1 = Nsub(1);Nsubj2 = Nsub(2);
            Nboot1 = Nboot;Nboot2 = Nboot;
        end;
        ConnectMatrix.ConMatboot = ConnectMatrix1_boot;
        ConnectMatrix.ConMatjack = ConnectMatrix1_jack;
        ConnectMatrix.Nboot = Nboot1;
        ConnectMatrix.BootNsubj = Nsubj1;
        MorphoConnectMatrixFile1 = [pth,filesep,'Connect_Matrix_',name_in1,'_bootstrap.mat'];
        save(MorphoConnectMatrixFile1,'ConnectMatrix');

        % Saving Boostrap 2nd group
        ConnectMatrix.ConMatboot = ConnectMatrix2_boot;
        ConnectMatrix.ConMatjack = ConnectMatrix2_jack;
        ConnectMatrix.Nboot = Nboot2;
        ConnectMatrix.BootNsubj = Nsubj2;
        MorphoConnectMatrixFile2 = [pth,filesep,'Connect_Matrix_',name_in2,'_bootstrap.mat'];
        save(MorphoConnectMatrixFile2,'ConnectMatrix');
    end;
else  % Case of one dataset.
    ConnectMatrix.ConMat = ConnectMatrix1;
    ConnectMatrix.Structures = Structures;
    ConnectMatrix.GLMModel = GLMModel;
    ConnectMatrix.thres = thres;
    ConnectMatrix.Connectivity_Method = Connectivity_Method_Label;
    ConnectMatrix.NSubjects = size(Y1,1);
    ConnectMatrix.pValues = ConMat1p;
    if IsMakeBoostraping
        if LoadBootstrapSamples
            [Nsubj,Nboot] = size(ind);
        end;
        ConnectMatrix.ConMatboot = ConnectMatrix1_boot;
        ConnectMatrix.ConMatjack = ConnectMatrix1_jack;
        ConnectMatrix.Nboot = Nboot;
        ConnectMatrix.BootNsubj = Nsubj;
    end;
    Y_corrected = Y1; %#ok
    save(MorphoConnectMatrixFile,'ConnectMatrix','Y_corrected');
    h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
    SaveBootstrapSamples = get(h,'Value');
    if SaveBootstrapSamples
        [pth,name,ext] = fileparts(MorphoConnectMatrixFile);
        IndbootstrapFile = [pth,filesep,'Bootstraping_samples_',name,ext];
        save(IndbootstrapFile,'indbootstrap');
    end;
end;

close;
