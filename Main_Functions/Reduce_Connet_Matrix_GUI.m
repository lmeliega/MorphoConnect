function varargout = Reduce_Connet_Matrix_GUI(varargin)
% REDUCE_CONNET_MATRIX_GUI M-file for Reduce_Connet_Matrix_GUI.fig
%      REDUCE_CONNET_MATRIX_GUI, by itself, creates a new REDUCE_CONNET_MATRIX_GUI or raises the existing
%      singleton*.
%
%      H = REDUCE_CONNET_MATRIX_GUI returns the handle to a new REDUCE_CONNET_MATRIX_GUI or the handle to
%      the existing singleton*.
%
%      REDUCE_CONNET_MATRIX_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REDUCE_CONNET_MATRIX_GUI.M with the given input arguments.
%
%      REDUCE_CONNET_MATRIX_GUI('Property','Value',...) creates a new REDUCE_CONNET_MATRIX_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reduce_Connet_Matrix_GUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reduce_Connet_Matrix_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reduce_Connet_Matrix_GUI

% Last Modified by GUIDE v2.5 23-Jan-2009 14:25:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reduce_Connet_Matrix_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Reduce_Connet_Matrix_GUI_OutputFcn, ...
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


% --- Executes just before Reduce_Connet_Matrix_GUI is made visible.
function Reduce_Connet_Matrix_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reduce_Connet_Matrix_GUI (see VARARGIN)

% Choose default command line output for Reduce_Connet_Matrix_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reduce_Connet_Matrix_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reduce_Connet_Matrix_GUI_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in PushbuttonConnectMatrix.
function PushbuttonConnectMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonConnectMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FileNamesConnectivityMat

FileNamesConnectivityMat = spm_select([1 Inf],'mat','Selecting Connectivity Matrices Files','',cd);

N = size(FileNamesConnectivityMat,1);
Cad_in = '';
for i =1:N
    Temp = FileNamesConnectivityMat(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   ']; %#ok
end;
h = findobj('Tag', 'EditConnectMatrix');
set(h,'String',Cad_in);

% --- Executes on button press in PushbuttonCancel.
function PushbuttonCancel_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off;
close;

% --- Executes on button press in PushbuttonCodeFileBig.
function PushbuttonCodeFileBig_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCodeFileBig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditCodeFileBig');
set(h,'String',StructureCodesFile);

% --- Executes on button press in PushbuttonCodeFileReduced.
function PushbuttonCodeFileReduced_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCodeFileReduced (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile_reduced

dir = cd;
StructureCodesFile_reduced = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditCodeFileReduced');
set(h,'String',StructureCodesFile_reduced);


% --- Executes on button press in PushbuttonReduceMatrix.
function PushbuttonReduceMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonReduceMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FileNamesConnectivityMat StructureCodesFile StructureCodesFile_reduced

NFiles = size(FileNamesConnectivityMat,1);

for i=1:NFiles
    ConnectMatrixFile = FileNamesConnectivityMat(i,:);
    reduce_connect_matrix(ConnectMatrixFile,StructureCodesFile,StructureCodesFile_reduced,'');
end;

close;
