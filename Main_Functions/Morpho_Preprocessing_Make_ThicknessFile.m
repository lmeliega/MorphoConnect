function varargout = Morpho_Preprocessing_Make_ThicknessFile(varargin)
%MORPHO_PREPROCESSING_MAKE_THICKNESSFILE M-file for Morpho_Preprocessing_Make_ThicknessFile.fig
%      MORPHO_PREPROCESSING_MAKE_THICKNESSFILE, by itself, creates a new MORPHO_PREPROCESSING_MAKE_THICKNESSFILE or raises the existing
%      singleton*.
%
%      H = MORPHO_PREPROCESSING_MAKE_THICKNESSFILE returns the handle to a new MORPHO_PREPROCESSING_MAKE_THICKNESSFILE or the handle to
%      the existing singleton*.
%
%      MORPHO_PREPROCESSING_MAKE_THICKNESSFILE('Property','Value',...) creates a new MORPHO_PREPROCESSING_MAKE_THICKNESSFILE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Preprocessing_Make_ThicknessFile_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_PREPROCESSING_MAKE_THICKNESSFILE('CALLBACK') and MORPHO_PREPROCESSING_MAKE_THICKNESSFILE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_PREPROCESSING_MAKE_THICKNESSFILE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Preprocessing_Make_ThicknessFile

% Last Modified by GUIDE v2.5 29-Nov-2008 14:24:40

global CorticalThicknessFiles CorticalLabelFiles StructureCodesFile AtlasesFiles SubjectsList OutputMatrixFile CIVETVolFiles ...
       IndexStructureFile SPAMFiles

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Preprocessing_Make_ThicknessFile_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Preprocessing_Make_ThicknessFile_OutputFcn, ...
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


% --- Executes just before Morpho_Preprocessing_Make_ThicknessFile is made visible.
function Morpho_Preprocessing_Make_ThicknessFile_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Preprocessing_Make_ThicknessFile
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

h = findobj('Tag', 'RadiobuttonMakeMeanThickness');
set(h,'Value',1);
h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag', ' BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseInputSPAMs');
set(h,'Enable','off');
h = findobj('Tag', 'EditInputSPAMs');
set(h,'Enable','off');
% h = findobj('Tag', 'PushButtonIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag', 'EditIndexStructures');
% set(h,'Enable','off');


% UIWAIT makes Morpho_Preprocessing_Make_ThicknessFile wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Preprocessing_Make_ThicknessFile_OutputFcn(hObject, eventdata, handles)
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
h = findobj('Tag', 'RadiobuttonMakeMeanThickness');
set(h,'Value',1);
h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag', ' BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseInputSPAMs');
set(h,'Enable','off');
h = findobj('Tag', 'EditInputSPAMs');
set(h,'Enable','off');

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


% --- Executes on button press in BrowseButtonAtlasFiles.
function BrowseButtonAtlasFiles_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseButtonAtlasFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AtlasesFiles

dir = cd;
AtlasesFiles = spm_select([1 Inf],'image','Selecting Atlas Files (i.e. from IBASPM)','',dir);

Cad_in = '';
[n,m] = size(AtlasesFiles);
for i =1:n
    Temp = AtlasesFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'Edit_Atlas_Files');
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


% --- Executes on button press in ChangePushButton.
function ChangePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChangePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputMatrixFile

h = findobj('Tag', 'RadiobuttonMakeMeanThickness');
isMakeMeanThickness = get(h,'Value');

h = findobj('Tag', 'RadiobuttonMakeMeanCIVET');
isMakeMeanVolumeCIVET = get(h,'Value');

h = findobj('Tag', 'RadiobuttonMakeCerebralMeanThickness');
isMakeCerebralMeanThickness = get(h,'Value');

if isMakeMeanThickness||isMakeMeanVolumeCIVET||isMakeCerebralMeanThickness
    [filename, pathname] = uiputfile({'*.txt'},'Save as');
else
    [filename, pathname] = uiputfile({'*.mat'},'Save as');
end;
OutputMatrixFile = [pathname, filename];
if filename~=0
    h = findobj('Tag', 'EditOutputFiles');
    set(h,'String',OutputMatrixFile);
end;


% --- Executes on button press in PushButtonCancel.
function PushButtonCancel_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off
close;

% --- Executes on button press in RadiobuttonMakeMeanThickness.
function RadiobuttonMakeMeanThickness_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonMakeMeanThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonMakeMeanThickness
set(hObject,'Value',1);

h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','on');

h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','on');



% --- Executes on button press in RadiobuttonFullThicknessFile.
function RadiobuttonFullThicknessFile_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonFullThicknessFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonFullThicknessFile

