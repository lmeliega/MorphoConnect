function Export2_BrainNet_Nodal_Centrality_more(thres,NetProps,Structures,Centroids,OutputFolder)

%% This function exports the normalized betweenness centrality attribute to BrainNet Visualizer program format. 
%  The coincident structures among Files are labeled with the same
% color. This can be used for plotting hubs using the input parameter 'thres' for instance thres = 1.5 or 2.0.  
%
% Input Parametes:
%        thres : This defines the threshold for plotting. 
%     NetProps : Network properties Files.
%   Structures :  Filename or Struct with the anatomical structures' information.
%    Centroids : Filename or matrix providing the centroid information of the anatomical structures.
%   OutputFolder : Output Folder where Brainnet files will be saved (*.node)
%
%% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% November 28th, 2012.

if exist('NetProps','var')
    if isempty(NetProps)
        NetProps = spm_select([1,Inf],'mat','Select NetProps File ...','',cd);
    end;
else
     NetProps = spm_select([1,Inf],'mat','Select NetProps File ...','',cd);
end;
if ~exist('Structures','var')
    Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
end;
if ischar(Structures)&&(~isempty(Structures))
    Structures = ReadCodeFile(Structures);
end;
if exist('Centroids','var')
    if isempty(Centroids)
        Centroids = spm_select(1,'txt','Select Parcellation Centroid File ...','',cd);
    end;
else
     Centroids = spm_select(1,'txt','Select Parcellation Centroid File ...','',cd);
end;
if ischar(Centroids)
    Centroids = load(Centroids);
end;
if exist('OutputFolder','var')
    if isempty(OutputFolder)
        OutputFolder = uigetdir(cd, 'Select Folder to save BrainNet Files');
    end;
else
    OutputFolder = uigetdir(cd, 'Select Folder to save BrainNet Files');
end;
if ~strcmpi(OutputFolder(end),filesep)
    OutputFolder=[OutputFolder,filesep];    
end;
if ~exist('thres','var')
    thres = 0;
end;
Nfiles = size(NetProps,1);
NetPropsT = cell(Nfiles,1);
if ischar(NetProps)
    for i=1:Nfiles
        NetPropsTemp = load(deblank(NetProps(i,:)));
        NetPropsT{i} = NetPropsTemp.NetProps; 
    end;    
end;

if isempty(Structures)
    Structures = NetPropsT{1}.Structures;
end;

N = size(NetPropsT{1}.CentrBetNorm,1);
bwc = zeros(N,Nfiles);
ind = zeros(N,Nfiles);
for i=1:Nfiles
    bwc_t = mean(mean(NetPropsT{i}.CentrBetNorm,3),2);
    bwc(:,i) = bwc_t(:);
    ind(:,i) = bwc(:,i)>=thres;
end;

ind_joint = prod(ind,2); ind_joint = logical(ind_joint);
ind_joint = find(ind_joint); 

if ~isempty(ind_joint)
    if Nfiles>1
        bwc_joint = mean(bwc,2);
        OutputFile = [OutputFolder,'Coincident_Hubs.node'];
    else
        bwc_joint = bwc;
        [FilePath_temp,FileName_temp] = fileparts(deblank(NetProps(1,:)));
        OutputFile = [OutputFolder,FileName_temp,'.node'];
    end;    
    fid = fopen(OutputFile,'wt');
    Ns = length(ind_joint);
    Text2File = cell(Ns,1);
    node_basecolor = 5;
    CC = node_basecolor*ones(Ns,1);
    for i=1:Ns
        Text2File{i} =[num2str(Centroids(ind_joint(i),1)),' ',num2str(Centroids(ind_joint(i),2)),' ',num2str(Centroids(ind_joint(i),3)),' ', ...
                       num2str(CC(i)),' ',num2str(bwc_joint(ind_joint(i))),' ',Structures(ind_joint(i)).Name];
    end;
    for i=1:Ns
        fprintf(fid,'%s  \r',Text2File{i});
    end;    
    fclose(fid);
    
    if Nfiles>1
        for j=1:Nfiles
            [FilePath_temp,FileName_temp] = fileparts(deblank(NetProps(j,:)));
            OutputFile = [OutputFolder,FileName_temp,'_BC_Node_Props.node'];            %%
            fid = fopen(OutputFile,'wt');
            indj = find(ind(:,j));
            bwcj = bwc(:,j);
            Ns = length(indj);
            Text2File = cell(Ns,1);
            node_color = j + node_basecolor;
            CC = node_color*ones(N,1);
            CC(ind_joint) = node_basecolor;
            CC = CC(indj);
            Centroids(:,3) = Centroids(:,3);
            for i=1:Ns
                Text2File{i} =[num2str(Centroids(indj(i),1)),' ',num2str(Centroids(indj(i),2)),' ',num2str(Centroids(indj(i),3)),' ', ...
                               num2str(CC(i)),' ',num2str(bwcj(indj(i))),' ',Structures(indj(i)).Name];
            end;
            for i=1:Ns
                fprintf(fid,'%s  \r',Text2File{i});
            end;            
            fclose(fid);
        end;
    end;
else
    warndlg('There are no coincident structures between Nodal Network Properties Files ....', 'Warning Dialog');
end;

return;

