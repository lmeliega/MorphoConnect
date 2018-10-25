function Export2_BrainNet_Nodal_Centrality(thres,NetProps,Structures,Centroids,OutputFile)

%% This function exports the betweenness centrality attribute.
%  This can be used for plotting hubs structures using the input parameter 'thres' for instance: thres = 1.5 or 2.0.  
%
% Input Parametes:
%        thres : This defines the threshold for plotting. 
%     NetProps : Network properties Files.
%   Structures : Filename or Struct with the anatomical structures' information.
%    Centroids : Filename or matrix providing the centroid information of the anatomical structures.
%   OutputFile : Output Filename (*.node)
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
if exist('Structures','var')
    if isempty(Structures)
        Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
    end;
else
     Structures = spm_select(1,'cod','Select Structures Code File ...','',cd);
end;
if ischar(Structures)
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
if exist('OutputFile','var')
    if isempty(OutputFile)
        [OutputFile, OutputFilePath] = uiputfile('*.node', 'Save BrainNet File as');
        OutputFile = [OutputFile,OutputFilePath];
    end;
else
     [OutputFile, OutputFilePath] = uiputfile('*.node', 'Save BrainNet File as');
     OutputFile = [OutputFilePath,OutputFile];
end;
if ~exist('thres','var')
    thres = 0;
end;

Nfiles = size(NetProps,1);
if ischar(NetProps)
    for i=1:Nfiles
        NetPropsTemp = load(deblank(NetProps(i,:)));
        NetPropsT{i} = NetPropsTemp.NetProps; %#ok 
    end;    
    NetProps = NetPropsT;
end;

N = length(NetProps{1}.CentrBetNorm);
bwc = zeros(N,Nfiles);
ind = zeros(N,Nfiles);
for i=1:Nfiles
    bwc(:,i) = NetProps{i}.CentrBetNorm';
    ind(:,i) = bwc(:,i)>=thres;
end;

ind = prod(ind,2); ind = logical(ind);
r = 1:N;
ind = r(ind); 

if Nfiles>1
    bwc = mean(bwc,2);
end;

fid = fopen(OutputFile,'wt');
Ns = length(ind);
Text2File = cell(Ns,1);
node_color = 4;
CC = node_color*ones(Ns,1);

for i=1:Ns
    Text2File{i} =[num2str(Centroids(ind(i),1)),' ',num2str(Centroids(ind(i),2)),' ',num2str(Centroids(ind(i),3)),' ', ...
                   num2str(CC(i)),' ',num2str(bwc(ind(i))),' ',Structures(ind(i)).Name];    
end;
for i=1:Ns
    fprintf(fid,'%s  \r',Text2File{i});
end;

fclose(fid);

return;

