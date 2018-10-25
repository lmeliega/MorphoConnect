function varargout = Morpho_save2Brainbow_Interface(varargin)
%MORPHO_SAVE2BRAINBOW_INTERFACE M-file for Morpho_save2Brainbow_Interface.fig
%      MORPHO_SAVE2BRAINBOW_INTERFACE, by itself, creates a new MORPHO_SAVE2BRAINBOW_INTERFACE or raises the existing
%      singleton*.
%
%      H = MORPHO_SAVE2BRAINBOW_INTERFACE returns the handle to a new MORPHO_SAVE2BRAINBOW_INTERFACE or the handle to
%      the existing singleton*.
%
%      MORPHO_SAVE2BRAINBOW_INTERFACE('Property','Value',...) creates a new MORPHO_SAVE2BRAINBOW_INTERFACE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_save2Brainbow_Interface_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_SAVE2BRAINBOW_INTERFACE('CALLBACK') and MORPHO_SAVE2BRAINBOW_INTERFACE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_SAVE2BRAINBOW_INTERFACE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_save2Brainbow_Interface

% Last Modified by GUIDE v2.5 12-Apr-2010 17:07:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_save2Brainbow_Interface_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_save2Brainbow_Interface_OutputFcn, ...
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


% --- Executes just before Morpho_save2Brainbow_Interface is made visible.
function Morpho_save2Brainbow_Interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_save2Brainbow_Interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_save2Brainbow_Interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_save2Brainbow_Interface_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in BrowsePushButton.
function BrowsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectivityFile BrainbowOutputFile

dir = cd;
ConnectivityFile = spm_select(1,'mat','Selecting Connectivity Matrix File','',dir);
h = findobj('Tag', 'Edit_ConnectMatrix_File');
set(h,'String',ConnectivityFile);

[pth,filename] = fileparts(ConnectivityFile);
BrainbowOutputFile = '';
if ~isempty(filename)
    BrainbowOutputFile = [pth,filesep,filename,'_brainbow.txt'];
    h = findobj('Tag', 'EditOutputFile');
    set(h,'String',BrainbowOutputFile);    
end;

% --- Executes on button press in BrowsePushButtonNetworkProperties.
function BrowsePushButtonNetworkProperties_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButtonNetworkProperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in BrowseButtonStructureCodes.

global NetPropsFile

dir = cd;
NetPropsFile = spm_select(1,'mat','Selecting Network properties File','',dir);
h = findobj('Tag', 'Edit_Netprops_File');
set(h,'String',NetPropsFile);


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

global BrainbowOutputFile

[filename, pathname] = uiputfile({'*.txt'},'Save as');
BrainbowOutputFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'EditOutputFile');
    set(h,'String',BrainbowOutputFile);
end;

% --- Executes on button press in PushButtonConvert.
function PushButtonConvert_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonConvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectivityFile StructureCodesFile BrainbowOutputFile NetPropsFile

h = findobj('Tag', 'EditNumberofConnections');
NCon = str2double(get(h,'String'));

h = findobj('Tag', 'EditNumberofNodes');
NNodes = str2double(get(h,'String'));

if ~isempty(ConnectivityFile)
    ConnectMatrix = load(ConnectivityFile);
    ConnectMatrix = ConnectMatrix.ConnectMatrix;
else
    ConnectMatrix = '';
end;

if ~isempty(NetPropsFile)
    NetProps = load(NetPropsFile);
    NetProps = NetProps.NetProps;
else
    NetProps = '';
end;

if isfield(ConnectMatrix,'Structures')||isfield(NetProps,'Structures')
    %Morpho_save2Brainbow(ConnectMatrix,NetProps,BrainbowOutputFile,'');
    Morpho_save2Brainbow(ConnectMatrix,NetProps,BrainbowOutputFile,'',NCon,NNodes)
else
    Structures = ReadCodeFile(StructureCodesFile);
    %Morpho_save2Brainbow(ConnectMatrix,NetProps,BrainbowOutputFile,Structures);
    Morpho_save2Brainbow(ConnectMatrix,NetProps,BrainbowOutputFile,Structures,NCon,NNodes);
end;

