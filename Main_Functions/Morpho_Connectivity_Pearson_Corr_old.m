function varargout = Morpho_Connectivity_Pearson_Corr(varargin)
%MORPHO_CONNECTIVITY_PEARSON_CORR M-file for Morpho_Connectivity_Pearson_Corr.fig
%      MORPHO_CONNECTIVITY_PEARSON_CORR, by itself, creates a new MORPHO_CONNECTIVITY_PEARSON_CORR or raises the existing
%      singleton*.
%
%      H = MORPHO_CONNECTIVITY_PEARSON_CORR returns the handle to a new MORPHO_CONNECTIVITY_PEARSON_CORR or the handle to
%      the existing singleton*.
%
%      MORPHO_CONNECTIVITY_PEARSON_CORR('Property','Value',...) creates a new MORPHO_CONNECTIVITY_PEARSON_CORR using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Connectivity_Pearson_Corr_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_CONNECTIVITY_PEARSON_CORR('CALLBACK') and MORPHO_CONNECTIVITY_PEARSON_CORR('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_CONNECTIVITY_PEARSON_CORR.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Connectivity_Pearson_Corr

% Last Modified by GUIDE v2.5 20-Oct-2008 10:42:08

global CorticalThicknessFiles AgeList GenderList StructuresInputMeanFile StructureCodesFile CorticalLabelFiles ...
       MorphoConnectMatrixFile SubjectsList

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Connectivity_Pearson_Corr_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Connectivity_Pearson_Corr_OutputFcn, ...
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


% --- Executes just before Morpho_Connectivity_Pearson_Corr is made visible.
function Morpho_Connectivity_Pearson_Corr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Connectivity_Pearson_Corr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');

% UIWAIT makes Morpho_Connectivity_Pearson_Corr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Connectivity_Pearson_Corr_OutputFcn(hObject, eventdata, handles)
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

warning off;
close;

% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
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



function Edit_GenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_GenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_GenderFile as text
%        str2double(get(hObject,'String')) returns contents of Edit_GenderFile as a double


% --- Executes during object creation, after setting all properties.
function Edit_GenderFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_GenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BrowseButtonGenderFile.
function BrowseButtonGenderFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonGenderFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GenderList

dir = cd;
GenderList = spm_select(1,'txt','Loading List of Gender File','',dir);
h = findobj('Tag', 'Edit_GenderFile');
set(h,'String',GenderList);

% --- Executes on button press in BrowseButtonThicknessFiles.
function BrowseButtonThicknessFiles_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonThicknessFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalThicknessFiles

dir = cd;
CorticalThicknessFiles = spm_select([1 Inf],'txt','Selecting Cortical Thickness Files','',dir);

Cad_in = '';
[n,m] = size(CorticalThicknessFiles);
for i =1:n
    Temp = CorticalThicknessFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'String',Cad_in);

% --- Executes on button press in BrowseButtonThicknessFiles_Right.
function BrowseButtonThicknessFiles_Right_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonThicknessFiles_Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ListCorticalThicknessFilesRight

dir = cd;
ListCorticalThicknessFilesRight = spm_select(1,'mat','Loading List of Thickness Files (Right)','',dir,'right.*');
h = findobj('Tag', 'Edit_Cortical_Thickness_Right');
set(h,'String',ListCorticalThicknessFilesRight);


% --- Executes on button press in BrowseButtonAgesFile.
function BrowseButtonAgesFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAgesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global AgeList

dir = cd;
AgeList = spm_select(1,'txt','Loading List of Ages File','',dir);
h = findobj('Tag', 'Edit_AgesFile');
set(h,'String',AgeList);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8

set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11

set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton15');
set(h,'ForegroundColor',[0 0 0]);


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
set(hObject,'Value',1);
set(hObject,'ForegroundColor',[1 0 0]);
h = findobj('Tag', 'radiobutton8');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton9');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton10');
set(h,'ForegroundColor',[0 0 0]);
h = findobj('Tag', 'radiobutton11');
set(h,'ForegroundColor',[0 0 0]);


