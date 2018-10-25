function varargout = MorphoConnect(varargin)
% MORPHOCONNECT M-file for MorphoConnect.fig
%      MORPHOCONNECT, by itself, creates a new MORPHOCONNECT or raises the existing
%      singleton*.
%
%      H = MORPHOCONNECT returns the handle to a new MORPHOCONNECT or the handle to
%      the existing singleton*.
%
%      MORPHOCONNECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORPHOCONNECT.M with the given input arguments.
%
%      MORPHOCONNECT('Property','Value',...) creates a new MORPHOCONNECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MorphoConnect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MorphoConnect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MorphoConnect

% Last Modified by GUIDE v2.5 01-Mar-2017 13:46:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MorphoConnect_OpeningFcn, ...
                   'gui_OutputFcn',  @MorphoConnect_OutputFcn, ...
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

% --- Executes just before MorphoConnect is made visible.
function MorphoConnect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MorphoConnect (see VARARGIN)

% Choose default command line output for MorphoConnect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Data = imread('logo_morpho04.JPG');
Data = imread('logo_morpho02_01.jpg');
h = findobj('Tag','axes1');
%image(Data)
imshow(Data);
% UIWAIT makes MorphoConnect wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = MorphoConnect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function Preprocessing_Callback(hObject, eventdata, handles)
% hObject    handle to Preprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Copying_Data_Files_Callback(hObject, eventdata, handles)
% hObject    handle to Copying_Data_Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Preprocessing_Moving_Files.fig;

% --------------------------------------------------------------------
function Make_SPAMs_MaxPro_Callback(hObject, eventdata, handles)
% hObject    handle to Make_SPAMs_MaxPro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Make_SPAMs_GUI.fig

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Connectivity_Using_Cortical_Thickness_vertex_Callback(hObject, eventdata, handles)
% hObject    handle to Connectivity_Using_Cortical_Thickness_vertex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Connectivity.fig;

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);

% --------------------------------------------------------------------
function Connectivity_Using_mean_Cortical_Thickness_for_regions_Callback(hObject, eventdata, handles)
% hObject    handle to Connectivity_Using_mean_Cortical_Thickness_for_regions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Connectivity_Using_Cortical_Thickness.fig;

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','Edit_Cortical_Thickness_Files');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonThicknessFiles');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
set(h,'Enable','off');

h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','EditBootstrapFile');
set(h,'Enable','off');
h = findobj('Tag','PushbuttonBootstrapFile');
set(h,'Enable','off')


% --------------------------------------------------------------------
function Connectivity_Using_Structure_Volumes_Areas_Callback(hObject, eventdata, handles)
% hObject    handle to Connectivity_Using_Structure_Volumes_Areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Connectivity.fig

h = findobj('Tag','Edit_StructuresVolumesFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructVolsFile');
set(h,'Enable','on');

h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);
h = findobj('Tag','Edit_Cortical_Labels');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonCorticalLabels');
set(h,'Enable','off');
h = findobj('Tag','Edit_StructuresMeanThicknessFile');
set(h,'Enable','on');
h = findobj('Tag','BrowseButtonStructMeanThicnessFile');
set(h,'Enable','on');
h = findobj('Tag', 'PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag', 'EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','EditIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIndexStructures');
set(h,'Enable','off');
h = findobj('Tag','EditListSubjects');
set(h,'Enable','on');
h = findobj('Tag','PushButtonListSubjects');
set(h,'Enable','on');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','PushButtonIntracranealVolume');
set(h,'Enable','off');

h = findobj('Tag', 'CheckboxBootstrapConnectMatrix');
set(h,'Enable','off');
h = findobj('Tag','EditNBootstrap');
set(h,'Enable','off');
h = findobj('Tag','TextNumberofBoostraps');
set(h,'Enable','off');
h = findobj('Tag','EditNSubjects');
set(h,'Enable','off');
h = findobj('Tag','TextNSubjects');
set(h,'Enable','off');

h = findobj('Tag','RadiobuttonSaveBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','RadiobuttonLoadBootstrapSamples');
set(h,'Enable','off');
set(h,'Value',0);
h = findobj('Tag','EditBootstrapFile');
set(h,'Enable','off');
h = findobj('Tag','PushbuttonBootstrapFile');
set(h,'Enable','off')
h = findobj('Tag','Checkbox_Sampling_With_Replacement');
set(h,'Enable','off');
h = findobj('Tag','Checkbox_Dependent_Samples');
set(h,'Enable','off');
% --- Executes on button press in PushbuttonMovingFiles.
function PushbuttonMovingFiles_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonMovingFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Morpho_Preprocessing_Moving_Files.fig;

