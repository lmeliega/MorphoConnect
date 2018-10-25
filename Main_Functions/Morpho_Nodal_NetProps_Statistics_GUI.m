function varargout = Morpho_Nodal_NetProps_Statistics_GUI(varargin)
% MORPHO_NODAL_NETPROPS_STATISTICS_GUI M-file for Morpho_Nodal_NetProps_Statistics_GUI.fig
%      MORPHO_NODAL_NETPROPS_STATISTICS_GUI, by itself, creates a new MORPHO_NODAL_NETPROPS_STATISTICS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_NODAL_NETPROPS_STATISTICS_GUI returns the handle to a new MORPHO_NODAL_NETPROPS_STATISTICS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_NODAL_NETPROPS_STATISTICS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_NODAL_NETPROPS_STATISTICS_GUI.M with the given input arguments.
%
%      MORPHO_NODAL_NETPROPS_STATISTICS_GUI('Property','Value',...) creates a new MORPHO_NODAL_NETPROPS_STATISTICS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Nodal_NetProps_Statistics_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Nodal_NetProps_Statistics_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Nodal_NetProps_Statistics_GUI

% Last Modified by GUIDE v2.5 16-Mar-2014 22:39:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Nodal_NetProps_Statistics_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Nodal_NetProps_Statistics_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Nodal_NetProps_Statistics_GUI is made visible.
function Morpho_Nodal_NetProps_Statistics_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Nodal_NetProps_Statistics_GUI (see VARARGIN)

% Choose default command line output for Morpho_Nodal_NetProps_Statistics_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Nodal_NetProps_Statistics_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Nodal_NetProps_Statistics_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PushbuttonCancelStats.
function PushbuttonCancelStats_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCancelStats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

function EditOutputStatsFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutputStatsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutputStatsFile as text
%        str2double(get(hObject,'String')) returns contents of EditOutputStatsFile as a double


% --- Executes during object creation, after setting all properties.
function EditOutputStatsFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutputStatsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonOutputStatsFile.
function PushbuttonOutputStatsFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputStatsFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Stat_OutputFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');

Stat_OutputFile = [pathname, filename];
h = findobj('Tag', 'EditOutputStatsFile');
if filename~=0
    set(h,'String',Stat_OutputFile);
end;

function Editpvalue_Callback(hObject, eventdata, handles)
% hObject    handle to Editpvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Editpvalue as text
%        str2double(get(hObject,'String')) returns contents of Editpvalue as a double


% --- Executes during object creation, after setting all properties.
function Editpvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editpvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditInputNetPropsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to EditInputNetPropsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInputNetPropsFiles as text
%        str2double(get(hObject,'String')) returns contents of EditInputNetPropsFiles as a double


% --- Executes during object creation, after setting all properties.
function EditInputNetPropsFiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInputNetPropsFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopupmenuIndepentSamples.
function PopupmenuIndepentSamples_Callback(hObject, eventdata, handles)
% hObject    handle to PopupmenuIndepentSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns PopupmenuIndepentSamples contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopupmenuIndepentSamples


% --- Executes during object creation, after setting all properties.
function PopupmenuIndepentSamples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopupmenuIndepentSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in PushbuttonInputNetPropsFiles.
function PushbuttonInputNetPropsFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonInputNetPropsFiles (see GCBO)
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

h = findobj('Tag', 'EditInputNetPropsFiles');
set(h,'String',Cad_in);


% --- Executes on button press in PushbuttonCalculateStats.
function PushbuttonCalculateStats_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculateStats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles Stat_OutputFile

h = findobj('Tag','Editpvalue');
pval = str2double(get(h,'String'));
h = findobj('Tag','PopupmenuIndepentSamples');
ispaired = (get(h,'Value')==2);   % For get(h,'Value')==2 dependent samples was choosen,
                                  % For get(h,'Value')==1 independent samples instead
Nodal_Props_Stats(NetworkPropertiesFiles,pval,ispaired,Stat_OutputFile);

close;