% --- Executes on button press in RadioButtonLoadFile.
function RadioButtonLoadFile_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonLoadFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonLoadFile

CorticalThicknessFiles='';
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'String',CorticalThicknessFiles);

CorticalLabelFiles='';
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',CorticalLabelFiles);

CorticalLabelFiles='';
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'String',CorticalLabelFiles);

SubjectsList = '';
h = findobj('Tag', 'EditListSubjects');
set(h,'String',SubjectsList);

h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');

h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','off');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','off');

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');

% --- Executes on button press in RadioButtonComputeHere.
function RadioButtonComputeHere_Callback(hObject, eventdata, handles)
% hObject    handle to RadioButtonComputeHere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioButtonComputeHere
global StructuresInputMeanFile CorticalThicknessFiles 

StructuresInputMeanFile = '';
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');

% --- Executes on button press in BrowseButtonStructMeanThicnessFile.
function BrowseButtonStructMeanThicnessFile_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonStructMeanThicnessFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StructuresInputMeanFile

dir = cd;
StructuresInputMeanFile = spm_select(1,'any','Loading File with all Thickness ','',dir);
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);


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


% --- Executes on button press in ChangePushButton3.
function ChangePushButton3_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MorphoConnectMatrixFile

[filename, pathname] = uiputfile({'*.mat';'*.*'},'Save as');
MorphoConnectMatrixFile = [pathname, filename];

if filename~=0
    h = findobj('Tag', 'edit5');
    set(h,'String',MorphoConnectMatrixFile);
end;

% --- Executes on button press in radiobuttonCortical_Nodes.
function radiobuttonCortical_Nodes_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCortical_Nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCortical_Nodes

% h = findobj('Tag', 'RadioButtonLoadFile');
% set(h,'Enable','off');
h = findobj('Tag', 'RadioButtonComputeHere');
set(h,'Value',1);

global StructuresInputMeanFile CorticalThicknessFiles 

StructuresInputMeanFile = '';
h = findobj('Tag', 'Edit_StructuresMeanThicknessFile');
set(h,'String',StructuresInputMeanFile);

h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','on');
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','on');

% --- Executes on button press in radiobuttonMean_Thickness.
function radiobuttonMean_Thickness_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonMean_Thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonMean_Thickness

h = findobj('Tag', 'RadioButtonLoadFile');
set(h,'Enable','on');

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

% --- Executes on button press in DoneButton.
function DoneButton_Callback(hObject, eventdata, handles)
% hObject    handle to DoneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CorticalThicknessFiles AgeList GenderList StructuresInputMeanFile StructureCodesFile CorticalLabelFiles ...
       MorphoConnectMatrixFile SubjectsList

warning off;

h = findobj('Tag', 'radiobutton8');
M1 = get(h,'Value');
h = findobj('Tag', 'radiobutton9');
M2 = get(h,'Value');
h = findobj('Tag', 'radiobutton10');
M3 = get(h,'Value');
h = findobj('Tag', 'radiobutton11');
M4 = get(h,'Value');
h = findobj('Tag', 'radiobutton15');
M5 = get(h,'Value');

glm_Model = [M1,M2,M3,M4,M5];
glm_Model = find(glm_Model);

age = importdata(AgeList);
gender = textread(GenderList,'%s');

Age = term(age);
Gender = term(gender);

% Reading Code File
Structures = ReadCodeFile(StructureCodesFile);