set(hObject,'Value',1);

h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','off');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','off');
set(h,'Value',0);

% --- Executes on button press in RadiobuttonMeanVolume.
function RadiobuttonMeanVolume_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonMeanVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonMeanVolume

set(hObject,'Value',1);

h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
% h = findobj('Tag', 'PushButtonIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag', 'EditIndexStructures');
% set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','off'); % Change here when it is possible to obtain SPAMs in Volume space


% --- Executes on button press in RadiobuttonStructuresArea.
function RadiobuttonStructuresArea_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonStructuresArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of
% RadiobuttonStructuresArea

set(hObject,'Value',1);

h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
% h = findobj('Tag', 'PushButtonIndexStructures');
% set(h,'Enable','off');
% h = findobj('Tag', 'EditIndexStructures');
% set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','off'); % Change here when it is possible to obtain SPAMs in Volume space

% --- Executes on button press in RadiobuttonMakeMeanCIVET.
function RadiobuttonMakeMeanCIVET_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonMakeMeanCIVET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of
% RadiobuttonMakeMeanCIVET
set(hObject,'Value',1);

h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','on');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','on');


h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','on');
h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','off');
set(h,'Value',0);
% h = findobj('Tag', 'PushButtonIndexStructures');
% set(h,'Enable','on');
% h = findobj('Tag', 'EditIndexStructures');
% set(h,'Enable','on');


% --- Executes on button press in BrowseVolsCIVET.
function BrowseVolsCIVET_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseVolsCIVET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CIVETVolFiles

dir = cd;
CIVETVolFiles = spm_select([1 Inf],'dat','Selecting Volume Files from CIVET','',dir);
Cad_in = '';
[n,m] = size(CIVETVolFiles);
for i =1:n
    Temp = CIVETVolFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'EditVolsCIVET');
set(h,'String',Cad_in);

% --- Executes on button press in BrowseInputSPAMs.
function BrowseInputSPAMs_Callback(hObject, eventdata, handles)
% hObject    handle to BrowseInputSPAMs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SPAMFiles

h = findobj('Tag', 'RadiobuttonMakeMeanThickness');
isMakeThicknessMean = get(h,'Value');
h = findobj('Tag', 'RadiobuttonMeanVolume');
isMakeMeanVolume = get(h,'Value');  

dir = cd;
SPAMFiles = '';
if isMakeThicknessMean
    SPAMFiles = spm_select([1 Inf],'txt','Selecting Atlas Files (i.e. from CIVET)','',dir);
end;
if isMakeMeanVolume
    SPAMFiles = spm_select([1 Inf],'image','Selecting Atlas Files (i.e. from IBASPM)','',dir);
end;

Cad_in = '';
[n,m] = size(SPAMFiles);
for i =1:n
    Temp = SPAMFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end

h = findobj('Tag', 'EditInputSPAMs');
set(h,'String',Cad_in);

% --- Executes on button press in CheckboxCorrectionbySPAMs.
function CheckboxCorrectionbySPAMs_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxCorrectionbySPAMs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxCorrectionbySPAMs

global SPAMFiles

isSPAMCorrectionNeeded = get(hObject,'Value');

if isSPAMCorrectionNeeded
    h = findobj('Tag', 'BrowseInputSPAMs');
    set(h,'Enable','on');
    h = findobj('Tag', 'EditInputSPAMs');
    set(h,'Enable','on'); % Change here to on.    
else
    h = findobj('Tag', 'BrowseInputSPAMs');
    set(h,'Enable','off');
    SPAMFiles = '';
    h = findobj('Tag', 'EditInputSPAMs');
    set(h,'Enable','off');
    set(h,'String',SPAMFiles);
end;


% --- Executes on button press in RadiobuttonMakeCerebralMeanThickness.
function RadiobuttonMakeCerebralMeanThickness_Callback(hObject, eventdata, handles)
% hObject    handle to RadiobuttonMakeCerebralMeanThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadiobuttonMakeCerebralMeanThickness

set(hObject,'Value',1);

h = findobj('Tag', 'BrowseButtonThicknessFiles');
set(h,'Enable','on');
h = findobj('Tag', 'Edit_Cortical_Thickness_Files');
set(h,'Enable','on');

