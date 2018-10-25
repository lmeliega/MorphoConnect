function varargout = Morpho_NetProps_Stats_compare_groups(varargin)
%MORPHO_NETPROPS_STATS_COMPARE_GROUPS M-file for Morpho_NetProps_Stats_compare_groups.fig
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS, by itself, creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS_COMPARE_GROUPS returns the handle to a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS('Property','Value',...) creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Stats_compare_groups_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS('CALLBACK') and MORPHO_NETPROPS_STATS_COMPARE_GROUPS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_STATS_COMPARE_GROUPS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats_compare_groups

% Last Modified by GUIDE v2.5 08-Feb-2017 12:37:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_compare_groups_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_compare_groups_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats_compare_groups is made visible.
function Morpho_NetProps_Stats_compare_groups_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats_compare_groups
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats_compare_groups wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_compare_groups_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
close;

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
warning off
close;


function Edit_pValue_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_pValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_pValue as text
%        str2double(get(hObject,'String')) returns contents of Edit_pValue as a double


% --- Executes during object creation, after setting all properties.
function Edit_pValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_pValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function Edit_NetProps2ndGroup_boot_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_boot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_boot as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_boot as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_boot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_boot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_NetProps1stGroup_boot_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_boot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_boot as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_boot as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_boot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_boot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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

function Edit_NetProps2ndGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup (see GCBO)
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

global NetPropsFile1

dir = cd;
NetPropsFile1 = spm_select([1,Inf],'mat','Loading Network properties file (1st Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup');
set(h,'String',NetPropsFile1);


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup.
function Browse_Pushbutton_NetProps2ndGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile2

dir = cd;
NetPropsFile2 = spm_select(1,'mat','Loading Network properties file (2nd Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup');
set(h,'String',NetPropsFile2);


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_bootstrap.
function Browse_Pushbutton_NetProps1stGroup_bootstrap_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_bootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global NetPropsFile1_boot

dir = cd;
NetPropsFile1_boot = spm_select(1,'mat','Loading Network properties file bootstrap(1st Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_boot');
set(h,'String',NetPropsFile1_boot);


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_bootstrap.
function Browse_Pushbutton_NetProps2ndGroup_bootstrap_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_bootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile2_boot

dir = cd;
NetPropsFile2_boot = spm_select(1,'mat','Loading Network properties file bootstrap(2nd Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_boot');
set(h,'String',NetPropsFile2_boot);


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


% --- Executes on button press in PushbuttonCalculate.
function PushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile1 NetPropsFile2 NetPropsFile1_boot NetPropsFile2_boot Stat_OutputFile

X = load(deblank(NetPropsFile1));
NetProps1 = X.NetProps;

X = load(deblank(NetPropsFile2));
NetProps2 = X.NetProps;

X = load(deblank(NetPropsFile1_boot));
NetProps1_boot = X.NetProps;

X = load(deblank(NetPropsFile2_boot));
NetProps2_boot = X.NetProps;

h = findobj('Tag','Edit_pValue');
pvalue = str2double(get(h,'String')); 

[Net_Stats,ResultsTable] = NetProps_compare_groups_Stat01(NetProps1,NetProps2,NetProps1_boot,NetProps2_boot,pvalue); %#ok
%Net_Stats = NetProps_compare_groups_Stat(NetProps1,NetProps2,NetProps1_boot,NetProps2_boot); %#ok

save(Stat_OutputFile, 'Net_Stats','-mat');

if exist('ResultsTable','var')
    [OutFilePath,OutFileName] = fileparts(Stat_OutputFile);
    OutFileName = [OutFileName,'.xls'];
    xlswrite(fullfile(OutFilePath,OutFileName),ResultsTable);
end;

close; % Processing ended ...