% --- Executes on button press in PushbuttonNetworkProperties.
function PushbuttonNetworkProperties_Callback(hObject, eventdata, handles)
% hObject    handle to PushbuttonNetworkProperties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Network_Properties.fig;

% --- Executes on button press in PushButtonMeanVolumeSPAMs.
function PushButtonMeanVolumeSPAMs_Callback(hObject, eventdata, handles)
% hObject    handle to PushButtonMeanVolumeSPAMs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Preprocessing_Make_Volume_using_SPAM.fig;
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

% --------------------------------------------------------------------
function Connectivity_Fusing_Morphological_Descriptors_Callback(hObject, eventdata, handles)
% hObject    handle to Connectivity_Fusing_Morphological_Descriptors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Connectivity_Variables_Fusion.fig;
h = findobj('Tag', 'radiobutton8');
set(h,'Value',1);
set(h,'ForegroundColor',[1 0 0]);

h = findobj('Tag','BrowseAllMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','EditGlobalMeanThicknessFile');
set(h,'Enable','off');
h = findobj('Tag','BrowseButtonIntracranealVolume');
set(h,'Enable','off');
h = findobj('Tag','EditIntracranealVolume');
set(h,'Enable','off');
% --------------------------------------------------------------------
function Preprocessing_Mean_Thickness_Volumes_Areas_Callback(hObject, eventdata, handles)
% hObject    handle to Preprocessing_Mean_Thickness_Volumes_Areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Preprocessing_Make_ThicknessFile.fig;
%set(hObject,'Value',1);

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
% --------------------------------------------------------------------
function Mean_Volumes_using_SPAMs_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_Volumes_using_SPAMs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Preprocessing_Make_Volume_using_SPAM.fig;
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
% --------------------------------------------------------------------
function Statistic_HotellingT2_T_test_Callback(hObject, eventdata, handles)
% hObject    handle to Statistic_HotellingT2_T_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats.fig;

% --------------------------------------------------------------------
function Permutation_T_test_NetProps_Callback(hObject, eventdata, handles)
% hObject    handle to Permutation_T_test_NetProps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats_Permutations.fig;

% --------------------------------------------------------------------
function Permutation_Area_NetPros_Callback(hObject, eventdata, handles)
% hObject    handle to Permutation_Area_NetPros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats_plus_Area_Permutations.fig;

% --------------------------------------------------------------------
function Compare_two_Groups_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_two_Groups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats_compare_groups.fig;

% --------------------------------------------------------------------
function Network_Properties_Callback(hObject, eventdata, handles)
% hObject    handle to Network_Properties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Network_Properties.fig;

% --------------------------------------------------------------------
function Make_Connections_List_Callback(hObject, eventdata, handles)
% hObject    handle to Make_Connections_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Connections_List_Generation.fig;

h = findobj('Tag','EditThreshold');
set(h,'Enable','off');
h = findobj('Tag','EditNumberofConnections');
set(h,'Enable','on');

% --------------------------------------------------------------------
function Make_Nodal_Properties_List_Callback(hObject, eventdata, handles)
% hObject    handle to Make_Nodal_Properties_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Nodal_Props_List_Generation.fig;

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_to_Files.fig;

% --------------------------------------------------------------------
function Visualization_Surface_Maps_T_Maps_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Surface_Maps_T_Maps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Visualization.fig;

% --------------------------------------------------------------------
function Visualization_Connectivity_Matrices_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Connectivity_Matrices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Visualization_ConnectMatrix.fig

% --------------------------------------------------------------------
function Visualization_Network_Properties_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Network_Properties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Graphs.fig;

% --------------------------------------------------------------------
function Visualization_Connectivity_Matrix_Statistic_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Connectivity_Matrix_Statistic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Visualization_NetProps_DistancesHist.fig;

% --------------------------------------------------------------------
function Visualization_Network_Properties_Statistic_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Network_Properties_Statistic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_View_NetProps_Stats.fig;

% --------------------------------------------------------------------
function Visualization_Saving_to_Visualization_in_BrainBow_Callback(hObject, eventdata, handles)
% hObject    handle to Visualization_Saving_to_Visualization_in_BrainBow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_save2Brainbow_Interface.fig;