h = findobj('Tag', 'radiobuttonMean_Thickness');
isMeanThickness = get(h,'Value');
h = findobj('Tag', 'RadioButtonComputeHere');
ComputeHere = get(h,'Value');
NStruct = length(Structures);
if  ComputeHere
    if ~isempty(SubjectsList)
        CorticalThicknessFiles = findFiles(SubjectsList,CorticalThicknessFiles);
        CorticalLabelFiles = findFiles(SubjectsList,CorticalLabelFiles);
    end;
    CorticalThicknessFilesLeft = CorticalThicknessFiles(1:2:end,:);
    CorticalThicknessFilesRight = CorticalThicknessFiles(2:2:end,:);
    NFiles = size(CorticalThicknessFilesLeft,1);
    thickness_files_left = cell(NFiles,1);
    thickness_files_right = cell(NFiles,1);
    for i=1:NFiles
        thickness_files_left{i} = deblank(CorticalThicknessFilesLeft(i,:));
        thickness_files_right{i} = deblank(CorticalThicknessFilesRight(i,:));
    end;
    CorticalLabelFilesLeft = CorticalLabelFiles(1:2:end,:); %#ok
    CorticalLabelFilesRight = CorticalLabelFiles(2:2:end,:); %#ok
    LabelFilesLeft = cell(NFiles,1);
    LabelFilesRight = cell(NFiles,1);
    for i=1:NFiles
        LabelFilesLeft{i} = deblank(CorticalLabelFilesLeft(i,:));
        LabelFilesRight{i} = deblank(CorticalLabelFilesRight(i,:));
    end;
    disp('Loading Cortical Thickness Data for all Subjects ...')
    Y = SurfStatReadData([thickness_files_left, thickness_files_right]); % Cortical thickness data
    disp('Cortical Thickness data loaded ...')
    disp('Loading Labels for all Subjects ...')
    SubjectLabels = SurfStatReadData([LabelFilesLeft, LabelFilesRight]); % Label for all subjects
    disp('Labels loaded ...')
else
    % If Matlab file then: this file is of NFiles x Np , where Np
    % is the number of points in the Cortical Surface.
    [FilePath,FileName,FileExt] = fileparts(StructuresInputMeanFile);
    Y = load(StructuresInputMeanFile);
    if strcmpi(FileExt,'.mat')
        Y = Y.Y;
    end;
end;

if isMeanThickness
    AllMeanThickness = zeros(NFiles,NStruct);
    H = waitbar(0,'Mean Thickness by Structure Calculation','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNFiles = num2str(NFiles);
    for i=1:NFiles
        waitbar(i/NFiles,H, ['Subject  ' num2str(i) ' of ' StringNFiles]);
        for j=1:NStruct
            ind = SubjectLabels(i,:)==Structures(j).Code;
            AllMeanThickness(i,j)= mean(Y(i,ind));
        end;
    end;
    Y = AllMeanThickness;
    close(H);
end;

SubjectThicknessMeans = mean(Y,2);
ThickMean = term(SubjectThicknessMeans);
switch glm_Model
    case 1  % Model : 1 + Age + Gender + Age*Gender
        slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + ThickMean);
        GLMModel = '1 + Age + Gender + Age*Gender + ThickMean';
    case 2  % Model : 1 + Age + Gender
        slm = SurfStatLinMod(Y, 1 + Age + Gender  + ThickMean);
        GLMModel = '1 + Age + Gender  + ThickMean + ThickMean';
    case 3  % Model : 1 + Age
        slm = SurfStatLinMod(Y, 1 + Age  + ThickMean);
        GLMModel = '1 + Age + ThickMean';
    case 4  % Model : 1 + Gender
        slm = SurfStatLinMod(Y, 1 + Gender  + ThickMean);
        GLMModel = '1 + Gender + ThickMean';
end;

if glm_Model~=5
    Y_hat = slm.X*slm.coef;
    Y = Y - Y_hat;
else
    GLMModel = 'None';
end;

if isMeanThickness
    ConnectMatrix = corrcoef(Y);
    % Zeroing diagonal elements of Connectivity matrix
    i = 1:NStruct;
    inddiag = (i-1)*NStruct + i;
    ConnectMatrix(inddiag) = 0; %#ok
    save(MorphoConnectMatrixFile,'ConnectMatrix','Structures','GLMModel');
