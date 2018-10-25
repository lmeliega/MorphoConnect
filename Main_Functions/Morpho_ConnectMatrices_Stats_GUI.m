function varargout = Morpho_ConnectMatrices_Stats_GUI(varargin)
%MORPHO_CONNECTMATRICES_STATS_GUI M-file for Morpho_ConnectMatrices_Stats_GUI.fig
%      MORPHO_CONNECTMATRICES_STATS_GUI, by itself, creates a new MORPHO_CONNECTMATRICES_STATS_GUI or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTMATRICES_STATS_GUI returns the handle to a new MORPHO_CONNECTMATRICES_STATS_GUI or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTMATRICES_STATS_GUI('Property','Value',...) creates a new MORPHO_CONNECTMATRICES_STATS_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_ConnectMatrices_Stats_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTMATRICES_STATS_GUI('CALLBACK') and MORPHO_CONNECTMATRICES_STATS_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTMATRICES_STATS_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_ConnectMatrices_Stats_GUI

% Last Modified by GUIDE v2.5 06-Jan-2015 16:26:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_ConnectMatrices_Stats_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_ConnectMatrices_Stats_GUI_OutputFcn, ...
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


% --- Executes just before Morpho_ConnectMatrices_Stats_GUI is made visible.
function Morpho_ConnectMatrices_Stats_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_ConnectMatrices_Stats_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_ConnectMatrices_Stats_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_ConnectMatrices_Stats_GUI_OutputFcn(hObject, eventdata, handles)
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

warning off;
close;

function Edit_q_value_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_q_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_q_value as text
%        str2double(get(hObject,'String')) returns contents of Edit_q_value as a double


% --- Executes during object creation, after setting all properties.
function Edit_q_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_q_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopupmenuMultipleTests.
function PopupmenuMultipleTests_Callback(hObject, eventdata, handles)
% hObject    handle to PopupmenuMultipleTests (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns PopupmenuMultipleTests contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopupmenuMultipleTests


% --- Executes during object creation, after setting all properties.
function PopupmenuMultipleTests_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopupmenuMultipleTests (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_OutputResultFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_OutputResultFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_OutputResultFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_OutputResultFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_OutputResultFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_OutputResultFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonOutputFile.
function PushbuttonOutputFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputStatFile

[filename, pathname] = uiputfile({'*.txt'},'Save as');
OutputStatFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'Edit_OutputResultFile');
    set(h,'String',OutputStatFile);
end;

function Edit_ConnectMatrix1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_ConnectMatrix1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_ConnectMatrix1stGroup as text
%        str2double(get(hObject,'String')) returns contents of Edit_ConnectMatrix1stGroup as a double


% --- Executes during object creation, after setting all properties.
function Edit_ConnectMatrix1stGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_ConnectMatrix1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_ConnectMatrix1stGroup.
function Browse_Pushbutton_ConnectMatrix1stGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_ConnectMatrix1stGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ConnectMatrixFile1

dir = cd;
ConnectMatrixFile1 = spm_select(1,'mat','Loading Connectivity Matrix File (1st Group) ...','',dir);
h = findobj('Tag', 'Edit_ConnectMatrix1stGroup');
set(h,'String',ConnectMatrixFile1);


function Edit_ConnectMatrix2ndGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_ConnectMatrix2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_ConnectMatrix2ndGroup as text
%        str2double(get(hObject,'String')) returns contents of Edit_ConnectMatrix2ndGroup as a double


% --- Executes during object creation, after setting all properties.
function Edit_ConnectMatrix2ndGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_ConnectMatrix2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse_Pushbutton_ConnectMatrix2ndGroup.
function Browse_Pushbutton_ConnectMatrix2ndGroup_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_Pushbutton_ConnectMatrix2ndGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectMatrixFile2

dir = cd;
ConnectMatrixFile2 = spm_select(1,'mat','Loading Connectivity Matrix File (2nd Group) ...','',dir);
h = findobj('Tag', 'Edit_ConnectMatrix2ndGroup');
set(h,'String',ConnectMatrixFile2);



function Edit_StructuresFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_StructuresFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_StructuresFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_StructuresFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_StructuresFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_StructuresFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Pushbutton_Browse_StructureFile.
function Pushbutton_Browse_StructureFile_Callback(hObject, eventdata, handles)
% hObject    handle to Pushbutton_Browse_StructureFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'Edit_StructuresFile');
set(h,'String',StructureCodesFile);


% --- Executes on button press in PushbuttonCalculate.
function PushbuttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectMatrixFile1 ConnectMatrixFile2 StructureCodesFile OutputStatFile

h = findobj('Tag','Edit_q_value');
qvalue = str2double(get(h,'String'));

h = findobj('Tag','PopupmenuMultipleTests');
TestType = get(h,'Value');

switch TestType
    case 1
        TestType = 'fdr';
    case 2
        TestType = 'locfdr';
end;

X = load(deblank(ConnectMatrixFile1));
ConnectMatrix1 = X.ConnectMatrix;
p1 = ConnectMatrix1.pValues;
if isfield(ConnectMatrix1,'NSubjects')
    N1 = ConnectMatrix1.NSubjects;
else
    N1 = ConnectMatrix1.NTimes;
end;

X = load(deblank(ConnectMatrixFile2));
ConnectMatrix2 = X.ConnectMatrix;
p2 = ConnectMatrix2.pValues;
if isfield(ConnectMatrix2,'NSubjects')
    N2 = ConnectMatrix2.NSubjects;
else
    N2 = ConnectMatrix2.NTimes;
end;

if isempty(StructureCodesFile)    
    Structures = ConnectMatrix1.Structures;
else    
    Structures = ReadCodeFile(StructureCodesFile);
end;

switch ConnectMatrix1.Connectivity_Method
    case 'Pearson Correlation'
        k = 1;
    case 'Partial Correlation'
        k = size(ConnectMatrix1.ConMat,1)-2;
end;

[Z,p,Zthres,pthres] = Connect_ztest(ConnectMatrix1.ConMat,ConnectMatrix2.ConMat,p1,p2,N1,N2,k,qvalue);
MakeConnectionsList_twoConnectMatrices(ConnectMatrix1.ConMat, ConnectMatrix2.ConMat, Z, Zthres, Structures,OutputStatFile);
open(OutputStatFile);
% Saving Z test to ConnectMatrix format.
ConnectMatrix = 0;
ConnectMatrix.Z = Z;
ConnectMatrix.ConMat = Zthres;
ConnectMatrix.Structures = Structures;
ConnectMatrix.p = p;
ConnectMatrix.pthres = pthres;
ConnectMatrix.Comments = 'This is a Z test comparing two Connectivity Matrices';
[FilePath,FileName] = fileparts(OutputStatFile);
OutputFileConnect = [FilePath,filesep,FileName,'_Ztest.mat'];
save(OutputFileConnect,'ConnectMatrix');

close;
