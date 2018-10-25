function Morpho_save2Brainbow(ConMat,NetProps,BrainbowOutputFile,Structures,NCon,NNodes)


% Lester Melie Garcia
% Cuban Neuroscience Center
% February, 24th, 2010

if isfield(ConMat,'Structures')||isfield(NetProps,'Structures')
    if ~isempty(ConMat)
        Structures = ConMat.Structures;
    end;
    if ~isempty(NetProps)
        Structures = NetProps.Structures;
    end;    
end;

if ~isempty(ConMat)
    ConMat = mean(abs(ConMat.ConMat),3);
    if ispc
        fid = fopen(BrainbowOutputFile,'wt');
    else
        fid = fopen(BrainbowOutputFile,'w');
    end;
    isWeakestConnections = false; isBinary = false;
    [Conn,indi,indj] = Morpho_Extract_N_connections(ConMat, NCon, isBinary, isWeakestConnections);
    for i=1:length(Conn)
        if ConMat(indi(i),indj(i))~= 0
            fprintf(fid, '%3i %3i %6.2f \n', [Structures(indi(i)).Code,Structures(indj(i)).Code,ConMat(indi(i),indj(i))]);
        end;
    end;
    fclose(fid);
end;

if ~isempty(NetProps)
    [OutputFilePath,OutputFileName,OutputFileExt] =  fileparts(BrainbowOutputFile);
    if isfield(NetProps,'NodalEfficiency')
        Props = NetProps.NodalEfficiency;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_NodalEfficiency',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);
    end;
    if isfield(NetProps,'VulnerabilityMat')
        Props = NetProps.VulnerabilityMat;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Vulnerability',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);        
    end;
    if isfield(NetProps,'CentrBet')
        Props = NetProps.CentrBet;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Centrality',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);        
    end;
    if isfield(NetProps,'MostConnect')
        Props = NetProps.MostConnect;
        Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);        
    end;
    if isfield(NetProps,'NodeConnection')
        Props = NetProps.NodeConnection;
        Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_Connection_strenght',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);         
    end;
    if isfield(NetProps,'NodalClux')
        Props = NetProps.NodalClux;
        Props = sum(squeeze(mean(Props,2)),2); Props = Props(:);
        [P,ind] = SortNodes(Props,NNodes);
        OutputFile_NodalProp = [OutputFilePath,filesep,OutputFileName,'_NodalClusterIndex',OutputFileExt];
        if ispc
            fid = fopen(OutputFile_NodalProp,'wt');
        else
            fid = fopen(OutputFile_NodalProp,'w');
        end;
        for i=1:length(P)
            fprintf(fid, '%3i %6.2f \n', [Structures(ind(i)).Code,P(i)]);
        end;
        fclose(fid);        
    end;
end;

return;

% ---------------- Internal functions  ------------------% 
function [P,indN] = SortNodes(Props,NNodes)

Props = Props(:);
[P,indN] = sort(Props,1,'descend');
thres = P(NNodes);
indt = (P>=thres);
P = P(indt);
indN = indN(indt);

return;