h = findobj('Tag', 'BrowseButtonAtlasFiles');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Atlas_Files');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag', 'Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseButtonStructureCodes');
set(h,'Enable','off');
h = findobj('Tag', 'EditStructureCodes');
set(h,'Enable','off');
h = findobj('Tag', 'BrowseVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'EditVolsCIVET');
set(h,'Enable','off');
h = findobj('Tag', 'PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
set(h,'Enable','off');
% --- Executes on button press in PushButtonDone.
function PushButtonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CorticalThicknessFiles CorticalLabelFiles StructureCodesFile AtlasesFiles SubjectsList OutputMatrixFile CIVETVolFiles ...
       SPAMFiles
   
h = findobj('Tag', 'RadiobuttonMakeMeanThickness');
isMakeMeanThickness = get(h,'Value');
h = findobj('Tag', 'RadiobuttonFullThicknessFile');
isFullThicknessFile = get(h,'Value');
h = findobj('Tag', 'RadiobuttonMeanVolume');
isMeanVolume = get(h,'Value');
h = findobj('Tag', 'RadiobuttonMakeMeanCIVET');
isMeanVolumeCIVET = get(h,'Value');
h = findobj('Tag', 'CheckboxCorrectionbySPAMs');
isSPAMCorrectionNeeded = get(h,'Value');
h = findobj('Tag', 'RadiobuttonMakeCerebralMeanThickness');
isMakeCerebralMeanThickness = get(h,'Value');
h = findobj('Tag', 'RadiobuttonStructuresArea');
isStructureSurface = get(h,'Value');

if isMakeMeanThickness||isFullThicknessFile
    if ~isempty(SubjectsList)
        CorticalThicknessFiles = findFiles(SubjectsList,CorticalThicknessFiles);
    end;
    disp('Loading Cortical Thickness Data for all Subjects ...')
    Y = ReadingCIVETData(CorticalThicknessFiles);    
    disp('Cortical Thickness data loaded ...')
    if isMakeMeanThickness
        if ~isempty(SubjectsList)
            CorticalLabelFiles = findFiles(SubjectsList,CorticalLabelFiles);
        end;
        if isempty(SPAMFiles)
            Y = MeanThicknessComputation(Y,StructureCodesFile,isSPAMCorrectionNeeded,CorticalLabelFiles);
        else
            Y = MeanThicknessComputation(Y,StructureCodesFile,isSPAMCorrectionNeeded,CorticalLabelFiles,SPAMFiles);
        end;
    end;
end;
if isMeanVolume
    FilePath = fileparts(OutputMatrixFile);
    VolStatsFile = [FilePath,filesep,'AllStructVols.txt'];
    VolStatsFile = strvcat(VolStatsFile,VolStatsFile);
    chv = 1; % To compute structure volumes.
    cha = 0; % The Structures areas will not be calculated.
    if ~isempty(SubjectsList)
        AtlasesFiles = findFiles(SubjectsList,AtlasesFiles);
    end;
    SaveResultsFlag = 0;
    Y = Vols_Area_Stats_Morpho(AtlasesFiles,StructureCodesFile,VolStatsFile,'all',chv,cha,SaveResultsFlag);  %#ok
    if isstruct(Y)
        Y = Y.Vol;
    end;
end;
if isMeanVolumeCIVET
    if ~isempty(SubjectsList)
        CIVETVolFiles = findFiles(SubjectsList,CIVETVolFiles);
    end;
    Y = readVolsCIVET(CIVETVolFiles,StructureCodesFile); %#ok
end;
if isMakeCerebralMeanThickness
    if ~isempty(SubjectsList)
        CorticalThicknessFiles = findFiles(SubjectsList,CorticalThicknessFiles);
    end;
    disp('Loading Cortical Thickness Data for all Subjects ...')
    Y = ReadingCIVETData(CorticalThicknessFiles); %#ok
    Y = double(mean(Y,2)); %#ok
end;
if isStructureSurface
    FilePath = fileparts(OutputMatrixFile);
    SurfStatsFile = [FilePath,filesep,'AllStructSurfaces.txt'];
    SurfStatsFile = strvcat(SurfStatsFile,SurfStatsFile); %#ok
    chv = 0; % To compute structure volumes.
    cha = 1; % The Structures areas will not be calculated.
    if ~isempty(SubjectsList)
        AtlasesFiles = findFiles(SubjectsList,AtlasesFiles);
    end;
    SaveResultsFlag = 0;
    Y = Vols_Area_Stats_Morpho(AtlasesFiles,StructureCodesFile,SurfStatsFile,'all',chv,cha,SaveResultsFlag);  %#ok
    if isstruct(Y)
        Y = Y.Area;
    end;
end;
% Saving Output Files ...
if isFullThicknessFile||isMeanVolume||isStructureSurface
    save(deblank(OutputMatrixFile),'Y');
end;
if isMakeMeanThickness||isMeanVolumeCIVET||isMakeCerebralMeanThickness
    save(deblank(OutputMatrixFile),'Y','-ascii');
end;

close;
return;




