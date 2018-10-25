function varargout = Morpho_Network_Props_Area_Computation2XLS_GUI(varargin)
% MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI M-file for Morpho_Network_Props_Area_Computation2XLS_GUI.fig
%      MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI, by itself, creates a new MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI returns the handle to a new MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI.M with the given input arguments.
%
%      MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI('Property','Value',...) creates a new MORPHO_NETWORK_PROPS_AREA_COMPUTATION2XLS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Network_Props_Area_Computation2XLS_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Network_Props_Area_Computation2XLS_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Network_Props_Area_Computation2XLS_GUI

% Last Modified by GUIDE v2.5 07-Jan-2015 10:51:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Network_Props_Area_Computation2XLS_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Network_Props_Area_Computation2XLS_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Network_Props_Area_Computation2XLS_GUI is made visible.
function Morpho_Network_Props_Area_Computation2XLS_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Network_Props_Area_Computation2XLS_GUI (see VARARGIN)

% Choose default command line output for Morpho_Network_Props_Area_Computation2XLS_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Morpho_Network_Props_Area_Computation2XLS_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Outputs from this function are returned to the command line.
% h = findobj('Tag','Checkbox_Save_All_in_One');
% set(h,'Value',true);


function varargout = Morpho_Network_Props_Area_Computation2XLS_GUI_OutputFcn(hObject, eventdata, handles) 
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

function EditOutputXLSFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutputXLSFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutputXLSFile as text
%        str2double(get(hObject,'String')) returns contents of EditOutputXLSFile as a double


% --- Executes during object creation, after setting all properties.
function EditOutputXLSFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutputXLSFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonExportExcelFile.
function PushbuttonExportExcelFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonExportExcelFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder

OutputFolder = spm_select(1,'dir','Output Folder ...','',cd);
h = findobj('Tag', 'EditOutputXLSFile');
set(h,'String',OutputFolder);

% --- Executes on button press in CheckboxExportinOneFile.
function CheckboxExportinOneFile_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxExportinOneFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxExportinOneFile

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

% --- Executes on button press in CheckboxTaketheMean.
function CheckboxTaketheMean_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxTaketheMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxTaketheMean

% --- Executes on button press in PushbuttonBrowseNetProps.
function PushbuttonBrowseNetProps_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonBrowseNetProps (see GCBO)
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

h = findobj('Tag', 'EditNetPropsFiles');
set(h,'String',Cad_in);


% --- Executes on button press in PushbuttonDone.
function PushbuttonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles OutputFolder All_in_OneFileFlag

h = findobj('Tag','CheckboxExportinOneFile');
All_in_OneFileFlag = get(h,'Value');
h = findobj('Tag','CheckboxTaketheMean');
isMean = get(h,'Value');

Morpho_Network_Props_Area_Computation2XLS(NetworkPropertiesFiles,OutputFolder,All_in_OneFileFlag,isMean);
%Morpho_Network_Props_Area_Computation2XLS(NetworkPropertiesFiles,OutputFolder,All_in_OneFileFlag,ind2trunc);

close;
