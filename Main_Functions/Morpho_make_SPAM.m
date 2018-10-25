function [SPAM,MaxPro] = Morpho_make_SPAM(StructureLabelsFiles,StructureCodesFile,SPAMOutputDir,FlagSaveFiles)

% This function computes the SPAMs and Maximum Probability maps in the
% Cortical Surface.
%
% Input Parameters:
%    StructureLabelsFiles : Names of the Label Files (text File)
%    StructureCodesFile : File with structure codes and names. (*.cod)
%    SPAMOutputDir : Directory where SPAMs will be saved.
%    FlagSaveFiles : Flag that defines if the SPAMs and MaxPro Maps will be
%                    saved.
%
% Output Parameters:
%     SPAM : SPAMs for the structures defined in the Code File. 
%     MaxPro : Maximum Probability map
%  
% Lester Melie-Garcia
% Cuban Neuroscience Center
% October 3rd 2008

if isempty(StructureLabelsFiles)
    dir = cd;
    StructureLabelsFiles = spm_select([1 Inf],'txt','Selecting Cortical Label Files','',dir);
end;
if isempty(StructureCodesFile)
    dir = cd;
    StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
end;
if FlagSaveFiles
    if isempty(SPAMOutputDir)
        dir = cd;
        SPAMOutputDir = spm_select(1,'dir','Select directory to save SPAMs files ...','',dir);
    end;
    if SPAMOutputDir(end)~=filesep  % To be sure the last character is the file separator
        SPAMOutputDir = [SPAMOutputDir filesep];
    end;
end;

NSubj = size(StructureLabelsFiles,1)/2;
Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
% Reading Labels
S = load(StructureLabelsFiles(1,:));
Np = length(S); % Number of points in a surface of one hemisphere
Atlases = zeros(2*Np,NSubj);
% Reading Cortical Label Files 
for i=1:NSubj
    disp(['Reading Labels Subject ' num2str(i) ' of ' num2str(NSubj)]);
    Sleft = load(StructureLabelsFiles(2*i-1,:));
    Sright = load(StructureLabelsFiles(2*i,:));
    Atlases(:,i) = [Sleft;Sright]; 
end;
% Making SPAMs
Codes = zeros(NStruct,1);
SPAM = zeros(2*Np,NStruct);
for i=1:NStruct
    disp(['Making SPAM for: Structure ' num2str(i) ', ' Structures(i).Name]);
    ind = Atlases==Structures(i).Code;
    SPAM(:,i) = sum(ind,2)./NSubj;
    Codes(i) = Structures(i).Code;
    if FlagSaveFiles        
        padding_zeros = '';
        if Codes(i)<10
            padding_zeros = '000';
        end;
        if (Codes(i)>=10)&&(Codes(i)<100)
            padding_zeros = '00';
        end;
        if (Codes(i)>=100)&&(Codes(i)<1000)
            padding_zeros = '0';
        end;        
        NewNameStruct = [padding_zeros,num2str(Codes(i)),'_',Structures(i).Name];
        indblank = findstr(NewNameStruct,' ');
        NewNameStruct(indblank)='_';
        T = SPAM(:,i);
        eval(['save ' SPAMOutputDir NewNameStruct '.txt T -ascii']);
    end;
end;
[Pmax,ind] = max(SPAM,[],2); 
MaxPro = Codes(ind);  % MaxPro Map
if FlagSaveFiles
    OutputSPAMFile = [SPAMOutputDir 'SPAM_' num2str(NStruct) '_struct.mat'];
    save(OutputSPAMFile,'SPAM','Structures');
    OutputMaxProFile = [SPAMOutputDir 'MaxPro_' num2str(NStruct) '_struct.mat'];
    save(OutputMaxProFile,'MaxPro','Structures');
    OutputMaxProFileTxT = [SPAMOutputDir 'MaxPro_' num2str(NStruct) '_struct.txt'];
    eval(['save ' OutputMaxProFileTxT ' MaxPro -ascii']);
end;
return;
