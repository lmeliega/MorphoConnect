function varargout = Morpho_Preprocessing_Make_Volume_using_SPAM(varargin)
%MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM M-file for Morpho_Preprocessing_Make_Volume_using_SPAM.fig
%      MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM, by itself, creates a new MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM or raises the existing
%      singleton*.
%
%      H = MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM returns the handle to a new MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM or the handle to
%      the existing singleton*.
%
%      MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM('Property','Value',...) creates a new MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Preprocessing_Make_Volume_using_SPAM_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM('CALLBACK') and MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_PREPROCESSING_MAKE_VOLUME_USING_SPAM.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Preprocessing_Make_Volume_using_SPAM

% Last Modified by GUIDE v2.5 10-Nov-2008 19:21:43

global GrayMatterFiles WhiteMatterFiles CSFFiles SubjectsList SPAMFiles StructureCodesFile OutputMatrixFile TransformFiles

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Preprocessing_Make_Volume_using_SPAM_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Preprocessing_Make_Volume_using_SPAM_OutputFcn, ...
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


% --- Executes just before Morpho_Preprocessing_Make_Volume_using_SPAM is made visible.
function Morpho_Preprocessing_Make_Volume_using_SPAM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Preprocessing_Make_Volume_using_SPAM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Preprocessing_Make_Volume_using_SPAM wait for user response (see UIRESUME)
% uiwait(handles.figure1);
h = findobj('Tag', 'EditManualThreshold');
set(h,'Enable','on');

h = findobj('Tag', 'PushButtonGrayMatterFiles');
set(h,'Enable','on');
h = findobj('Tag', 'EditGrayMatterFiles');
set(h,'Enable','on');
h = findobj('Tag', 'PushButtonWhiteMatterFiles');
set(h,'Enable','off');
h = findobj('Tag', 'EditWhiteMatterFiles');
set(h,'Enable','off');
h = findobj('Tag', 'PushbuttonCSFFiles');
set(h,'Enable','off');
h = findobj('Tag', 'EditCSFFiles');
set(h,'Enable','off');


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

h = findobj('Tag', 'EditManualThreshold');
set(h,'Enable','on');

h = findobj('Tag', 'PushButtonGrayMatterFiles');
set(h,'Enable','on');
h = findobj('Tag', 'EditGrayMatterFiles');
set(h,'Enable','on');
h = findobj('Tag', 'PushButtonWhiteMatterFiles');
set(h,'Enable','off');
h = findobj('Tag', 'EditWhiteMatterFiles');
set(h,'Enable','off');
h = findobj('Tag', 'PushbuttonCSFFiles');
set(h,'Enable','off');
h = findobj('Tag', 'EditCSFFiles');
set(h,'Enable','off');

% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Preprocessing_Make_Volume_using_SPAM_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


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

warning off;
close;


% --- Executes on button press in PushButtonGrayMatterFiles.
function PushButtonGrayMatterFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonGrayMatterFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global GrayMatterFiles;

dir = cd;
GrayMatterFiles = spm_select([1 Inf],'image','Selecting Gray Matter Files (i.e. from IBASPM)','',dir,'seg1.*'); 

Cad_in = '';
[n,m] = size(GrayMatterFiles);
for i =1:n
    Temp = GrayMatterFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditGrayMatterFiles');
set(h,'String',Cad_in);


% --- Executes on button press in PushButtonWhiteMatterFiles.
function PushButtonWhiteMatterFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonWhiteMatterFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global WhiteMatterFiles;

dir = cd;
WhiteMatterFiles = spm_select([1 Inf],'image','Selecting White Matter Files (i.e. from IBASPM)','',dir,'seg2.*'); 

Cad_in = '';
[n,m] = size(WhiteMatterFiles);
for i =1:n
    Temp = WhiteMatterFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditWhiteMatterFiles');
set(h,'String',Cad_in);


% --- Executes on button press in PushbuttonCSFFiles.
function PushbuttonCSFFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCSFFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CSFFiles;

dir = cd;
CSFFiles = spm_select([1 Inf],'image','Selecting CSF Files (i.e. from IBASPM)','',dir,'seg3.*'); 

