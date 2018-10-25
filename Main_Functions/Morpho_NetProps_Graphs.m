function varargout = Morpho_NetProps_Graphs(varargin)
%MORPHO_NETPROPS_GRAPHS M-file for Morpho_NetProps_Graphs.fig
%      MORPHO_NETPROPS_GRAPHS, by itself, creates a new MORPHO_NETPROPS_GRAPHS or raises the existing
%      singleton*.
%
%      H = MORPHO_NETPROPS_GRAPHS returns the handle to a new MORPHO_NETPROPS_GRAPHS or the handle to
%      the existing singleton*.
%
%      MORPHO_NETPROPS_GRAPHS('Property','Value',...) creates a new MORPHO_NETPROPS_GRAPHS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_NetProps_Graphs_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_NETPROPS_GRAPHS('CALLBACK') and MORPHO_NETPROPS_GRAPHS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_NETPROPS_GRAPHS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_NetProps_Graphs

% Last Modified by GUIDE v2.5 10-Dec-2008 19:59:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_NetProps_Graphs_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_NetProps_Graphs_OutputFcn, ...
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


% --- Executes just before Morpho_NetProps_Graphs is made visible.
function Morpho_NetProps_Graphs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_NetProps_Graphs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_NetProps_Graphs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_NetProps_Graphs_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;


% --- Executes on button press in ViewButton.
function ViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to ViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetworkPropertiesFiles 

% Note:  See errorbar.m function for ploting the error for each measure.

h = findobj('Tag', 'CheckboxAll_Figs_in_One');
%isAll_inOne = get(h,'Value');
isAll_inOne = false;

Plot_Network_Properties(NetworkPropertiesFiles,isAll_inOne);

return;

