function varargout = Morpho_Coincident_Connections_List_Generation(varargin)
%MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION M-file for Morpho_Coincident_Connections_List_Generation.fig
%      MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION, by itself, creates a new MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION or raises the existing
%      singleton*.
%
%      H = MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION returns the handle to a new MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION or the handle to
%      the existing singleton*.
%
%      MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION('Property','Value',...) creates a new MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Coincident_Connections_List_Generation_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION('CALLBACK') and MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_COINCIDENT_CONNECTIONS_LIST_GENERATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Coincident_Connections_List_Generation

% Last Modified by GUIDE v2.5 30-Mar-2010 16:02:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Coincident_Connections_List_Generation_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Coincident_Connections_List_Generation_OutputFcn, ...
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


% --- Executes just before Morpho_Coincident_Connections_List_Generation is made visible.
function Morpho_Coincident_Connections_List_Generation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Coincident_Connections_List_Generation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Coincident_Connections_List_Generation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Coincident_Connections_List_Generation_OutputFcn(hObject, eventdata, handles)
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


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;


% --- Executes on button press in BrowsePushButton.
function BrowsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectivityMatrixFiles 

dir = cd;
ConnectivityMatrixFiles = spm_select([1 Inf],'mat','Selecting Connectivity Matrix File','',dir);
Cad_in = '';
[n,m] = size(ConnectivityMatrixFiles);
for i =1:n
    Temp = ConnectivityMatrixFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
if ~isempty(ConnectivityMatrixFiles)
    h = findobj('Tag', 'Edit_Connectivity_MatrixFile');
    set(h,'String',Cad_in);
end;


% --- Executes on button press in BrowseButtonStructureCodes.
function BrowseButtonStructureCodes_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditStructureCodes');
set(h,'String',StructureCodesFile);


% --- Executes on button press in PushbuttonChange.
function PushbuttonChange_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputListFile

[filename, pathname] = uiputfile({'*.txt'},'Save as');
OutputListFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'EditOutputFile');
    set(h,'String',OutputListFile);
end;


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

% --- Executes on button press in PushButtonMakeList.
function PushButtonMakeList_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonMakeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectivityMatrixFiles OutputListFile

h = findobj('Tag','EditNumberofConnections');
N = str2double(get(h,'String'));

h = findobj('Tag','Checkbox_Weakest_Connections');
isWeakestConnections = get(h,'Value');

isBinary = false;

wasSaved = Morpho_Make_N_Coincident_ConnectionsList(ConnectivityMatrixFiles, N, isBinary, isWeakestConnections, OutputListFile);

% if wasSaved
%     open(OutputListFile);
% end;

close;
