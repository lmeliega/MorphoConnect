function varargout = Morpho_NetProps_Stats_compare_N_groups_GUI(varargin)
%MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI M-file for Morpho_NetProps_Stats_compare_N_groups_GUI.fig
%      MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI, by itself, creates a new MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI returns the handle to a new MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI('Property','Value',...) creates a new MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Stats_compare_N_groups_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI('CALLBACK') and MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_STATS_COMPARE_N_GROUPS_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats_compare_N_groups_GUI

% Last Modified by GUIDE v2.5 11-May-2010 17:14:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_compare_N_groups_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_compare_N_groups_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats_compare_N_groups_GUI is made visible.
function Morpho_NetProps_Stats_compare_N_groups_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats_compare_N_groups_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats_compare_N_groups_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_compare_N_groups_GUI_OutputFcn(hObject, eventdata, handles)
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




% --- Executes on button press in Cancel_Pushbutton.
function Cancel_Pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel_Pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

function Edit_OutputResultFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_OutputResultFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_OutputResultFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_OutputResultFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_OutputResultFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_OutputResultFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonOutputFile.
function PushbuttonOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Stat_OutputFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');

Stat_OutputFile = [pathname, filename];
h = findobj('Tag', 'Edit_OutputResultFile');
if filename~=0
    set(h,'String',Stat_OutputFile);
end;

function Edit_NetProps1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup.
function Browse_Pushbutton_NetProps1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_NetProps_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps.
function Browse_Pushbutton_NetProps_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles

dir = cd;
NetworkPropertiesFiles  = spm_select([1 Inf],'mat','Selecting Network Properties File','',dir);
Cad_in = '';
[n,m] = size(NetworkPropertiesFiles);
for i =1:n
    Temp = NetworkPropertiesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_NetProps');
set(h,'String',Cad_in);

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

% --- Executes on button press in PushbuttonCalculate.
function PushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles Stat_OutputFile

Net_Stats = Morpho_NetProps_Stats_compare_N_groups(NetworkPropertiesFiles);

save(Stat_OutputFile, 'Net_Stats','-mat');

close; % Processing ended ...

