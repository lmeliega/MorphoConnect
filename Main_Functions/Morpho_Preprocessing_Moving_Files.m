function varargout = Morpho_Preprocessing_Moving_Files(varargin)
%MORPHO_PREPROCESSING_MOVING_FILES M-file for Morpho_Preprocessing_Moving_Files.fig
%      MORPHO_PREPROCESSING_MOVING_FILES, by itself, creates a new MORPHO_PREPROCESSING_MOVING_FILES or raises the existing
%      singleton*.
%
%      H = MORPHO_PREPROCESSING_MOVING_FILES returns the handle to a new MORPHO_PREPROCESSING_MOVING_FILES or the handle to
%      the existing singleton*.
%
%      MORPHO_PREPROCESSING_MOVING_FILES('Property','Value',...) creates a new MORPHO_PREPROCESSING_MOVING_FILES using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Preprocessing_Moving_Files_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_PREPROCESSING_MOVING_FILES('CALLBACK') and MORPHO_PREPROCESSING_MOVING_FILES('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_PREPROCESSING_MOVING_FILES.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Preprocessing_Moving_Files

% Last Modified by GUIDE v2.5 23-Oct-2008 13:46:01

global InputDirectory OutputDirectory SubjectsList 

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Preprocessing_Moving_Files_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Preprocessing_Moving_Files_OutputFcn, ...
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


% --- Executes just before Morpho_Preprocessing_Moving_Files is made visible.
function Morpho_Preprocessing_Moving_Files_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Preprocessing_Moving_Files
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Preprocessing_Moving_Files wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Preprocessing_Moving_Files_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in PushButtonCancel.
function PushButtonCancel_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
close;

% --- Executes on button press in BrowseInputDirectory.
function BrowseInputDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseInputDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global InputDirectory

StartPath = cd;
InputDirectory = uigetdir(StartPath,'Select Directory ...');
if InputDirectory~=0
    h = findobj('Tag', 'Edit_InputDirectory');
    set(h,'String',InputDirectory);
end;

% --- Executes on button press in PushButtonListSubjects.
function PushButtonListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsList

dir = cd;
SubjectsList = spm_select(1,'txt','Loading Subject List File','',dir);
h = findobj('Tag', 'EditListSubjects');
set(h,'String',SubjectsList);


% --- Executes on button press in CheckboxFilesWith.
function CheckboxFilesWith_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxFilesWith (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxFilesWith

isChecked = get(hObject,'Value');
h = findobj('Tag', 'EditFilesWith');
h1 = findobj('Tag', 'PushButtonListSubjects');
h2 = findobj('Tag', 'EditListSubjects');

if isChecked
    set(h,'Enable','on');
    set(h1,'Enable','off');
    set(h2,'Enable','off');
else
    set(h,'Enable','off');
    set(h1,'Enable','on');
    set(h2,'Enable','on');
end;

% --- Executes on button press in ChangePushButton.
function ChangePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDirectory

StartPath = cd;
OutputDirectory = uigetdir(StartPath,'Select Output Directory ...');
if OutputDirectory~=0
    h = findobj('Tag', 'EditOutputFiles');
    set(h,'String',OutputDirectory);
end;

% --- Executes on button press in PushButtonDone.
function PushButtonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global InputDirectory OutputDirectory SubjectsList 

h = findobj('Tag', 'CheckboxFilesWith');
isChecked = get(h,'Value');

if isChecked
    h = findobj('Tag', 'EditFilesWith');
    FileStr = get(h,'String');
    disp(['Searching Files with : '  FileStr '  ...']);
    FoundFiles = pickfiles(InputDirectory,FileStr);
    NFiles = size(FoundFiles,1);
    disp(['--- ' num2str(NFiles) '  files found ...']);
    H = waitbar(0,'Copying Files','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNFiles = num2str(NFiles);
    for i=1:NFiles
        waitbar(i/NFiles,H, ['Copying Files  ' num2str(i) ' of ' StringNFiles]);
        copyfile(FoundFiles(i,:),OutputDirectory,'f');
    end;
    close(H);
else
    CopyFilefromList(SubjectsList,InputDirectory,OutputDirectory);
end;

close;



