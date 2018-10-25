function varargout = Network_Properties(varargin)
% NETWORK_PROPERTIES M-file for Network_Properties.fig
%      NETWORK_PROPERTIES, by itself, creates a new NETWORK_PROPERTIES or raises the existing
%      singleton*.
%
%      H = NETWORK_PROPERTIES returns the handle to a new NETWORK_PROPERTIES or the handle to
%      the existing singleton*.
%
%      NETWORK_PROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NETWORK_PROPERTIES.M with the given input arguments.
%
%      NETWORK_PROPERTIES('Property','Value',...) creates a new NETWORK_PROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Network_Properties_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Network_Properties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Network_Properties

% Last Modified by GUIDE v2.5 23-Feb-2016 17:34:41

global FileNamesConnectivityMat Out_dir
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Network_Properties_OpeningFcn, ...
    'gui_OutputFcn',  @Network_Properties_OutputFcn, ...
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


% --- Executes just before Network_Properties is made visible.
function Network_Properties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Network_Properties (see VARARGIN)

% Choose default command line output for Network_Properties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Network_Properties wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Network_Properties_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Select the folder which was created in the first step:
%% FunctionalConnectivity
global FileNamesConnectivityMat Out_dir;

warning off
% Hint: get(hObject,'Value') returns toggle state of Browse
dir = cd;
FileNamesConnectivityMat = spm_select([1 Inf],'mat','Selecting Files','',dir);
Cad_in = '';
Cad_out = '';
Out_dir = '';
N = size(FileNamesConnectivityMat,1);
for i =1:N
    ind = strfind(FileNamesConnectivityMat(i,:), filesep);
    Temp = FileNamesConnectivityMat(i,:);
    Cad_in = [Cad_in Temp(1:end-4) ';   '];
    Cad_out =[Cad_out Temp(1:ind(end)-1) filesep 'NetworkProperties;   '];
    Out_dir = strvcat(Out_dir,Temp(1:ind(end)-1));
