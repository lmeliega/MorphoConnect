function varargout = Morpho_Networks_Props_View(varargin)
% MORPHO_NETWORKS_PROPS_VIEW M-file for Morpho_Networks_Props_View.fig
%      MORPHO_NETWORKS_PROPS_VIEW, by itself, creates a new MORPHO_NETWORKS_PROPS_VIEW or raises the existing
%      singleton*.
%
%      H = MORPHO_NETWORKS_PROPS_VIEW returns the handle to a new MORPHO_NETWORKS_PROPS_VIEW or the handle to
%      the existing singleton*.
%
%      MORPHO_NETWORKS_PROPS_VIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_NETWORKS_PROPS_VIEW.M with the given input arguments.
%
%      MORPHO_NETWORKS_PROPS_VIEW('Property','Value',...) creates a new MORPHO_NETWORKS_PROPS_VIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Networks_Props_View_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Networks_Props_View_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Networks_Props_View

% Last Modified by GUIDE v2.5 24-Feb-2010 18:33:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Networks_Props_View_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Networks_Props_View_OutputFcn, ...
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


% --- Executes just before Morpho_Networks_Props_View is made visible.
function Morpho_Networks_Props_View_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Networks_Props_View (see VARARGIN)

% Choose default command line output for Morpho_Networks_Props_View
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Networks_Props_View wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Networks_Props_View_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in PushButtonConnectivityMatrixStats.
function PushButtonConnectivityMatrixStats_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonConnectivityMatrixStats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Visualization_NetProps_DistancesHist.fig;


% --- Executes on button press in PushButtonViewNetworkProperties.
function PushButtonViewNetworkProperties_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonViewNetworkProperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Graphs.fig;


% --- Executes on button press in PushButtonViewNetworkPropertiesStatistic.
function PushButtonViewNetworkPropertiesStatistic_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonViewNetworkPropertiesStatistic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_View_NetProps_Stats.fig;

% --- Executes on button press in PushButtonSave2BrainBow.
function PushButtonSave2BrainBow_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonSave2BrainBow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_save2Brainbow_Interface.fig;
