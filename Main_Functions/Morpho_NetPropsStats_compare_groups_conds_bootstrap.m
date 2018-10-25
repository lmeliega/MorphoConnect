function varargout = Morpho_NetPropsStats_compare_groups_conds_bootstrap(varargin)
%MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP M-file for Morpho_NetPropsStats_compare_groups_conds_bootstrap.fig
%      MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP, by itself, creates a new MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP returns the handle to a new MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP('Property','Value',...) creates a new MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetPropsStats_compare_groups_conds_bootstrap_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP('CALLBACK') and MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPSSTATS_COMPARE_GROUPS_CONDS_BOOTSTRAP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetPropsStats_compare_groups_conds_bootstrap

% Last Modified by GUIDE v2.5 01-Mar-2017 13:46:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetPropsStats_compare_groups_conds_bootstrap_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetPropsStats_compare_groups_conds_bootstrap_OutputFcn, ...
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


% --- Executes just before Morpho_NetPropsStats_compare_groups_conds_bootstrap is made visible.
function Morpho_NetPropsStats_compare_groups_conds_bootstrap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetPropsStats_compare_groups_conds_bootstrap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetPropsStats_compare_groups_conds_bootstrap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetPropsStats_compare_groups_conds_bootstrap_OutputFcn(hObject, eventdata, handles)
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


function Edit_NetProps2ndGroup_Condition1_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition1_nonBoots as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition1_nonBoots as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition1_nonBoots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Edit_NetProps1stGroup_Condition1_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition1_nonBoots as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition1_nonBoots as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition1_nonBoots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Edit_NetProps1stGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition1 as a double

% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_NetProps2ndGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition1 as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_NetProps2ndGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition2 as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition2 as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_NetProps1stGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition2 as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition2 as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_NetProps1stGroup_Condition2_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition2_nonBoots as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition2_nonBoots as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition2_nonBoots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_NetProps2ndGroup_Condition2_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition2_nonBoots as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition2_nonBoots as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition2_nonBoots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% =================  Condition 1  ================= %
% --- Executes on button press in Pushbutton_NetProps1stGroup_Condition1_nonBoots.
function Pushbutton_NetProps1stGroup_Condition1_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps1stGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps1_C1

dir = cd;
NetProps1_C1 = spm_select(1,'mat','Loading Network properties (nonbootstraped) file (1st Group), Condition 1 ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_Condition1_nonBoots');
set(h,'String',NetProps1_C1);


% --- Executes on button press in Pushbutton_NetProps2ndGroup_Condition1_nonBoots.
function Pushbutton_NetProps2ndGroup_Condition1_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps2ndGroup_Condition1_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps2_C1

dir = cd;
NetProps2_C1 = spm_select(1,'mat','Loading Network properties (nonbootstraped) file (2nd Group), Condition 1 ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_Condition1_nonBoots');
set(h,'String',NetProps2_C1);

% --- Executes on button press in Pushbutton_NetProps1stGroup_Condition1.
function Pushbutton_NetProps1stGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps1stGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps1_boot_C1

dir = cd;
NetProps1_boot_C1 = spm_select(1,'mat','Loading Network properties(bootstraped) file (1st Group), Condition 1 ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_Condition1');
set(h,'String',NetProps1_boot_C1);

% --- Executes on button press in Pushbutton_NetProps2ndGroup_Condition1.
function Pushbutton_NetProps2ndGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps2ndGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps2_boot_C1

dir = cd;
NetProps2_boot_C1 = spm_select(1,'mat','Loading Network properties(bootstraped) file (2nd Group), Condition 1 ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_Condition1');
set(h,'String',NetProps2_boot_C1);

% =================  Condition 2  ================= %
% --- Executes on button press in Pushbutton_NetProps1stGroup_Condition2_nonBoots.
function Pushbutton_NetProps1stGroup_Condition2_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps1stGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps1_C2

dir = cd;
NetProps1_C2 = spm_select(1,'mat','Loading Network properties (nonbootstraped) file (1st Group), Condition 2 ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_Condition2_nonBoots');
set(h,'String',NetProps1_C2);

% --- Executes on button press in Pushbutton_NetProps2ndGroup_Condition2_nonBoots.
function Pushbutton_NetProps2ndGroup_Condition2_nonBoots_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps2ndGroup_Condition2_nonBoots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps2_C2

dir = cd;
NetProps2_C2 = spm_select(1,'mat','Loading Network properties (nonbootstraped) file (2nd Group), Condition 2 ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_Condition2_nonBoots');
set(h,'String',NetProps2_C2);

% --- Executes on button press in Pushbutton_NetProps1stGroup_Condition2.
function Pushbutton_NetProps1stGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps1stGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps1_boot_C2

dir = cd;
NetProps1_boot_C2 = spm_select(1,'mat','Loading Network properties(bootstraped) file (1st Group), Condition 2 ...','',dir);
h = findobj('Tag', 'Edit_NetProps1stGroup_Condition2');
set(h,'String',NetProps1_boot_C2);

% --- Executes on button press in Pushbutton_NetProps2ndGroup_Condition2.
function Pushbutton_NetProps2ndGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_NetProps2ndGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetProps2_boot_C2

dir = cd;
NetProps2_boot_C2 = spm_select(1,'mat','Loading Network properties(bootstraped) file (2nd Group), Condition 2 ...','',dir);
h = findobj('Tag', 'Edit_NetProps2ndGroup_Condition2');
set(h,'String',NetProps2_boot_C2);

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

global  Stat_OutputFile NetProps1_C1 NetProps2_C1 NetProps1_C2 NetProps2_C2 NetProps1_boot_C1 NetProps2_boot_C1 NetProps1_boot_C2 NetProps2_boot_C2

% Non-Bootstrapped Network properties file Groups 1 and 2, Conditions 1 and 2.
X = load(deblank(NetProps1_C1));
NNetProps1_C1 = X.NetProps;
X = load(deblank(NetProps2_C1));
NNetProps2_C1 = X.NetProps;
X = load(deblank(NetProps1_C2));  
NNetProps1_C2 = X.NetProps;
X = load(deblank(NetProps2_C2)); 
NNetProps2_C2 = X.NetProps; 
% Bootstrapped Network properties file Groups 1 and 2, Conditions 1 and 2.
X = load(deblank(NetProps1_boot_C1));
NNetProps1_boot_C1 = X.NetProps;
X = load(deblank(NetProps2_boot_C1));
NNetProps2_boot_C1 = X.NetProps;
X = load(deblank(NetProps1_boot_C2));  
NNetProps1_boot_C2 = X.NetProps;
X = load(deblank(NetProps2_boot_C2)); 
NNetProps2_boot_C2 = X.NetProps; 

h = findobj('Tag','Edit_pValue');
pvalue = str2double(get(h,'String')); 

Net_Stats = NetProps_compare_groups_and_Conditions_Stat_bootstrap(NNetProps1_C1,NNetProps2_C1,NNetProps1_C2,NNetProps2_C2, ...
                                                                  NNetProps1_boot_C1,NNetProps2_boot_C1,NNetProps1_boot_C2,NNetProps2_boot_C2,pvalue);
save(Stat_OutputFile, 'Net_Stats','-mat');

close;
