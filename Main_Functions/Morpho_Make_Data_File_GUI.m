function varargout = Morpho_Make_Data_File_GUI(varargin)
% MORPHO_MAKE_DATA_FILE_GUI M-file for Morpho_Make_Data_File_GUI.fig
%      MORPHO_MAKE_DATA_FILE_GUI, by itself, creates a new MORPHO_MAKE_DATA_FILE_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_MAKE_DATA_FILE_GUI returns the handle to a new MORPHO_MAKE_DATA_FILE_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_MAKE_DATA_FILE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_MAKE_DATA_FILE_GUI.M with the given input arguments.
%
%      MORPHO_MAKE_DATA_FILE_GUI('Property','Value',...) creates a new MORPHO_MAKE_DATA_FILE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Make_Data_File_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Make_Data_File_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Make_Data_File_GUI

% Last Modified by GUIDE v2.5 20-Nov-2010 17:21:41

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Make_Data_File_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Make_Data_File_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before Morpho_Make_Data_File_GUI is made visible.
function Morpho_Make_Data_File_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Make_Data_File_GUI (see VARARGIN)

% Choose default command line output for Morpho_Make_Data_File_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Make_Data_File_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Make_Data_File_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in ModalityPopupmenu.
function ModalityPopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to ModalityPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns ModalityPopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ModalityPopupmenu


% --- Executes during object creation, after setting all properties.
function ModalityPopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ModalityPopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DataTypePopupmenu.
function DataTypePopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to DataTypePopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns DataTypePopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DataTypePopupmenu


% --- Executes during object creation, after setting all properties.
function DataTypePopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataTypePopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in CancelPushbutton.
function CancelPushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to CancelPushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


function EditListSubjectsID_Callback(hObject, eventdata, handles)
% hObject    handle to EditListSubjectsID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditListSubjectsID as text
%        str2double(get(hObject,'String')) returns contents of EditListSubjectsID as a double


% --- Executes during object creation, after setting all properties.
function EditListSubjectsID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditListSubjectsID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BrowseButtonListSubjectsID.
function BrowseButtonListSubjectsID_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonListSubjectsID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsListFile

dir = cd;
SubjectsListFile = spm_select(1,'txt','Loading Subject IDs File','',dir);

h = findobj('Tag', 'EditListSubjectsID');
set(h,'String',SubjectsListFile);


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

function EditAgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditAgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditAgesFile as text
%        str2double(get(hObject,'String')) returns contents of EditAgesFile as a double


% --- Executes during object creation, after setting all properties.
function EditAgesFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditAgesFile (see GCBO)
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
global AgeListFile

dir = cd;
AgeListFile = spm_select(1,'txt','Loading Ages File','',dir);

h = findobj('Tag', 'EditAgesFile');
set(h,'String',AgeListFile);


function EditGenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditGenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditGenderFile as text
%        str2double(get(hObject,'String')) returns contents of EditGenderFile as a double


% --- Executes during object creation, after setting all properties.
function EditGenderFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditGenderFile (see GCBO)
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

global GenderListFile

dir = cd;
GenderListFile = spm_select(1,'txt','Loading Gender File','',dir);

h = findobj('Tag', 'EditGenderFile');
set(h,'String',GenderListFile);

function EditInputDataFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditInputDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInputDataFile as text
%        str2double(get(hObject,'String')) returns contents of EditInputDataFile as a double


% --- Executes during object creation, after setting all properties.
function EditInputDataFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInputDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BrowseButtonInputDataFile.
function BrowseButtonInputDataFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonInputDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global InputDataFile

dir = cd;
InputDataFile = spm_select(1,'any','Loading Data File','',dir);

h = findobj('Tag','EditInputDataFile');
set(h,'String', InputDataFile);


function EditOutputFilePushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutputFilePushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutputFilePushbutton as text
%        str2double(get(hObject,'String')) returns contents of EditOutputFilePushbutton as a double


% --- Executes during object creation, after setting all properties.
function EditOutputFilePushbutton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutputFilePushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ChangeOutputFileButton.
function ChangeOutputFileButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangeOutputFileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global MorphoOutputFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
MorphoOutputFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'EditOutputFilePushbutton');
    set(h,'String',MorphoOutputFile);
end;

% --- Executes on button press in DonePushButton.
function DonePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to DonePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AgeListFile InputDataFile GenderListFile SubjectsListFile StructureCodesFile MorphoOutputFile


h = findobj('Tag', 'ModalityPopupmenu');
DataModality = get(h,'Value');

h = findobj('Tag', 'DataTypePopupmenu'); 
DataType = get(h,'Value');

Morpho_Make_Data_File(InputDataFile, DataModality, DataType, AgeListFile,GenderListFile, ...
                                     SubjectsListFile,StructureCodesFile,MorphoOutputFile);
close;


