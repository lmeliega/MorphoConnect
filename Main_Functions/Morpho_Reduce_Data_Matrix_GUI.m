function varargout = Morpho_Reduce_Data_Matrix_GUI(varargin)
%MORPHO_REDUCE_DATA_MATRIX_GUI M-file for Morpho_Reduce_Data_Matrix_GUI.fig
%      MORPHO_REDUCE_DATA_MATRIX_GUI, by itself, creates a new MORPHO_REDUCE_DATA_MATRIX_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_REDUCE_DATA_MATRIX_GUI returns the handle to a new MORPHO_REDUCE_DATA_MATRIX_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_REDUCE_DATA_MATRIX_GUI('Property','Value',...) creates a new MORPHO_REDUCE_DATA_MATRIX_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Reduce_Data_Matrix_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_REDUCE_DATA_MATRIX_GUI('CALLBACK') and MORPHO_REDUCE_DATA_MATRIX_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_REDUCE_DATA_MATRIX_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Reduce_Data_Matrix_GUI

% Last Modified by GUIDE v2.5 28-Mar-2010 12:06:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Reduce_Data_Matrix_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Reduce_Data_Matrix_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_Reduce_Data_Matrix_GUI is made visible.
function Morpho_Reduce_Data_Matrix_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Reduce_Data_Matrix_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Reduce_Data_Matrix_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Reduce_Data_Matrix_GUI_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in Cancel_Pushbutton.
function Cancel_Pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel_Pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off
close;


% --- Executes on button press in Browse_Pushbutton_Reduced_List_Subjects.
function Browse_Pushbutton_Reduced_List_Subjects_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_Reduced_List_Subjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SubjectsList

dir = cd;
SubjectsList = spm_select([1 Inf],'txt','Loading Subject List File','',dir);

Cad_in = '';
[n,m] = size(SubjectsList);
for i =1:n
    Temp = SubjectsList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_Reduced_List_Subjects');
set(h,'String',Cad_in);


% --- Executes on button press in Browse_Pushbutton_Full_List_Subjects.
function Browse_Pushbutton_Full_List_Subjects_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_Full_List_Subjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SubjectsFullList

dir = cd;
SubjectsFullList = spm_select([1 Inf],'txt','Loading Full Subject List File','',dir);

Cad_in = '';
[n,m] = size(SubjectsFullList);
for i =1:n
    Temp = SubjectsFullList(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_Full_List_Subjects');
set(h,'String',Cad_in);


% --- Executes on button press in Browse_Pushbutton_Structure_Codes.
function Browse_Pushbutton_Structure_Codes_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_Structure_Codes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'Edit_Structure_Codes');
set(h,'String',StructureCodesFile);


% --- Executes on button press in Browse_Pushbutton_New_Structure_Codes.
function Browse_Pushbutton_New_Structure_Codes_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_New_Structure_Codes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NewStructureCodesFile

dir = cd;
NewStructureCodesFile = spm_select(1,'cod','Loading New Structure Code File ...','',dir);
h = findobj('Tag', 'Edit_New_Structure_Codes');
set(h,'String',NewStructureCodesFile);


% --- Executes on button press in Browse_Pushbutton_Data_Matrix.
function Browse_Pushbutton_Data_Matrix_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_Data_Matrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global InputDataMatrixFile

dir = cd;
InputDataMatrixFile = spm_select([1 Inf],'any','Loading Data Matrix Files','',dir);

Cad_in = '';
[n,m] = size(InputDataMatrixFile);
for i =1:n
    Temp = InputDataMatrixFile(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag', 'Edit_Data_Matrix');
set(h,'String', Cad_in);

% --- Executes on button press in Pushbutton_OutputFile.
function Pushbutton_OutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_OutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDataMatrixFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
OutputDataMatrixFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'Edit_OutputResultFile');
    set(h,'String',OutputDataMatrixFile);
end;


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;

% --- Executes on button press in PushbuttonTransform_DataMatrix.
function PushbuttonTransform_DataMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonTransform_DataMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDataMatrixFile InputDataMatrixFile NewStructureCodesFile StructureCodesFile SubjectsFullList SubjectsList

[~,~,FileExt] = fileparts(InputDataMatrixFile(1,:));
DataMatrix = load(deblank(InputDataMatrixFile));
if strcmpi(FileExt,'.mat')
    if isfield(DataMatrix,'V')
        DataMatrix = DataMatrix.V;
        flagV = true;
    else
        if isfield(DataMatrix,'Data')
            DataMatrix = DataMatrix.Data.Y;
            flagV = false;
        else
            DataMatrix = DataMatrix.Y;
            flagV = false;
        end;
    end;
else
    flagV = false;
end;

V = Morpho_Reduce_Data_Matrix(DataMatrix,StructureCodesFile,NewStructureCodesFile,SubjectsList,SubjectsFullList);

if flagV
    save(OutputDataMatrixFile,'V');
else
    if isstruct(V)
        Data = V; clear V; %#ok
        save(OutputDataMatrixFile,'Data');
    else
        Y = V; clear V; %#ok
        save(OutputDataMatrixFile,'Y');
    end;
end;

close;
