function varargout = Morpho_NetProps_Stats_compare_groups_bootstrap(varargin)
%MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP M-file for Morpho_NetProps_Stats_compare_groups_bootstrap.fig
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP, by itself, creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP returns the handle to a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP('Property','Value',...) creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Stats_compare_groups_bootstrap_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP('CALLBACK') and MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_STATS_COMPARE_GROUPS_BOOTSTRAP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats_compare_groups_bootstrap

% Last Modified by GUIDE v2.5 08-Feb-2017 11:27:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_compare_groups_bootstrap_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_compare_groups_bootstrap_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats_compare_groups_bootstrap is made visible.
function Morpho_NetProps_Stats_compare_groups_bootstrap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats_compare_groups_bootstrap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats_compare_groups_bootstrap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_compare_groups_bootstrap_OutputFcn(hObject, eventdata, handles)
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



function Edit_NetProps2ndGroup_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Edit_NetProps1stGroup_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_nonBootstraped (see GCBO)
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

% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_nonBootstraped.
function Browse_Pushbutton_NetProps1stGroup_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile1_nonBoostraped

dir = cd;
NetPropsFile1_nonBoostraped = spm_select(1,'mat','Loading Network properties file (1st Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_nonBootstraped');
set(h,'String',NetPropsFile1_nonBoostraped);

% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_nonBootstraped.
function Browse_Pushbutton_NetProps2ndGroup_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile2_nonBoostraped

dir = cd;
NetPropsFile2_nonBoostraped = spm_select(1,'mat','Loading Network properties file (2nd Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_nonBootstraped');
set(h,'String',NetPropsFile2_nonBoostraped);

% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup.
function Browse_Pushbutton_NetProps1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile1

dir = cd;
NetPropsFile1 = spm_select(1,'mat','Loading bootstrapped Network properties file (1st Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup');
set(h,'String',NetPropsFile1);


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup.
function Browse_Pushbutton_NetProps2ndGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile2

dir = cd;
NetPropsFile2 = spm_select(1,'mat','Loading bootstrapped Network properties file (2nd Group) ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup');
set(h,'String',NetPropsFile2);

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

% --- Executes on button press in Cancel_Pushbutton.
function Cancel_Pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel_Pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

% --- Executes on button press in PushbuttonCalculate.
function PushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile1_nonBoostraped NetPropsFile2_nonBoostraped NetPropsFile1 NetPropsFile2 Stat_OutputFile

X = load(deblank(NetPropsFile1_nonBoostraped));
NetProps1_Nonboot = X.NetProps;

X = load(deblank(NetPropsFile2_nonBoostraped));
NetProps2_Nonboot = X.NetProps;

X = load(deblank(NetPropsFile1));  % Bootstrapped Network properties file Group 1.
NetProps1 = X.NetProps;

X = load(deblank(NetPropsFile2));  % Bootstrapped Network properties file Group 2.
NetProps2 = X.NetProps; 

h = findobj('Tag','Edit_pValue');
pvalue = str2double(get(h,'String')); 

% h = findobj('Tag', 'Popupmenu_Statistic_Type'); 
% StatisticType = get(h,'Value');           
% 
% switch StatisticType
%     case 1
%         Stat = 1;
%     case 2
%         Stat = 2;
% end;
% 
%Net_Stats = NetProps_compare_groups_Stat_bootstrap(NetProps1,NetProps2,pvalue,Stat); %#ok
[Net_Stats,ResultsTable] = NetProps_compare_groups_Stat_bootstrap01(NetProps1_Nonboot,NetProps2_Nonboot,NetProps1,NetProps2,pvalue);

save(Stat_OutputFile, 'Net_Stats','-mat');
if exist('ResultsTable','var')
    [OutFilePath,OutFileName] = fileparts(Stat_OutputFile);
    OutFileName = [OutFileName,'.xls'];
    xlswrite(fullfile(OutFilePath,OutFileName),ResultsTable);
end;
    
close;
