function varargout = Morpho_NetProps_to_Files(varargin)
%MORPHO_NETPROPS_TO_FILES M-file for Morpho_NetProps_to_Files.fig
%      MORPHO_NETPROPS_TO_FILES, by itself, creates a new MORPHO_NETPROPS_TO_FILES or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_TO_FILES returns the handle to a new MORPHO_NETPROPS_TO_FILES or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_TO_FILES('Property','Value',...) creates a new MORPHO_NETPROPS_TO_FILES using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_to_Files_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_TO_FILES('CALLBACK') and MORPHO_NETPROPS_TO_FILES('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_TO_FILES.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_to_Files

% Last Modified by GUIDE v2.5 07-Jan-2015 09:40:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_to_Files_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_to_Files_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_to_Files is made visible.
function Morpho_NetProps_to_Files_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_to_Files
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_to_Files wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_to_Files_OutputFcn(hObject, eventdata, handles)
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
global NetworkPropertiesFiles 

dir = cd;
NetworkPropertiesFiles = spm_select([1,Inf],'mat','Selecting Network Properties Files','',dir);
Cad_in = '';
[n,m] = size(NetworkPropertiesFiles);
for i =1:n
    Temp = NetworkPropertiesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Network_Props_File');
set(h,'String',Cad_in);


% --- Executes on button press in PushButtonChange.
function PushButtonChange_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputFolder

OutputFolder = spm_select(1,'dir','Selecting Folder to save Network Properties Files','',cd);
h = findobj('Tag', 'EditOutputDir');
set(h,'String',OutputFolder);

% --- Executes on button press in PushButtonSave2Files.
function PushButtonSave2Files_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonSave2Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles OutputFolder

get_NetProps2Files(NetworkPropertiesFiles,OutputFolder);

close;

return;
