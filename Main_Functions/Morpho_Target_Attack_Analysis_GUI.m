function varargout = Morpho_Target_Attack_Analysis_GUI(varargin)
% MORPHO_TARGET_ATTACK_ANALYSIS_GUI M-file for Morpho_Target_Attack_Analysis_GUI.fig
%      MORPHO_TARGET_ATTACK_ANALYSIS_GUI, by itself, creates a new MORPHO_TARGET_ATTACK_ANALYSIS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_TARGET_ATTACK_ANALYSIS_GUI returns the handle to a new MORPHO_TARGET_ATTACK_ANALYSIS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_TARGET_ATTACK_ANALYSIS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_TARGET_ATTACK_ANALYSIS_GUI.M with the given input arguments.
%
%      MORPHO_TARGET_ATTACK_ANALYSIS_GUI('Property','Value',...) creates a new MORPHO_TARGET_ATTACK_ANALYSIS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Target_Attack_Analysis_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Target_Attack_Analysis_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Target_Attack_Analysis_GUI

% Last Modified by GUIDE v2.5 23-Feb-2014 16:09:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Target_Attack_Analysis_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Target_Attack_Analysis_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Target_Attack_Analysis_GUI is made visible.
function Morpho_Target_Attack_Analysis_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Target_Attack_Analysis_GUI (see VARARGIN)

% Choose default command line output for Morpho_Target_Attack_Analysis_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Target_Attack_Analysis_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Target_Attack_Analysis_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PushbuttonClose.
function PushbuttonClose_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

function EditOutputFolder_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutputFolder as text
%        str2double(get(hObject,'String')) returns contents of EditOutputFolder as a double


% --- Executes during object creation, after setting all properties.
function EditOutputFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxPlotResults.
function checkboxPlotResults_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxPlotResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxPlotResults


function EditThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to EditThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditThreshold as text
%        str2double(get(hObject,'String')) returns contents of EditThreshold as a double


% --- Executes during object creation, after setting all properties.
function EditThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditThreshold (see GCBO)
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


% --- Executes on button press in PushbuttonConMats.
function PushbuttonConMats_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonConMats (see GCBO)
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
if ~isempty(ConMatsFiles)
    h = findobj('Tag', 'EditConMatsFiles');
    set(h,'String',Cad_in);
end;

% --- Executes on button press in PushbuttonOutputFolder.
function PushbuttonOutputFolder_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder

OutputFolder = uigetdir(cd, 'Select Folder to save Target Attack Analysis Results ...');

if ~isempty(OutputFolder)
    h = findobj('Tag', 'EditOutputFolder');
    set(h,'String',OutputFolder);
end;

% --- Executes on button press in PushbuttonDone.
function PushbuttonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder ConMatsFiles

h = findobj('Tag', 'EditThreshold');
thres = get(h,'String');
if ~isempty(str2num(thres)) %#ok
    thres = str2double(thres);
end;
h = findobj('Tag', 'checkboxPlotResults');
plotflag = get(h,'Value');

showwaitbar = true;
Make_Target_attack_analysis_upgrade(ConMatsFiles,thres,plotflag,showwaitbar,OutputFolder);

%close;

