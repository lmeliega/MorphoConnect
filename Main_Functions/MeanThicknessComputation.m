function Y = MeanThicknessComputation(Y,StructureCodesFile,isSPAMCorrectionNeeded,CorticalLabelFiles,SPAMList)

% This function calculates the mean Thickness for each structure. This
% volume can be corrected by the uncertainty of each cortex vertex to
% belong to a particular cortical structure (SPAM Maps).
%  
% Input Parameters:
%      Y : Matrix Data. size(Y) = NFiles x Npoints
%      StructureCodesFile : File with the Structure codes. (*.cod)
%      SPAMList : List of SPAMs previuosly calculated. If it is empty or
%                 not defined the SPAMs are calculate internally.
%
%      CorticalLabelFiles : Names of the Files with the Cortical Segmentation.
%  
% Output Parameters:      
%      Y : Mean Thickness for each cortical structure defined in
%          the input file 'StructureCodesFile'. size(Y) = NFiles x NStruct
%
%
% Lester Melie-Garcia
% Cuban Neuroscience Center
% Havana, 25 October, 2008

if nargin<5
   isSPAMCalculated = false;
else
   isSPAMCalculated = true;
end;

NFiles = size(Y,1);
Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
AllMeanThickness = zeros(NFiles,NStruct);
H = waitbar(0,'Mean Thickness by Structure Calculation','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
StringNFiles = num2str(NFiles);
if isSPAMCorrectionNeeded
    disp('-- Doing SPAMs Correction ...');
    if isSPAMCalculated
        SPAMs = MakeSPAMMatrixfromFiles(SPAMList,StructureCodesFile);
    else
        SPAMs = Morpho_make_SPAM(CorticalLabelFiles,StructureCodesFile,'',0); % dim(SPAMs) = Np x NStruct
    end;    
    for i=1:NFiles
        waitbar(i/NFiles,H, ['Mean Thickness by Structure Calculation: Subject  ' num2str(i) ' of ' StringNFiles]);
        for j=1:NStruct
            ind = SPAMs(:,j)~=0;
            AllMeanThickness(i,j)= sum(Y(i,ind).*SPAMs(ind,j)')./sum(SPAMs(ind,j));
        end;
    end;
else
    SubjectLabels = ReadingCIVETData(CorticalLabelFiles);
    for i=1:NFiles
        waitbar(i/NFiles,H, ['Mean Thickness by Structure Calculation: Subject  ' num2str(i) ' of ' StringNFiles]);
        for j=1:NStruct
            ind = SubjectLabels(i,:)==Structures(j).Code;
            AllMeanThickness(i,j)= mean(Y(i,ind));
            %AllMeanThickness(i,j)= sum(Y(i,ind));
        end;
    end;
end;

Y = AllMeanThickness; %#ok
close(H);

return;
