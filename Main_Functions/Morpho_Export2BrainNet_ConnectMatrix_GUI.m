function varargout = Morpho_Export2BrainNet_ConnectMatrix_GUI(varargin)
% MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI M-file for Morpho_Export2BrainNet_ConnectMatrix_GUI.fig
%      MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI, by itself, creates a new MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI returns the handle to a new MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI.M with the given input arguments.
%
%      MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI('Property','Value',...) creates a new MORPHO_EXPORT2BRAINNET_CONNECTMATRIX_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Export2BrainNet_ConnectMatrix_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Export2BrainNet_ConnectMatrix_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Export2BrainNet_ConnectMatrix_GUI

% Last Modified by GUIDE v2.5 20-Feb-2014 00:44:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Export2BrainNet_ConnectMatrix_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Export2BrainNet_ConnectMatrix_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Export2BrainNet_ConnectMatrix_GUI is made visible.
function Morpho_Export2BrainNet_ConnectMatrix_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Export2BrainNet_ConnectMatrix_GUI (see VARARGIN)

% Choose default command line output for Morpho_Export2BrainNet_ConnectMatrix_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Export2BrainNet_ConnectMatrix_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Export2BrainNet_ConnectMatrix_GUI_OutputFcn(hObject, eventdata, handles) 
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


function EditNumberofConn_Callback(hObject, eventdata, handles)
% hObject    handle to EditNumberofConn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditNumberofConn as text
%        str2double(get(hObject,'String')) returns contents of EditNumberofConn as a double


% --- Executes during object creation, after setting all properties.
function EditNumberofConn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditNumberofConn (see GCBO)
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


function EditStructCodeFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditStructCodeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditStructCodeFile as text
%        str2double(get(hObject,'String')) returns contents of EditStructCodeFile as a double


% --- Executes during object creation, after setting all properties.
function EditStructCodeFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditStructCodeFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function EditConMatsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to EditConMatsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditConMatsFiles as text
%        str2double(get(hObject,'String')) returns contents of EditConMatsFiles as a double


% --- Executes during object creation, after setting all properties.
function EditConMatsFiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditConMatsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonConMatsFiles.
function PushbuttonConMatsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonConMatsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConMatFiles

Cad_in = '';
dir = cd;
ConMatFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices Files ...','',dir);

N = size(ConMatFiles,1);
for i=1:N
    Temp = ConMatFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) '; '];
end;

if ~isempty(ConMatFiles)
    h = findobj('Tag', 'EditConMatsFiles');
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

% --- Executes on button press in PushbuttonStructCodeFile.
function PushbuttonStructCodeFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonStructCodeFile (see GCBO)
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

if ~isempty(OutputFolder)
    h = findobj('Tag', 'EditOutPutFolder');
    set(h,'String',OutputFolder);
end;


% --- Executes on button press in PushbuttonDone.
function PushbuttonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder  StructuresCodeFile  CentroidsFile ConMatFiles

h = findobj('Tag', 'EditNumberofConn');
Ni_Label = get(h,'String'); % Number of strongest connections to be plot in BrainNet Viewer.
if isempty(str2num(Ni_Label)) 
    Ni = Ni_Label;
else
    Ni = str2double(Ni_Label);
end;
 
Export2BrainNet_ConMat(ConMatFiles,CentroidsFile,StructuresCodeFile,Ni,OutputFolder);

close;


