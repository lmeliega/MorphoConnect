function varargout = Morpho_Make_N_Coincident_NodalPropsList_GUI(varargin)
%MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI M-file for Morpho_Make_N_Coincident_NodalPropsList_GUI.fig
%      MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI, by itself, creates a new MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI returns the handle to a new MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI('Property','Value',...) creates a new MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Make_N_Coincident_NodalPropsList_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI('CALLBACK') and MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_MAKE_N_COINCIDENT_NODALPROPSLIST_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Make_N_Coincident_NodalPropsList_GUI

% Last Modified by GUIDE v2.5 02-Apr-2010 14:16:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Make_N_Coincident_NodalPropsList_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Make_N_Coincident_NodalPropsList_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Make_N_Coincident_NodalPropsList_GUI is made visible.
function Morpho_Make_N_Coincident_NodalPropsList_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Make_N_Coincident_NodalPropsList_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Make_N_Coincident_NodalPropsList_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Make_N_Coincident_NodalPropsList_GUI_OutputFcn(hObject, eventdata, handles)
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

warning off;
close;

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

global NetworkPropertiesFiles

dir = cd;
NetworkPropertiesFiles  = spm_select([1 Inf],'mat','Selecting Network Properties File','',dir);
Cad_in = '';
[n,m] = size(NetworkPropertiesFiles);
for i =1:n
    Temp = NetworkPropertiesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Netprops_File');
set(h,'String',Cad_in);

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


% --- Executes on button press in PushButtonMakeList.
function PushButtonMakeList_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonMakeList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputListFile NetworkPropertiesFiles 

h = findobj('Tag','EditNumberofConnections');
N = str2double(get(h,'String'));

Morpho_Make_N_Coincident_NodalPropsList(NetworkPropertiesFiles, N, OutputListFile);

close;