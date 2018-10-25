function varargout = Morpho_Visualization_ConnectMatrix(varargin)
%MORPHO_VISUALIZATION_CONNECTMATRIX M-file for Morpho_Visualization_ConnectMatrix.fig
%      MORPHO_VISUALIZATION_CONNECTMATRIX, by itself, creates a new MORPHO_VISUALIZATION_CONNECTMATRIX or raises the existing
%      singleton*.
%
%      H = MORPHO_VISUALIZATION_CONNECTMATRIX returns the handle to a new MORPHO_VISUALIZATION_CONNECTMATRIX or the handle to
%      the existing singleton*.
%
%      MORPHO_VISUALIZATION_CONNECTMATRIX('Property','Value',...) creates a new MORPHO_VISUALIZATION_CONNECTMATRIX using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Visualization_ConnectMatrix_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_VISUALIZATION_CONNECTMATRIX('CALLBACK') and MORPHO_VISUALIZATION_CONNECTMATRIX('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_VISUALIZATION_CONNECTMATRIX.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Visualization_ConnectMatrix

% Last Modified by GUIDE v2.5 08-Mar-2016 13:40:21

global ConnectivityMatrixFiles StructureCodesFile

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Visualization_ConnectMatrix_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Visualization_ConnectMatrix_OutputFcn, ...
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


% --- Executes just before Morpho_Visualization_ConnectMatrix is made visible.
function Morpho_Visualization_ConnectMatrix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Visualization_ConnectMatrix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Visualization_ConnectMatrix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Visualization_ConnectMatrix_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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

% --- Executes on button press in BrowsePushButton.
function BrowsePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to BrowsePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ConnectivityMatrixFiles 

dir = cd;
ConnectivityMatrixFiles = spm_select([1 Inf],'mat','Selecting Connectivity Matrices Files','',dir);
Cad_in = '';
[n,m] = size(ConnectivityMatrixFiles);
for i =1:n
    Temp = ConnectivityMatrixFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Connectivity_MatrixFile');
set(h,'String',Cad_in);

function EditStructureCodes_Callback(hObject, eventdata, handles)
% hObject    handle to EditStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditStructureCodes as text
%        str2double(get(hObject,'String')) returns contents of EditStructureCodes as a double


% --- Executes during object creation, after setting all properties.
function EditStructureCodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditStructureCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in SameScale_Checkbox.
function SameScale_Checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to SameScale_Checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SameScale_Checkbox

function EditThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to EditThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditThreshold as text
%        str2double(get(hObject,'String')) returns contents of EditThreshold as a double


% --- Executes during object creation, after setting all properties.
function EditThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BinaryCheckbox.
function BinaryCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to BinaryCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BinaryCheckbox

% --- Executes on button press in ViewButton.
function ViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to ViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ConnectivityMatrixFiles StructureCodesFile

h = findobj('Tag', 'popupmenu4'); % Reading List of Colormaps.
List_Colormap = get(h,'String');
h_thres = findobj('Tag', 'EditThreshold'); % Reading Threshold.
percent = str2double(get(h_thres,'String'));
h1 = findobj('Tag', 'BinaryCheckbox');
isBinary = get(h1,'Value');

h2 = findobj('Tag', 'SameScale_Checkbox');
isSameScale = get(h2,'Value');

NFiles = size(ConnectivityMatrixFiles,1);
Conmins = zeros(NFiles,1); Conmaxs = zeros(NFiles,1);
for i=1:NFiles
    C = load(deblank(ConnectivityMatrixFiles(i,:)));
    %Vars = fieldnames(C);
    %eval(['ConMat=C.' Vars{1} ';']);
    ConMat=C.ConnectMatrix; clear C;
    ConnectMatrix = mean(ConMat.ConMat,3);
    Conmins(i) =  min(ConnectMatrix(:));
    Conmaxs(i) =  max(ConnectMatrix(:));
end;
global_min = min(Conmins); global_max = max(Conmaxs);
ContMatScale = [global_min,global_max];
for i=1:NFiles
    C = load(deblank(ConnectivityMatrixFiles(i,:)));
    %Vars = fieldnames(C);
    %eval(['ConMat=C.' Vars{1} ';']); clear C;
    ConMat=C.ConnectMatrix; clear C;
    ConnectMatrix = ConMat.ConMat;
    if isempty(StructureCodesFile)
        Structures = ConMat.Structures;
    else
        Structures = ReadCodeFile(StructureCodesFile);
    end;    
    NStruct = length(Structures);
    StructLabels = cell(NStruct,1);
    for k=1:NStruct
        if isstruct(Structures)
            StructLabels{k}= [Structures(k).Name,'- ',num2str(k)];
        else
            StructLabels{k}= [Structures{k},'- ',num2str(k)];
        end;
    end;
    %ConnectMatrix = inv(ConnectMatrix);
    if percent~=0
        ConnectMatrix = abs(ConnectMatrix);
        ConMat = ConnectMatrix;
        %if isfield(ConMat,'thres')
        %   thres = ConMat.thres;
        %end;
        ind = ConMat>0;
        thresh  = myprctile(ConMat(ind),percent);
        %ConMat = double(tempConMat>thresh);
        ind = find(ConMat<thresh);
        ConnectMatrix(ind) = 0; %#ok
        if isBinary
            ind = find(ConnectMatrix>=thresh);
            ConnectMatrix(ind) = 1; %#ok
        end;
    else
        ConMat = ConnectMatrix;
        thresh = 0;
    end;
    ConnectMatrix = mean(ConnectMatrix,3);
    %ConnectMatrix =  ConnectMatrix.*(ConnectMatrix>0);
    [~,ConnectFileName]=fileparts(ConnectivityMatrixFiles(i,:));
    FigColormap = lower(List_Colormap{get(h,'Value')});
    FigTitle = ['Morphologic Connectivity Matrix -' ConnectFileName '-  Threshold : ' num2str(percent) '% (' num2str(thresh) ')']; 
    View_Connect_Matrix(ConnectMatrix,StructLabels,FigColormap,FigTitle,isSameScale,ContMatScale);    
end;


