function varargout = Morpho_Merge_ConMats_Files(varargin)
% MORPHO_MERGE_CONMATS_FILES M-file for Morpho_Merge_ConMats_Files.fig
%      MORPHO_MERGE_CONMATS_FILES, by itself, creates a new MORPHO_MERGE_CONMATS_FILES or raises the existing
%      singleton*.
%
%      H = MORPHO_MERGE_CONMATS_FILES returns the handle to a new MORPHO_MERGE_CONMATS_FILES or the handle to
%      the existing singleton*.
%
%      MORPHO_MERGE_CONMATS_FILES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_MERGE_CONMATS_FILES.M with the given input arguments.
%
%      MORPHO_MERGE_CONMATS_FILES('Property','Value',...) creates a new MORPHO_MERGE_CONMATS_FILES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Merge_ConMats_Files_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Merge_ConMats_Files_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Merge_ConMats_Files

% Last Modified by GUIDE v2.5 19-Feb-2014 22:14:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Merge_ConMats_Files_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Merge_ConMats_Files_OutputFcn, ...
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


% --- Executes just before Morpho_Merge_ConMats_Files is made visible.
function Morpho_Merge_ConMats_Files_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Merge_ConMats_Files (see VARARGIN)

% Choose default command line output for Morpho_Merge_ConMats_Files
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Merge_ConMats_Files wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Merge_ConMats_Files_OutputFcn(hObject, eventdata, handles) 
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

close

function EditMergedConMatsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to EditMergedConMatsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditMergedConMatsFiles as text
%        str2double(get(hObject,'String')) returns contents of EditMergedConMatsFiles as a double


% --- Executes during object creation, after setting all properties.
function EditMergedConMatsFiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditMergedConMatsFiles (see GCBO)
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

global ConMatsFiles

Cad_in = '';
dir = cd;
ConMatsFiles = spm_select([1,Inf],'mat','Loading Connectivity Matrices files ...','',dir);

N = size(ConMatsFiles,1);
for i =1:N
    Temp = ConMatsFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) '; '];
end;

h = findobj('Tag', 'EditConMatsFiles');
set(h,'String',Cad_in);

% --- Executes on button press in PushbuttonMergedConMatsFiles.
function PushbuttonMergedConMatsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonMergedConMatsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save Merged Connectivity Matrix as ...');

OutputFile = [pathname, filename];
h = findobj('Tag', 'EditMergedConMatsFiles');
if filename~=0
    set(h,'String',OutputFile);
end;

% --- Executes on button press in PushbuttonMerge.
function PushbuttonMerge_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonMerge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFile ConMatsFiles

Merge_ConnectMatrixFiles(ConMatsFiles,OutputFile);

close;



