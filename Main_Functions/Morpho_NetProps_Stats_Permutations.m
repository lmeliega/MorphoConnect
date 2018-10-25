function varargout = Morpho_NetProps_Stats_Permutations(varargin)
%MORPHO_NETPROPS_STATS_PERMUTATIONS M-file for Morpho_NetProps_Stats_Permutations.fig
%      MORPHO_NETPROPS_STATS_PERMUTATIONS, by itself, creates a new MORPHO_NETPROPS_STATS_PERMUTATIONS or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_STATS_PERMUTATIONS returns the handle to a new MORPHO_NETPROPS_STATS_PERMUTATIONS or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_STATS_PERMUTATIONS('Property','Value',...) creates a new MORPHO_NETPROPS_STATS_PERMUTATIONS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Stats_Permutations_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_STATS_PERMUTATIONS('CALLBACK') and MORPHO_NETPROPS_STATS_PERMUTATIONS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_STATS_PERMUTATIONS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Stats_Permutations

% Last Modified by GUIDE v2.5 16-May-2009 17:49:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Stats_Permutations_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Stats_Permutations_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Stats_Permutations is made visible.
function Morpho_NetProps_Stats_Permutations_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Stats_Permutations
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Stats_Permutations wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Stats_Permutations_OutputFcn(hObject, eventdata, handles)
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

global NetPropsFile1 NetPropsFile2 Stat_OutputFile

X = load(deblank(NetPropsFile1));
NetProps1 = X.NetProps;

X = load(deblank(NetPropsFile2));
NetProps2 = X.NetProps;

h = findobj('Tag','Edit_Number_of_Permutations');
Npermut = str2double(get(h,'String')); % Number of permutations ...

h = findobj('Tag', 'PopupmenuStatistic'); % Type of Statistics: 1) t-student with Identity; 2) Sum of differences with Identity 
StatisticType = get(h,'Value');           % 3) t-student with Absolute value ; 4) Sum of differences with Absolute value 

switch StatisticType
    case 1
        Stat = 1;
    case 2
        Stat = 2;
    case 3
        Stat = 4;
    case 4
        Stat = 5;
end;

h = findobj('Tag', 'PopupmenuRelationshipGroups');
Indep = get(h,'Value');

if Indep==1
    Indep = 0;
else
    Indep = 1;
end;
    
Net_Stats = Permutations_Statistic_NetProps(Stat,Indep,NetProps1,NetProps2,Npermut); %#ok

save(Stat_OutputFile, 'Net_Stats','-mat');

close;



