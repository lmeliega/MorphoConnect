function varargout = Morpho_Visualization(varargin)
%MORPHO_VISUALIZATION M-file for Morpho_Visualization.fig
%      MORPHO_VISUALIZATION, by itself, creates a new MORPHO_VISUALIZATION or raises the existing
%      singleton*.
%
%      H = MORPHO_VISUALIZATION returns the handle to a new MORPHO_VISUALIZATION or the handle to
%      the existing singleton*.
%
%      MORPHO_VISUALIZATION('Property','Value',...) creates a new MORPHO_VISUALIZATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Visualization_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_VISUALIZATION('CALLBACK') and MORPHO_VISUALIZATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_VISUALIZATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Visualization

% Last Modified by GUIDE v2.5 28-Sep-2008 14:03:57
%
% Global Variables
global SurfaceFiles DataFiles

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Visualization_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Visualization_OutputFcn, ...
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


% --- Executes just before Morpho_Visualization is made visible.
function Morpho_Visualization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Visualization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Visualization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Visualization_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BrowsePushButton1.
function BrowsePushButton1_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SurfaceFiles

dir = cd;
SurfaceFiles = spm_select([1 Inf],'obj','Selecting Surface File','',dir);
Cad_in = '';
[n,m] = size(SurfaceFiles);
for i =1:n
    Temp = SurfaceFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end;
h = findobj('Tag', 'Edit_SurfaceFiles');
set(h,'String',Cad_in);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global DataFiles

dir = cd;
DataFiles = spm_select([1 Inf],'txt','Selecting Surface File','',dir);
Cad_in = '';
[n,m] = size(DataFiles);
for i =1:n
    Temp = DataFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end;
h = findobj('Tag', 'Edit_DataFiles');
set(h,'String',Cad_in);


% --- Executes on button press in ViewButton.
function ViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to ViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DataFiles SurfaceFiles

NDataFiles = size(DataFiles,1);
NSurfaceFiles = size(SurfaceFiles,1);
if NDataFiles==NSurfaceFiles
    DataFiles_Cell = cell(1,NDataFiles);
    SurfaceFiles_Cell = cell(1,NSurfaceFiles);
    for i=1:NDataFiles
        DataFiles_Cell{i} = deblank(DataFiles(i,:));
        SurfaceFiles_Cell{i} = deblank(SurfaceFiles(i,:));
    end;
    SData = SurfStatReadData(DataFiles_Cell);
    SSurf = SurfStatReadSurf(SurfaceFiles_Cell);
    h = findobj('Tag', 'popupmenu4'); % Reading List of Colormaps.
    List_Colormap = get(h,'String');
    SurfColormap = lower(List_Colormap{get(h,'Value')});
    figure;
    SurfStatView(SData,SSurf);
    SurfStatColormap(SurfColormap);
else
    msgbox('The number of Data and Surface Files must be the same ...','Mistmatch','error');
end;


% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off;
close;

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


