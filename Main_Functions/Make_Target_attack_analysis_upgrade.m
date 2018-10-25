function [Nc,thresbins,thres,thresS,bwsort] = Make_Target_attack_analysis_upgrade(ConMatFiles,thres,plotflag,showwaitbar,OutputFolder)

%% This function makes the target attack analysis of the Network for different connectivity matrices.
%
%% Input Parameters:
%    ConMatFiles : Connectivity Matrices Files.
%      thres : Threshold for the Connectivity matrices. If thres = 'auto',
%              the computation is perfomed in a predefined set of thresholds. If 'thres' is not defined or empty 
%              this is taken from the largest component threshold.
%   plotflag : Plotting flag. If plotflag = 1 the results are plotted.
%   showwaitbar : If 'showwaitbar' is not defined or showwaitbar=false the waitbar will not be shown. 
%   OutputFolder : If OutputFolder is defined the results will be saved in this Folder.
%
%% Output Parameters:
%       Nc  : Curve of the largest component normalized in the Network: size(Nc) = [length(thresbins),Nfiles,Nrep,Nthres]     
% thresbins : Sparsity degree's bins used for calculating previous measures.
%     thres : Global threshold used for the study.
%    thresS : Threshold used for each connectivity matrix.
%
%% Lester Melie-Garcia
% La Habana, February 21st, 2014

if exist('ConMatFiles','var')
    if isempty(ConMatFiles)
        ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
    end;
else
     ConMatFiles = spm_select([1,Inf],'mat','Select Connectivity Matrix Files ...','',cd);
end;
if exist('OutputFolder','var')
    if isempty(OutputFolder)
        OutputFolder = uigetdir(cd, 'Select Folder to save Target Attack Analysis Results ...');
    end;
    if ~strcmpi(OutputFolder(end),filesep)
        OutputFolder=[OutputFolder,filesep];
    end;
    saveResults = true;
else
    saveResults = false;
end;
if ~exist('showwaitbar','var')
    showwaitbar = false;
end;
if ischar(ConMatFiles)
    Nfiles = size(ConMatFiles,1);
    ConMatT = cell(Nfiles,1);
    FileNames = cell(Nfiles,1);
    for i=1:Nfiles
        ConMatTemp = load(deblank(ConMatFiles(i,:)));
        ConMatT{i} = ConMatTemp.ConnectMatrix;
        [FilePath,FileNames{i}] = fileparts(deblank(ConMatFiles(i,:)));
    end;
else
    Nfiles = 1;  % This is the case where ConMatFiles is a numeric variable with the connectivity matrix.
    ConMatT{1}.ConMat = ConMatFiles;
    FileNames{1} = 'ConMat_coming_from_Network_Properties_Program';
end;

Nrep = size(ConMatT{1}.ConMat,3);
if (~exist('thres','var'))||(isempty(thres))  
    thresC = zeros(Nfiles,Nrep);
    thresS = zeros(Nfiles,Nrep); 
    disp('Calculating Largest component in all repetitions ...');
    for i=1:Nfiles
        ConMat = ConMatT{i}.ConMat;
        [Nc,thresC(i,:),thresS(i,:)] = Netlargest_comp(ConMat,true);
    end;
    thres = min(thresS(:));
    disp('Calculating Largest component in all repetitions ...  Done !');
else
    if ischar(thres)&&(~isempty(thres))
        thres = 50:2:96;  % Threshold range used in Network Properties computation.
    end;
    thresS = 0; thresC = 0; %#ok
end;

[Nc,thresbins] = Target_attack_analysis(ConMatT{1}.ConMat(:,:,1),thres(1)); % This step is just for taking the length of thresbins variable.
Nthres = length(thres);
Nc = zeros(length(thresbins),Nrep,Nthres,Nfiles);
bwsort = zeros(length(thresbins),Nrep,Nthres,Nfiles);
if showwaitbar
    H = waitbar(0,'Processing ...: Repetition ','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    NTotal = Nfiles*Nrep*Nthres;
    StringNRep = num2str(NTotal);
    for i=1:Nfiles
        disp(['Target Attack analysis in Group: ', FileNames{i}]);
        for k=1:Nthres
            for j=1:Nrep
                waitbar(((i-1)*Nrep*Nthres+(k-1)*Nrep + j)/NTotal,H, ['Target Attack analysis ...: Step ' num2str(((i-1)*Nrep*Nthres+(k-1)*Nrep + j)) ' of ' StringNRep]);
                ConMat = ConMatT{i}.ConMat(:,:,j);
                [Nc(:,j,k,i),t,bwsort(:,j,k,i)] = Target_attack_analysis(ConMat,thres(k));
            end;
        end;
        disp(['Target Attack analysis in Group: ', FileNames{i},'  ... Done !']);
    end;
    close(H);
else
    for i=1:Nfiles  % This is to be invoked by 'Network_Properties' function.
        for k=1:Nthres
            for j=1:Nrep
                ConMat = ConMatT{i}.ConMat(:,:,j);
                [Nc(:,j,k,i),t,bwsort(:,j,k,i)] = Target_attack_analysis(ConMat,thres(k));
            end;
        end;
    end;
end;
if exist('plotflag','var')&&plotflag
    if Nthres>1
        X = mean(Nc,3);
        if Nfiles>1
            Ncmean = squeeze(mean(X,2));
            Ncstd = squeeze(std(X,0,2));
            %Ncmean = squeeze(mean(X,3))';
            %Ncstd = squeeze(std(X,0,3))';
        else
            Ncmean = squeeze(mean(X,2));
            Ncstd = squeeze(std(X,0,2));
        end;
        %thresbins = repmat(thres(:),[1,Nfiles]);
        thresbins = repmat(thresbins(:),[1,Nfiles]);
    else
        Ncmean = 0;
        Ncstd =  0;
        thresbins = repmat(thresbins(:),[1,Nfiles]);
    end;
    subsampling = 1; error_bar_flag = false;
    Plot_Target_attack_analysis_upgrade(Ncmean,Ncstd,thresbins,FileNames,subsampling,error_bar_flag);
    %Plot_Target_attack_analysis(Nc,thresbins,FileNames);
end;
% if saveResults
%     for i=1:Nfiles
%         NetProps.thresh = thres;
%         NetProps.ThresBins = thres;
%         NetProps.TargetAttack = squeeze(Nc(:,:,:,i));
%         NetProps.TargetAttackthresbins = thresbins;        
%         NetProps.ConMat = ConMatT{i}.ConMat;
%         NetProps.NHemispheres = 2;
%         if isfield(ConMatT{i},'Structures')
%             NetProps.Structures = ConMatT{i}.Structures;
%         end;
%         NetProps.date = date;
%         NetProps.info = 'Target Attack Analysis run independently from Network_Properties function';
%         NetProps.Name = FileNames{i};
%         TAOutputFile = [OutputFolder,FileNames{i},'_Target_Attack.mat'];
%         save(TAOutputFile,'NetProps'); % saving results.
%     end;
% end;

return;