else % Calculation for all points in the cortical surface.
    [CorrFilePath,CorrFileName,CorrFileExt] = fileparts(MorphoConnectMatrixFile);
    tic;
    ConnectMatrix = zeros(NStruct);
    ConnectMatrixMax = zeros(NStruct);
    for i=1:NStruct 
        disp(['Structure -->' num2str(i) ' of ' num2str(NStruct)]);
        Structure1_Code = num2str(Structures(i).Code);
        Structure1_Name = num2str(Structures(i).Name); %#ok
        ind1 = SubjectLabels==Structures(i).Code;
        Prob1 = (1/NFiles)*sum(ind1,1)';
        ind1 = find(Prob1~=0);
        N1 = length(ind1); 
        for j=i+1:NStruct
            ind2 = SubjectLabels==Structures(j).Code;
            Prob2 = (1/NFiles)*sum(ind2,1)';
            ind2 = find(Prob2~=0);
            CorrMatrix = corrcoef([Y(:,ind1), Y(:,ind2)]); %#ok
            %Structure2_Code = num2str(Structures(j).Code);
            %Structure2_Name = num2str(Structures(j).Name); %#ok
            %OuputFileName = [CorrFilePath,filesep,CorrFileName,'_region_',Structure1_Code,'_region_',Structure2_Code,CorrFileExt];
            %save(OuputFileName,'CorrMatrix','Structures','GLMModel','Structure1_Code','Structure1_Name','Structure2_Code','Structure2_Name','ind1','ind2');
            % --------------------------%
            SPAMWeig = Prob1(ind1)*Prob2(ind2)';
            Connect = abs(CorrMatrix(1:N1,N1+1:end)); % Here the correlation values are forced to be positive.
            ind = ismember(ind2,ind1);            
            ind = not(ind);
            S1 = Connect(:,ind).*SPAMWeig(:,ind); % Here it is eliminated the overlap points in the second structure. This happens for neigbour structures.
            %N = numel(S1);
            S1_max = max(S1(:));
            S1 = mean(S1(:)); % Here we are taking the mean value. Other measures can be used (i.e. maximum).
            %---------------------------%
            ind = ismember(ind1,ind2);            
            ind = not(ind);
            S2 = Connect(ind,:).*SPAMWeig(ind,:); % Here the overlap points in the first structure is eliminated. This happens for neigbour structures.
            %N = numel(S2);
            S2_max = max(S2(:));
            S2 = mean(S2(:)); % Here we are taking the mean value. Other measures can be used (i.e. maximum). 
            %---------------------------%
            ConnectMatrix(i,j) = S1;
            ConnectMatrix(j,i) = S2;
            ConnectMatrixMax(i,j) = S1_max;
            ConnectMatrixMax(j,i) = S2_max;
        end;
    end;
    toc;
end;
% Thresholding Connectivity matrix using False Discovery rate.
% fdr_thres = 0.2; 
% Cfdr = locfdr(ConnectMatrix(:)); %,bre,pct,pct0); Here the default parameters are used.
% ind = Cfdr>fdr_thres;
% thres = max(Cfdr(ind));
thres = 0.5;

ConnectMatrix.ConMat = ConnectMatrix;
ConnectMatrix.Structures = Structures;
ConnectMatrix.GLMModel = GLMModel;
ConnectMatrix.thres = thres;

save(MorphoConnectMatrixFile,'ConnectMatrix');
[FilePath,FileName,FileExt] = fileparts(MorphoConnectMatrixFile); 
if ~isMeanThickness    
    ConnectMatrixMax.ConMat = ConnectMatrixMax;
    ConnectMatrixMax.Structures = Structures;
    ConnectMatrixMax.GLMModel = GLMModel;
    ConnectMatrixMax.thres = thres;
    FileName = [FileName '_max'];
    MorphoConnectMatrixMaxFile = [FilePath,FileName,FileExt];
    save(MorphoConnectMatrixMaxFile,'ConnectMatrixMax');
end;
close;
