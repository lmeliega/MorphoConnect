function varargout = Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap(varargin)
%MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP M-file for Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap.fig
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP, by itself, creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP returns the handle to a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP('Property','Value',...) creates a new MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP('CALLBACK') and MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_STATS_COMPARE_GROUPS_AND_CONDITIONS_BOOTSTRAP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap

% Last Modified by GUIDE v2.5 01-Mar-2017 12:53:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap is made visible.
function Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_compare_groups_and_conditions_bootstrap_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in PushbuttonCalculate.
function PushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Cancel_Pushbutton.
function Cancel_Pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel_Pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in PushbuttonOutputFile.
function PushbuttonOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_NetProps2ndGroup_Condition1_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition1_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition1_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition1_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_Condition1_nonBootstraped.
function Browse_Pushbutton_NetProps2ndGroup_Condition1_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_NetProps1stGroup_Condition1_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition1_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition1_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition1_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_Condition1_nonBootstraped.
function Browse_Pushbutton_NetProps1stGroup_Condition1_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_Condition1_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_Condition1.
function Browse_Pushbutton_NetProps1stGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_Condition1.
function Browse_Pushbutton_NetProps2ndGroup_Condition1_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_Condition1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_Condition2.
function Browse_Pushbutton_NetProps2ndGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_Condition2.
function Browse_Pushbutton_NetProps1stGroup_Condition2_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_Condition2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_NetProps1stGroup_Condition2_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps1stGroup_Condition2_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps1stGroup_Condition2_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps1stGroup_Condition2_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps1stGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup_Condition2_nonBootstraped.
function Browse_Pushbutton_NetProps1stGroup_Condition2_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_NetProps2ndGroup_Condition2_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_NetProps2ndGroup_Condition2_nonBootstraped as text
%        str2double(get(hObject,'String')) returns contents of Edit_NetProps2ndGroup_Condition2_nonBootstraped as a double


% --- Executes during object creation, after setting all properties.
function Edit_NetProps2ndGroup_Condition2_nonBootstraped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_NetProps2ndGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_NetProps2ndGroup_Condition2_nonBootstraped.
function Browse_Pushbutton_NetProps2ndGroup_Condition2_nonBootstraped_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps2ndGroup_Condition2_nonBootstraped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