end
h = findobj('Tag', 'edit1');
set(h,'String',Cad_in);
h = findobj('Tag', 'edit2');
set(h,'String',Cad_out);

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Change.
function Change_Callback(hObject, eventdata, handles)
% hObject    handle to Change (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  Out_dir;

Out_dir = spm_select(1,'dir','Selecting Output Directory','',cd);
h = findobj('Tag', 'edit2');
set(h,'String',Out_dir);


% --- Executes on button press in Cluster_Coefficient.
function Cluster_Coefficient_Callback(hObject, eventdata, handles)
% hObject    handle to Cluster_Coefficient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cluster_Coefficient


% --- Executes on button press in Char_Path_Length.
function Char_Path_Length_Callback(hObject, eventdata, handles)
% hObject    handle to Char_Path_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Char_Path_Length


% --- Executes on button press in Vulnerability.
function Vulnerability_Callback(hObject, eventdata, handles)
% hObject    handle to Vulnerability (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Vulnerability


% --- Executes on button press in WBC.
function WBC_Callback(hObject, eventdata, handles)
% hObject    handle to WBC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WBC


% --- Executes on button press in Small_World.
function Small_World_Callback(hObject, eventdata, handles)
% hObject    handle to Small_World (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Small_World


% --- Executes on button press in Efficiency.
function Efficiency_Callback(hObject, eventdata, handles)
% hObject    handle to Efficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Efficiency



% --- Executes on button press in Cancel.
function Cancel_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off;
close;



% --- Executes on button press in Create_Textfiles.
function Create_Textfiles_Callback(hObject, eventdata, handles)
% hObject    handle to Create_Textfiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global ConnectivityMat;
% n=size(ConnectivityMat);
% for i=1:n(1)
%     
% end


% --- Executes on button press in Deg_Distr.
function Deg_Distr_Callback(hObject, eventdata, handles)
% hObject    handle to Deg_Distr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Deg_Distr


% --- Executes on button press in Modularity.
function Modularity_Callback(hObject, eventdata, handles)
% hObject    handle to Modularity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Modularity

% --- Executes on button press in Spectral_Density.
function Spectral_Density_Callback(hObject, eventdata, handles)
% hObject    handle to Spectral_Density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Spectral_Density




% --- Executes on button press in Select_All.
function Select_All_Callback(hObject, eventdata, handles)
% hObject    handle to Select_All (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Select_All

h = findobj('Tag','Select_All');
SelectAllPos = get(h,'Value');
if SelectAllPos==1
    h = findobj('Tag','Cluster_Coefficient');
    set(h,'Value',1);
    h = findobj('Tag','Char_Path_Length');
    set(h,'Value',1);
    h = findobj('Tag','Small_World');
    set(h,'Value',1);
    h = findobj('Tag','Efficiency');
    set(h,'Value',1);
    h = findobj('Tag','Vulnerability');
    set(h,'Value',1);
    h = findobj('Tag','WBC');
    set(h,'Value',1);
    h = findobj('Tag','Deg_Distr');
    set(h,'Value',1);
    h = findobj('Tag','Spectral_Density');
    set(h,'Value',1);
    h = findobj('Tag','CheckboxTargetAttack');
    set(h,'Value',1);
    h = findobj('Tag','Modularity');
    set(h,'Value',1);
elseif SelectAllPos==0
    h = findobj('Tag','Cluster_Coefficient');
    set(h,'Value',0);
    h = findobj('Tag','Char_Path_Length');
    set(h,'Value',0);
    h = findobj('Tag','Small_World');
    set(h,'Value',0);
    h = findobj('Tag','Efficiency');
    set(h,'Value',0);
    h = findobj('Tag','Vulnerability');
    set(h,'Value',0);
    h = findobj('Tag','WBC');
    set(h,'Value',0);
    h = findobj('Tag','Deg_Distr');
    set(h,'Value',0);
    h = findobj('Tag','Spectral_Density');
    set(h,'Value',0);
    h = findobj('Tag','CheckboxTargetAttack');
    set(h,'Value',0);
    h = findobj('Tag','Modularity');
    set(h,'Value',0);    
end

% --- Executes on button press in CheckBoxBinaryNetwork.
function CheckBoxBinaryNetwork_Callback(hObject, eventdata, handles)
% hObject    handle to CheckBoxBinaryNetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckBoxBinaryNetwork

h = findobj('Tag','CheckboxThresholdRange');
isChecked = get(h,'Value');
if isChecked
   set(hObject,'Value',1); 
end;


function EditManualThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to EditManualThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditManualThreshold as text
%        str2double(get(hObject,'String')) returns contents of EditManualThreshold as a double


% --- Executes during object creation, after setting all properties.
function EditManualThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditManualThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CheckBoxAutomaticThresh.
function CheckBoxAutomaticThresh_Callback(hObject, eventdata, handles)
% hObject    handle to CheckBoxAutomaticThresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckBoxAutomaticThresh
isChecked = get(hObject,'Value');

h = findobj('Tag','CheckboxGlobalThreshold');
GlobalThreshold = get(h,'Value');

h = findobj('Tag','EditManualThreshold');
if isChecked
    set(h,'Enable','off');
else
    if GlobalThreshold
        set(h,'Enable','on');
    end;
end;

% --- Executes on button press in CheckboxGlobalThreshold.
function CheckboxGlobalThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxGlobalThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxGlobalThreshold

isChecked = get(hObject,'Value');

hAutomatic = findobj('Tag','CheckBoxAutomaticThresh');
AutomaticThresh = get(hAutomatic,'Value');

h = findobj('Tag','EditManualThreshold');
if isChecked
    if ~AutomaticThresh
        set(h,'Enable','on');
    end;
    %set(hAutomatic,'Value',1);
else
    set(h,'Enable','off');    
end;

h = findobj('Tag','CheckboxThresholdRange');
isChecked = get(h,'Value');
if isChecked
   set(hObject,'Value',1); 
end;

% --- Executes on button press in CheckboxThresholdRange.
function CheckboxThresholdRange_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxThresholdRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxThresholdRange

isChecked = get(hObject,'Value');

if isChecked
    h = findobj('Tag','CheckBoxAutomaticThresh');
    set(h,'Enable','off');
    set(h,'Value',0);  
    h = findobj('Tag','EditManualThreshold');
    set(h,'Enable','off');
    h = findobj('Tag','CheckboxGlobalThreshold');
    set(h,'Enable','on');
    set(h,'Value',1);
    h = findobj('Tag','CheckBoxBinaryNetwork');
    set(h,'Enable','on'); 
    set(h,'Value',1);
else
    h = findobj('Tag','CheckBoxAutomaticThresh');
    set(h,'Enable','on');
    h = findobj('Tag','CheckboxGlobalThreshold');
    set(h,'Enable','on');
    set(h,'Value',0);
    h = findobj('Tag','CheckBoxBinaryNetwork');
    set(h,'Enable','on');
    set(h,'Value',0);
    h = findobj('Tag','EditManualThreshold');
    set(h,'Enable','off');
end;

% --- Executes on button press in Cancel.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to Cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in CheckboxTargetAttack.
function CheckboxTargetAttack_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxTargetAttack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckboxTargetAttack
% --- Executes on button press in CheckboxUsePositiveValuesOnly.
function CheckboxUsePositiveValuesOnly_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxUsePositiveValuesOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of
% CheckboxUsePositiveValuesOnly

isChecked = get(hObject,'Value');
if isChecked
    h = findobj('Tag','CheckboxUseNegativeValuesOnly');
    set(h,'Enable','off');
    set(h,'Value',0);  
else
    h = findobj('Tag','CheckboxUseNegativeValuesOnly');
    set(h,'Enable','on');
    set(h,'Value',0);
end;

% --- Executes on button press in CheckboxUseNegativeValuesOnly.
function CheckboxUseNegativeValuesOnly_Callback(hObject, eventdata, handles)
% hObject    handle to CheckboxUseNegativeValuesOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of
% CheckboxUseNegativeValuesOnly

isChecked = get(hObject,'Value');
if isChecked
    h = findobj('Tag','CheckboxUsePositiveValuesOnly');
    set(h,'Enable','off');
    set(h,'Value',0);  
else
    h = findobj('Tag','CheckboxUsePositiveValuesOnly');
    set(h,'Enable','on');
    set(h,'Value',0);
end;


% --- Executes on button press in Done.
function Done_Callback(hObject, eventdata, handles)
% hObject    handle to Done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%consider_weights=1;
%%========================
%
% VERY IMPORTANT: The Input Files should contain a struct variable named ConnectMatrix with at least a field named   
%
global FileNamesConnectivityMat Out_dir;

h = findobj('Tag','Cluster_Coefficient');
ClusterPos = get(h,'Value');
h = findobj('Tag','Char_Path_Length');
ShortpathPos = get(h,'Value');
h = findobj('Tag','Small_World');
SmallWorldPos = get(h,'Value');
h = findobj('Tag','Efficiency');
EffPos = get(h,'Value');
h = findobj('Tag','Vulnerability');
VulPos = get(h,'Value');
h = findobj('Tag','WBC');
WBCPos = get(h,'Value');
h = findobj('Tag','Deg_Distr');
DegDPos = get(h,'Value');
% h = findobj('Tag','Spectral_Density');
% SpecDensPos = get(h,'Value');
h = findobj('Tag','CheckboxTargetAttack');
TargetAttackPos = get(h,'Value');
h = findobj('Tag','Modularity');
Modularity = get(h,'Value');
%%
h = findobj('Tag','CheckboxGlobalThreshold');
GlobalThreshold = get(h,'Value');
h = findobj('Tag','CheckBoxAutomaticThresh');
AutomaticThresh = get(h,'Value');
h = findobj('Tag','CheckboxUsePositiveValuesOnly');
UseOnlyPositiveValues = get(h,'Value');
h = findobj('Tag','CheckboxUseNegativeValuesOnly');
UseOnlyNegativeValues = get(h,'Value');
h = findobj('Tag','CheckboxBothHemisphereSeparated');
BothHemisphereSeparated = get(h,'Value');
h = findobj('Tag','CheckBoxBinaryNetwork');
MakeBinary = get(h,'Value');
h = findobj('Tag','CheckboxThresholdRange');
isThresholdRange = get(h,'Value');

InThresh = '';
if GlobalThreshold    
    if ~AutomaticThresh
        h = findobj('Tag','EditManualThreshold');
        InThresh = str2double(get(h,'String'));    
    end;
end;

whichNetProps.ClusterPos = ClusterPos; % Cluster index
whichNetProps.ShortpathPos = ShortpathPos; % Short path property
whichNetProps.SmallWorldPos = SmallWorldPos; % Small World properties
whichNetProps.EffPos = EffPos; % Efficiency
whichNetProps.VulPos = VulPos; % Vulnerability
whichNetProps.WBCPos = WBCPos; % Betweeness centrality.
whichNetProps.DegDPos = DegDPos; % Degree distribution.
whichNetProps.TargetAttackPos =  TargetAttackPos; % Target Attack Analysis
whichNetProps.Modularity = Modularity; % Modularity.

whichOptions.GlobalThreshold = GlobalThreshold ;
whichOptions.AutomaticThresh = AutomaticThresh;
whichOptions.MakeBinary = MakeBinary;
whichOptions.isThresholdRange = isThresholdRange;
whichOptions.BothHemisphereSeparated = BothHemisphereSeparated;
whichOptions.UseOnlyPositiveValues = UseOnlyPositiveValues;
whichOptions.UseOnlyNegativeValues = UseOnlyNegativeValues;

Network_Properties_Computation(FileNamesConnectivityMat,whichNetProps,whichOptions,InThresh,Out_dir);

close;

return;


