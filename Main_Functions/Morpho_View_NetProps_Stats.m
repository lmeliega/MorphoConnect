function varargout = Morpho_View_NetProps_Stats(varargin)
%MORPHO_VIEW_NETPROPS_STATS M-file for Morpho_View_NetProps_Stats.fig
%      MORPHO_VIEW_NETPROPS_STATS, by itself, creates a new MORPHO_VIEW_NETPROPS_STATS or raises the existing
%      singleton*.
%
%      H = MORPHO_VIEW_NETPROPS_STATS returns the handle to a new MORPHO_VIEW_NETPROPS_STATS or the handle to
%      the existing singleton*.
%
%      MORPHO_VIEW_NETPROPS_STATS('Property','Value',...) creates a new MORPHO_VIEW_NETPROPS_STATS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_View_NetProps_Stats_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_VIEW_NETPROPS_STATS('CALLBACK') and MORPHO_VIEW_NETPROPS_STATS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_VIEW_NETPROPS_STATS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_View_NetProps_Stats

% Last Modified by GUIDE v2.5 13-Jun-2009 10:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_View_NetProps_Stats_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_View_NetProps_Stats_OutputFcn, ...
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


% --- Executes just before Morpho_View_NetProps_Stats is made visible.
function Morpho_View_NetProps_Stats_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_View_NetProps_Stats
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_View_NetProps_Stats wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_View_NetProps_Stats_OutputFcn(hObject, eventdata, handles)
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

delete(hObject);

% --- Executes on button press in BrowsePushButton.
function BrowsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NetStatsFileName 

dir = cd;
NetStatsFileName = spm_select([1 Inf],'mat','Selecting Statistic File','',dir);

Cad_in = '';
[n,m] = size(NetStatsFileName);
for i =1:n
    Temp = NetStatsFileName(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  ']; %#ok
end
h = findobj('Tag', 'Edit_Stat_Network_Props_File');
set(h,'String',Cad_in);


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%delete(hObject);
close;


% --- Executes on button press in ViewButton.
function ViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to ViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NetStatsFileName

h = findobj('Tag', 'Edit_pvalue');
pvalue = str2double(get(h,'String'));

%Plot_Net_Stats(NetStatsFileName,pvalue);
%Plot_All_Net_Stats_bootstraping(NetStatsFileName,pvalue);
Plot_All_Net_Stats_Resampling(NetStatsFileName,pvalue);

return;



