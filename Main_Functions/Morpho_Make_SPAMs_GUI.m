function varargout = Morpho_Make_SPAMs_GUI(varargin)
% MORPHO_MAKE_SPAMS_GUI M-file for Morpho_Make_SPAMs_GUI.fig
%      MORPHO_MAKE_SPAMS_GUI, by itself, creates a new MORPHO_MAKE_SPAMS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_MAKE_SPAMS_GUI returns the handle to a new MORPHO_MAKE_SPAMS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_MAKE_SPAMS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_MAKE_SPAMS_GUI.M with the given input arguments.
%
%      MORPHO_MAKE_SPAMS_GUI('Property','Value',...) creates a new MORPHO_MAKE_SPAMS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_Make_SPAMs_GUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_Make_SPAMs_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Make_SPAMs_GUI

% Last Modified by GUIDE v2.5 04-Oct-2008 20:48:14

% Global Variables

global CorticalLabelFiles StructureCodesFile SPAMOutputDir

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Make_SPAMs_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Make_SPAMs_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Make_SPAMs_GUI is made visible.
function Morpho_Make_SPAMs_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_Make_SPAMs_GUI (see VARARGIN)

% Choose default command line output for Morpho_Make_SPAMs_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Make_SPAMs_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Make_SPAMs_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function OutputSPAMsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to OutputSPAMsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutputSPAMsEdit as text
%        str2double(get(hObject,'String')) returns contents of OutputSPAMsEdit as a double


% --- Executes during object creation, after setting all properties.
function OutputSPAMsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutputSPAMsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CancelPushButton.
function CancelPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to CancelPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

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


% --- Executes on button press in OuputDirSPAMsPushButton.
function OuputDirSPAMsPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to OuputDirSPAMsPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SPAMOutputDir
dir = cd;
SPAMOutputDir = spm_select(1,'dir','Select directory to save SPAMs files ...','',dir);
h = findobj('Tag', 'OutputSPAMsEdit');
set(h,'String',SPAMOutputDir);

% --- Executes on button press in BrowseButtonCorticalLabels.
function BrowseButtonCorticalLabels_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonCorticalLabels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalLabelFiles

dir = cd;
CorticalLabelFiles = spm_select([1 Inf],'txt','Selecting Cortical Label Files','',dir);
Cad_in = '';
[n,m] = size(CorticalLabelFiles);
for i =1:n
    Temp = CorticalLabelFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',Cad_in);


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


% --- Executes on button press in DonePushButton.
function DonePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to DonePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalLabelFiles StructureCodesFile SPAMOutputDir

Morpho_make_SPAM(CorticalLabelFiles,StructureCodesFile,SPAMOutputDir,1);

close;
 
 