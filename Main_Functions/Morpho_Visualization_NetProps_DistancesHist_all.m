function varargout = Morpho_Visualization_NetProps_DistancesHist_all(varargin)
%MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL M-file for Morpho_Visualization_NetProps_DistancesHist_all.fig
%      MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL, by itself, creates a new MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL or raises the existing
%      singleton*.
%
%      H = MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL returns the handle to a new MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL or the handle to
%      the existing singleton*.
%
%      MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL('Property','Value',...) creates a new MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Morpho_Visualization_NetProps_DistancesHist_all_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL('CALLBACK') and MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MORPHO_VISUALIZATION_NETPROPS_DISTANCESHIST_ALL.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Morpho_Visualization_NetProps_DistancesHist_all

% Last Modified by GUIDE v2.5 09-Dec-2008 18:20:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Morpho_Visualization_NetProps_DistancesHist_all_OpeningFcn, ...
                   'gui_OutputFcn',  @Morpho_Visualization_NetProps_DistancesHist_all_OutputFcn, ...
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


% --- Executes just before Morpho_Visualization_NetProps_DistancesHist_all is made visible.
function Morpho_Visualization_NetProps_DistancesHist_all_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Morpho_Visualization_NetProps_DistancesHist_all
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Morpho_Visualization_NetProps_DistancesHist_all wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Morpho_Visualization_NetProps_DistancesHist_all_OutputFcn(hObject, eventdata, handles)
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
warning off;
close;

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
ConnectivityMatrixFiles = spm_select(1,'mat','Selecting Connectivity Matrices Files','',dir);
Cad_in = '';
[n,m] = size(ConnectivityMatrixFiles);
for i =1:n
    Temp = ConnectivityMatrixFiles(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
end
h = findobj('Tag', 'Edit_Connectivity_MatrixFile');
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


% --- Executes on button press in PushbuttonAtlasFile.
function PushbuttonAtlasFile_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonAtlasFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global AtlasImageFile

dir = cd;
AtlasImageFile = spm_select(1,'image','Loading Atlas Image File ...','',dir);
h = findobj('Tag', 'EditAtlasImageFile');
set(h,'String',AtlasImageFile);


% --- Executes on button press in ViewButton.
function ViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to ViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ConnectivityMatrixFiles  AtlasImageFile StructureCodesFile

h_thres = findobj('Tag', 'EditThreshold'); % Reading Threshold.
percent_thres = str2double(get(h_thres,'String'));

D = Make_Structures_distance_Matrix(AtlasImageFile,StructureCodesFile);

C = load(ConnectivityMatrixFiles);
Vars = fieldnames(C);
eval(['ConMat=C.' Vars{1} ';']); clear C;
ConnectMatrix = ConMat.ConMat;
ConMat = abs(ConnectMatrix);
%if isfield(ConMat,'thres')
%   thres = ConMat.thres;
%end;
ind = ConMat>0;
Thresh  = myprctile(ConMat(ind),percent_thres);
ConMat = ConMat>Thresh;
D1 = D.*ConMat;

h1 = findobj('Tag','axes2');
cla;
plot(h1,D(ind),ConnectMatrix(ind),'o');
xlabel(h1,'Euclidean Distance (mm)','FontSize',14); %,'FontWeight','bold');
ylabel(h1,'Correlation Coefficient','FontSize',14); %,'FontWeight','bold');
line([0,max(D1(:))],[Thresh,Thresh],'LineWidth',2,'Color',[1 0 0],'LineStyle','--');
line([0,max(D1(:))],[-Thresh,-Thresh],'LineWidth',2,'Color',[1 0 0],'LineStyle','--');

h1 = findobj('Tag','axes4');
hist(h1,nonzeros(D1(:)),50);
xlabel(h1,'Euclidean Distance (mm)','FontSize',14); %,'FontWeight','bold');
ylabel(h1,'Frecuency','FontSize',14); %,'FontWeight','bold');
%title(ConnectivityMatrixFiles);
% h = gca;
% set(h,'FontSize',12);

h1 = findobj('Tag','axes6');
[x,f] = ecdf(nonzeros(D1(:)));
plot(h1,log(f),log(1-x),'LineWidth',2);
xlabel(h1,'log(Euclidean Distance (mm))','FontSize',14); %,'FontWeight','bold');
ylabel(h1,'log(Cumulative distribution)','FontSize',14); %,'FontWeight','bold');

return;