% --------------------------------------------------------------------
function Compare_more_than_two_groups_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_more_than_two_groups (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats_compare_N_groups_GUI.fig;

% --------------------------------------------------------------------
function Reduce_Data_Matrix_Callback(hObject, eventdata, handles)
% hObject    handle to Reduce_Data_Matrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Reduce_Data_Matrix_GUI.fig;

% --------------------------------------------------------------------
function Make_Coincident_Nodal_Properties_List_Callback(hObject, eventdata, handles)
% hObject    handle to Make_Coincident_Nodal_Properties_List (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Make_N_Coincident_NodalPropsList_GUI.fig;

% --------------------------------------------------------------------
function Make_list_of_Coincident_Connections_Callback(hObject, eventdata, handles)
% hObject    handle to Make_list_of_Coincident_Connections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Coincident_Connections_List_Generation.fig;

% --------------------------------------------------------------------
function Make_Morpho_FunctionalDataFile_Callback(hObject, eventdata, handles)
% hObject    handle to Make_Morpho_FunctionalDataFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Make_Data_File_GUI.fig;

% --------------------------------------------------------------------
function ExtractFreeSurfer_Statistics_Callback(hObject, eventdata, handles)
% hObject    handle to ExtractFreeSurfer_Statistics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_GetFreeSurferStatisticsGUI.fig;

% --------------------------------------------------------------------
function Compare_two_Connect_Matrices_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_two_Connect_Matrices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_ConnectMatrices_Stats_GUI.fig;

% --------------------------------------------------------------------
function Make_List_Callosal_connections_Callback(hObject, eventdata, handles)
% hObject    handle to Make_List_Callosal_connections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Callosal_Connections_List_Generation.fig;

% --------------------------------------------------------------------
function Compare_two_Groups_Bootstrap_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_two_Groups_Bootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetProps_Stats_compare_groups_bootstrap.fig;

% --------------------------------------------------------------------
function Export_Areas_under_Netprop_Curves_Callback(hObject, eventdata, handles)
% hObject    handle to Export_Areas_under_Netprop_Curves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Network_Props_Area_Computation_GUI.fig;

% --------------------------------------------------------------------
function Export_Areas_under_Netprop_Curves_XLS_Callback(hObject, eventdata, handles)
% hObject    handle to Export_Areas_under_Netprop_Curves_XLS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Network_Props_Area_Computation2XLS_GUI.fig;
% h = findobj('Tag','Checkbox_Save_All_in_One');
% set(h,'Value',true);

% --------------------------------------------------------------------
function Statistics_Nodal_Network_Properties_Callback(hObject, eventdata, handles)
% hObject    handle to Statistics_Nodal_Network_Properties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Nodal_NetProps_Statistics_GUI.fig;

% --------------------------------------------------------------------
function Merge_NetProps_Files_Callback(hObject, eventdata, handles)
% hObject    handle to Merge_NetProps_Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Merge_NetProps_Files.fig;

% --------------------------------------------------------------------
function Merge_ConMats_Files_Callback(hObject, eventdata, handles)
% hObject    handle to Merge_ConMats_Files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Merge_ConMats_Files.fig;

% --------------------------------------------------------------------
function Export_Nodal_NetProps2BrainNet_Callback(hObject, eventdata, handles)
% hObject    handle to Export_Nodal_NetProps2BrainNet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open  Morpho_Export2BrainNet_Nodal_Properties_GUI.fig;

% --------------------------------------------------------------------
function Export2BrainNet_ConMats_Callback(hObject, eventdata, handles)
% hObject    handle to Export2BrainNet_ConMats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Export2BrainNet_ConnectMatrix_GUI.fig;

% --------------------------------------------------------------------
function Export2BrainNetCoincidentHubs_Callback(hObject, eventdata, handles)
% hObject    handle to Export2BrainNetCoincidentHubs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Export2_BrainNet_Nodal_Centrality_GUI.fig;

% --------------------------------------------------------------------
function Target_Attack_Analysis_Callback(hObject, eventdata, handles)
% hObject    handle to Target_Attack_Analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_Target_Attack_Analysis_GUI.fig;


% --------------------------------------------------------------------
function Compare_two_Groups_two_Conditions_Bootstrap_Callback(hObject, eventdata, handles)
% hObject    handle to Compare_two_Groups_two_Conditions_Bootstrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open Morpho_NetPropsStats_compare_groups_conds_bootstrap.fig
