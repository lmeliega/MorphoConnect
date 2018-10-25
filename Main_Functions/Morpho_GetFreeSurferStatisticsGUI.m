function varargout = Morpho_GetFreeSurferStatisticsGUI(varargin)
% MORPHO_GETFREESURFERSTATISTICSGUI M-file for Morpho_GetFreeSurferStatisticsGUI.fig
%      MORPHO_GETFREESURFERSTATISTICSGUI, by itself, creates a new MORPHO_GETFREESURFERSTATISTICSGUI or raises the existing
%      singleton*.
%
%      H = MORPHO_GETFREESURFERSTATISTICSGUI returns the handle to a new MORPHO_GETFREESURFERSTATISTICSGUI or the handle to
%      the existing singleton*.
%
%      MORPHO_GETFREESURFERSTATISTICSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHO_GETFREESURFERSTATISTICSGUI.M with the given input arguments.
%
%      MORPHO_GETFREESURFERSTATISTICSGUI('Property','Value',...) creates a new MORPHO_GETFREESURFERSTATISTICSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Morpho_GetFreeSurferStatisticsGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Morpho_GetFreeSurferStatisticsGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_GetFreeSurferStatisticsGUI

% Last Modified by GUIDE v2.5 14-Feb-2012 21:02:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_GetFreeSurferStatisticsGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_GetFreeSurferStatisticsGUI_OutputFcn, ...
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


% --- Executes just before Morpho_GetFreeSurferStatisticsGUI is made visible.
function Morpho_GetFreeSurferStatisticsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Morpho_GetFreeSurferStatisticsGUI (see VARARGIN)

% Choose default command line output for Morpho_GetFreeSurferStatisticsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_GetFreeSurferStatisticsGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_GetFreeSurferStatisticsGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in PopupmenuStatisticFile.
function PopupmenuStatisticFile_Callback(hObject, eventdata, handles)
% hObject    handle to PopupmenuStatisticFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns PopupmenuStatisticFile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopupmenuStatisticFile


% --- Executes during object creation, after setting all properties.
function PopupmenuStatisticFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopupmenuStatisticFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in PushbuttonStructureCodesFile.
function PushbuttonStructureCodesFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonStructureCodesFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global StructureCodesFile

dir = cd;
StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
h = findobj('Tag', 'EditStructureCodes');
set(h,'String',StructureCodesFile);

function EditOutputDir_Callback(hObject, eventdata, handles)
% hObject    handle to EditOutputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditOutputDir as text
%        str2double(get(hObject,'String')) returns contents of EditOutputDir as a double


% --- Executes during object creation, after setting all properties.
function EditOutputDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditOutputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonOutputDir.
function PushbuttonOutputDir_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonOutputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDir

dir = cd;
OutputDir = spm_select(1,'dir','Output Folder ....','',dir);

h = findobj('Tag','EditOutputDir');
set(h,'String', OutputDir);


% --- Executes on button press in PushbuttonFreeSurferFolders.
function PushbuttonFreeSurferFolders_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonFreeSurferFolders (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FreeSurferFolders

dir = cd;
FreeSurferFolders = spm_select([1,Inf],'dir','Loading FreeSurfer Folders ....','',dir);

Cad_in = '';
n = size(FreeSurferFolders,1);
for i =1:n
    Temp = FreeSurferFolders(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';  '];
end

h = findobj('Tag','EditFreeSurferFolders');
set(h,'String', Cad_in);


function EditFreeSurferFolders_Callback(hObject, eventdata, handles)
% hObject    handle to EditFreeSurferFolders (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditFreeSurferFolders as text
%        str2double(get(hObject,'String')) returns contents of EditFreeSurferFolders as a double


% --- Executes during object creation, after setting all properties.
function EditFreeSurferFolders_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFreeSurferFolders (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function uipanel4_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function EditListSubjects_Callback(hObject, eventdata, handles)
% hObject    handle to EditListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditListSubjects as text
%        str2double(get(hObject,'String')) returns contents of EditListSubjects as a double


% --- Executes during object creation, after setting all properties.
function EditListSubjects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditListSubjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushbuttonSubjectList.
function PushbuttonSubjectList_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonSubjectList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SubjectsList

dir = cd;
SubjectsList = spm_select(1,'txt','Loading Subject List File','',dir);
h = findobj('Tag', 'EditListSubjects');
set(h,'String',SubjectsList);

% --- Executes on button press in PushbuttonCancel.
function PushbuttonCancel_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

warning off; %#ok
close;

% --- Executes on button press in PushbuttonDone.
function PushbuttonDone_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonDone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global OutputDir FreeSurferFolders StructureCodesFile SubjectsList

h = findobj('Tag','PopupmenuStatisticFile');
StatsFiles = get(h,'String');
w = get(h,'Value');
WhichStatFile = StatsFiles{w};

if ~isempty(SubjectsList)
    FreeSurferFolders = findFiles(SubjectsList,FreeSurferFolders);
end;

ReadFreeSurferStats(FreeSurferFolders, OutputDir, WhichStatFile, StructureCodesFile);

%close;


%% ========  Internal Functions ======== %%
% function OutputFiles = findFiles(IDsFile,FullListFiles)
% 
% % This function find files in a big of List of Files.
% %
% % Input Parameters
% %    IDs : Identifiers of the Files to be found
% %   FullListFiles: Full List of Files.
% %
% % Output Parameters
% %   OutputFiles: The list of files found in 'FullListFiles' with
% %                identifiers 'IDs'.
% %
% % Lester Melie Garcia
% % Cuban Neuroscience Center
% % Havana, October 20th, 2008.
% 
% fid = fopen(IDsFile);
% OutNFiles = 0;
% IDs{1} = '';
% while 1
%     OutNFiles = OutNFiles + 1;
%     line = fgetl(fid);    
%     if ~ischar(line),   break,   end
%     IDs{OutNFiles} = line;  %#ok
% end
% fclose(fid);
% 
% NFiles = size(FullListFiles,1);
% Files = 0;
% c = 0;
% for j=1:OutNFiles-1
%     for i=1:NFiles
%         ind = strfind(FullListFiles(i,:),IDs{j});
%         if ~isempty(ind)
%             c = c + 1;
%             Files(c) = i;
%         end;
%     end;
% end;
% OutputFiles = FullListFiles(Files,:);
% 
% return;
% 
% 
% 
% 
