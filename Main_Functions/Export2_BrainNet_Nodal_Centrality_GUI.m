function varargout = Export2_BrainNet_Nodal_Centrality_GUI(varargin)
% EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI M-file for Export2_BrainNet_Nodal_Centrality_GUI.fig
%      EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI, by itself, creates a new EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI or raises the existing
%      singleton*.
%
%      H = EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI returns the handle to a new EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI or the handle to
%      the existing singleton*.
%
%      EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI.M with the given input arguments.
%
%      EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI('Property','Value',...) creates a new EXPORT2_BRAINNET_NODAL_CENTRALITY_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Export2_BrainNet_Nodal_Centrality_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Export2_BrainNet_Nodal_Centrality_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Export2_BrainNet_Nodal_Centrality_GUI

% Last Modified by GUIDE v2.5 21-Feb-2014 11:10:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Export2_BrainNet_Nodal_Centrality_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Export2_BrainNet_Nodal_Centrality_GUI_OutputFcn, ...
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


% --- Executes just before Export2_BrainNet_Nodal_Centrality_GUI is made visible.
function Export2_BrainNet_Nodal_Centrality_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Export2_BrainNet_Nodal_Centrality_GUI (see VARARGIN)

% Choose default command line output for Export2_BrainNet_Nodal_Centrality_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Export2_BrainNet_Nodal_Centrality_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Export2_BrainNet_Nodal_Centrality_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in PushbuttonCancel.
function PushbuttonCancel_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

function EditOutPutFolder_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutPutFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutPutFolder as text
%        str2double(get(hObject,'String')) returns contents of EditOutPutFolder as a double


% --- Executes during object creation, after setting all properties.
function EditOutPutFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutPutFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Edit_HubsThres_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_HubsThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_HubsThres as text
%        str2double(get(hObject,'String')) returns contents of Edit_HubsThres as a double


% --- Executes during object creation, after setting all properties.
function Edit_HubsThres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_HubsThres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditCentroids_Callback(hObject, eventdata, handles)
% hObject    handle to EditCentroids (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditCentroids as text
%        str2double(get(hObject,'String')) returns contents of EditCentroids as a double


% --- Executes during object creation, after setting all properties.
function EditCentroids_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditCentroids (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function PushbuttonStructCodeFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonStructCodeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PushbuttonStructCodeFile as text
%        str2double(get(hObject,'String')) returns contents of PushbuttonStructCodeFile as a double


% --- Executes during object creation, after setting all properties.
function PushbuttonStructCodeFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PushbuttonStructCodeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function EditNetPropsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to EditNetPropsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditNetPropsFiles as text
%        str2double(get(hObject,'String')) returns contents of EditNetPropsFiles as a double


% --- Executes during object creation, after setting all properties.
function EditNetPropsFiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditNetPropsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonNetPropsFiles.
function PushbuttonNetPropsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonNetPropsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles

Cad_in = '';
dir = cd;
NetworkPropertiesFiles = spm_select([1,Inf],'mat','Loading Network properties files ...','',dir);

N = size(NetworkPropertiesFiles,1);
for i =1:N
    Temp = NetworkPropertiesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) '; '];
end;

if ~isempty(NetworkPropertiesFiles)
    h = findobj('Tag', 'EditNetPropsFiles');
    set(h,'String',Cad_in);
end;

% --- Executes on button press in PushbuttonCentroids.
function PushbuttonCentroids_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCentroids (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CentroidsFile

dir = cd;
CentroidsFile = spm_select(1,'txt','Loading Centroid File ...','',dir);

h = findobj('Tag', 'EditCentroids');
if ~isempty(CentroidsFile)
    set(h,'String',CentroidsFile);
end;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructuresCodeFile

dir = cd;
StructuresCodeFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);

h = findobj('Tag', 'EditStructCodeFile');
if ~isempty(StructuresCodeFile)
    set(h,'String',StructuresCodeFile);
end;

% --- Executes on button press in PushbuttonOutPutFolder.
function PushbuttonOutPutFolder_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutPutFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder

OutputFolder = uigetdir(cd, 'Select Folder to save BrainNet Files ...');

h = findobj('Tag', 'EditOutPutFolder');
set(h,'String',OutputFolder);


% --- Executes on button press in PushbuttonDone.
function PushbuttonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder  StructuresCodeFile  CentroidsFile NetworkPropertiesFiles

h = findobj('Tag', 'Edit_HubsThres');
thres = str2double(get(h,'String'));

Export2_BrainNet_Nodal_Centrality_more(thres,NetworkPropertiesFiles,StructuresCodeFile,CentroidsFile,OutputFolder);

close;