Cad_in = '';
[n,m] = size(CSFFiles);
for i =1:n
    Temp = CSFFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'EditCSFFiles');
set(h,'String',Cad_in);


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


% --- Executes on button press in PushButtonTransformFiles.
function PushButtonStructureCodes_Callback(hObject, eventdata, handles) 
% hObject    handle to PushButtonTransformFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditStructureCodes');
set(h,'String',StructureCodesFile);


% --- Executes on button press in BrowseInputSPAMs.
function BrowseInputSPAMs_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseInputSPAMs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SPAMFiles

dir = cd;
SPAMFiles = spm_select([1 Inf],'image','Selecting SPAM Files (i.e. from IBASPM)','',dir);

Cad_in = '';
[n,m] = size(SPAMFiles);
for i =1:n
    Temp = SPAMFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) '; '];
end

h = findobj('Tag', 'EditInputSPAMs');
set(h,'String',Cad_in);

   
% --- Executes on button press in PushButtonTransformFiles.
function PushButtonTransformFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonTransformFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global TransformFiles

dir = cd;
TransformFiles = spm_select([1 Inf],'mat','Selecting Transformation Files ...','',dir,'sn.*');

Cad_in = '';
[n,m] = size(TransformFiles);
for i =1:n
    Temp = TransformFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) '; '];
end

h = findobj('Tag', 'EditTransformFiles');
set(h,'String',Cad_in);

% --- Executes on button press in ChangePushButton.
function ChangePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputMatrixFile

[filename, pathname] = uiputfile({'*.txt';'*.*'},'Save as');
OutputMatrixFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'EditOutputFiles');
    set(h,'String',OutputMatrixFile);
end;


% --- Executes on button press in CheckboxManualThreshold.
function CheckboxManualThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxManualThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxManualThreshold

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag', 'EditManualThreshold');
    set(h,'Enable','on');
    
    h = findobj('Tag', 'PushButtonGrayMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'EditGrayMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'PushButtonWhiteMatterFiles');
    set(h,'Enable','off');
    h = findobj('Tag', 'EditWhiteMatterFiles');
    set(h,'Enable','off');
    h = findobj('Tag', 'PushbuttonCSFFiles');
    set(h,'Enable','off');
    h = findobj('Tag', 'EditCSFFiles');
    set(h,'Enable','off');
else
    h = findobj('Tag', 'EditManualThreshold');
    set(h,'Enable','off');
    
    h = findobj('Tag', 'PushButtonGrayMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'EditGrayMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'PushButtonWhiteMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'EditWhiteMatterFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'PushbuttonCSFFiles');
    set(h,'Enable','on');
    h = findobj('Tag', 'EditCSFFiles');
    set(h,'Enable','on');
end;

% --- Executes on button press in PushButtonDone.
function PushButtonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global GrayMatterFiles WhiteMatterFiles CSFFiles SubjectsList SPAMFiles StructureCodesFile OutputMatrixFile TransformFiles

h = findobj('Tag', 'CheckboxManualThreshold');
isManualThreshold = get(h,'Value');

if isManualThreshold
    if ~isempty(SubjectsList)
        GrayMatterFiles = findFiles(SubjectsList,GrayMatterFiles);
        WhiteMatterFiles = findFiles(SubjectsList,WhiteMatterFiles);
        CSFFiles = findFiles(SubjectsList,CSFFiles);
        TransformFiles = findFiles(SubjectsList,TransformFiles);
    end;
    h = findobj('Tag', 'EditManualThreshold');
    Thresh = str2double(get(h,'String'));
    Y = Vols_with_SPAMs(GrayMatterFiles, WhiteMatterFiles, CSFFiles, SPAMFiles, TransformFiles, '', Thresh); %#ok
else
    if ~isempty(SubjectsList)
        TransformFiles = findFiles(SubjectsList,TransformFiles);
    end;
    Y = Vols_with_SPAMs('', '', '', SPAMFiles, TransformFiles, '', ''); %#ok
end;

% Saving Output Volume File ...

save(deblank(OutputMatrixFile),'Y','-ascii');

close;




