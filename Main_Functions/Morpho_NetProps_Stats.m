function varargout = Morpho_NetProps_Stats(varargin)
% MORPHO_NETPROPS_STATS M-file for Morpho_NetProps_Stats.fig
%      MORPHO_NETPROPS_STATS, by itself, creates a new MORPHO_NETPROPS_STATS or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS returns the handle to a new MORPHO_NETPROPS_STATS or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_NETPROPS_STATS.M with the given input arguments.
%
%      MORPHO_NETPROPS_STATS('Property','Value',...) creates a new MORPHO_NETPROPS_STATS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_NetProps_Stats_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_NetProps_Stats_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats

% Last Modified by GUIDE v2.5 29-Apr-2009 14:52:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats is made visible.
function Morpho_NetProps_Stats_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_NetProps_Stats (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

% --- Executes on button press in Browse_Pushbutton_NetProps1stGroup.
function Browse_Pushbutton_NetProps1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_NetProps1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetPropsFile1

dir = cd;
NetPropsFile1 = spm_select(1,'mat','Loading Network properties file (1st Group) ...','',dir);
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

global NetPropsFile1 NetPropsFile2 Stat_OutputFile

X = load(deblank(NetPropsFile1));
NetProps1 = X.NetProps;

X = load(deblank(NetPropsFile2));
NetProps2 = X.NetProps;

h = findobj('Tag','Edit_p_value');
pvalue = str2double(get(h,'String'));

Net_Stats = T2_NetProps(NetProps1,NetProps2,pvalue); %#ok

save(Stat_OutputFile, 'Net_Stats','-mat');

close;




