function Stats = Nodal_Props_Stats(NetPropsFiles,pval,ispaired,OutputFile)

%% This function performs the Statistics for Nodal Network properties.
%
%% Input Parameters:
%    NetPropsFiles : Network Properties Files.
%    pval: threshold for the test significance before multiple comparissons correction.
%  ispaired : flag for performing paired, two-sided test between matched samples or independent samples.
%  OutputFile: File where Results will be saved.
%
%% Output Parameters:
%    Stats : Statistic Results.
%
%% Lester Melie-Garcia
% February 11th, 2014.
%%
if exist('NetPropsFiles','var')
    if isempty(NetPropsFiles)
        NetPropsFiles = spm_select([1,Inf],'mat','Select Network Properties Files ...','',cd);
    end;
else
     NetPropsFiles = spm_select([1,Inf],'mat','Select Network Properties Files ...','',cd);
end;
if  exist('pval','var')
    if isempty(pval)
        pval = 0.05; % Default value
    end;
else
    pval = 0.05; % Default value
end;
if exist('OutputFile','var')
    if isempty(OutputFile)
        [OutputFile,OutPathName] = uiputfile('*.mat', 'File to save Statistic ...');
        OutputFile = [OutPathName,OutputFile];
    end;
else
    [OutputFile,OutPathName] = uiputfile('*.mat', 'File to save Statistic ...');
     OutputFile = [OutPathName,OutputFile];
end;

Ngroups = size(NetPropsFiles,1); % Number of groups
NetPropsT = cell(Ngroups,1);
FileNames = cell(Ngroups,1);

for i=1:Ngroups
    NetPropsTemp = load(deblank(NetPropsFiles(i,:)));
    NetPropsT{i} = NetPropsTemp.NetProps;
    [FilePath,FileNames{i}] = fileparts(deblank(NetPropsFiles(i,:)));
end;

NStruct = length(NetPropsT{1}.Structures);
Nthres = length(NetPropsT{1}.ThresBins); % Number of sparsity degree values where the statistic will be performed.
PTimes = 0.98;  % Percent of times the differences should be significant along sparsity degrees Nthres
Ncomp = nchoosek(Ngroups,2); % Number of tests between pair of groups.
pthres = pval/(NStruct*Nthres*Ncomp); % For Bonferroni correction taking into account: number of tests, number of structures and number of .

%% Finding the Largest components for Connectivity matrices.  .. for future specification of the computation
%
% Largest = zeros(NetPropsT{1}.Nboot,Ngroups);
% for i=1:Ngroups
%     [Nc,thresC,thresS,thresAve,thresbins,thresS_course] = Netlargest_comp(NetPropsT{i}.ConMat);
%     Largest(:,i) = thresS_course(:);
% end;
% bins = flipud(unique(Largest(:)));
% XL = zeros(length(bins),Ngroups);
% Nth = NetPropsT{1}.Nboot*0.9;
% for i=1:length(bins)
%     XL(i,:) = sum(Largest>bins(i));
% end;
% XLm = sum(XL>Nth,2);
% ind = bins(min(find(XLm==Ngroups))); %#ok

k = 0;
for i=1:Ngroups-1
    for j=i+1:Ngroups
        k = k + 1;
        Stats(k) = Make_Nodal_Stats(NetPropsT{i},NetPropsT{j},PTimes,pthres,FileNames{i},FileNames{j},pval,ispaired); %#ok
    end;
end;

%% Saving Results ...
save(OutputFile,'Stats');

if length(Stats)>1
    StatsAll = Stats; clear Stats;
    OutputFilePath = fileparts(OutputFile);
    for i=1:length(StatsAll)
        OutputFile = [OutputFilePath,filesep,StatsAll(i).Group1,'_vs_',StatsAll(i).Group2];
        Stats = StatsAll(i);
        save(OutputFile,'Stats');
    end;
end;

return;

%% =======   Internal Functions    =======%%
%% function StatsT = Make_Nodal_Stats(NetPropsT1,NetPropsT2,PTimes,pthres,Group1,Group2,pval)
function StatsT = Make_Nodal_Stats(NetPropsT1,NetPropsT2,PTimes,pthres,Group1,Group2,pval,ispaired)

NStruct = length(NetPropsT1.Structures);
Nthres = length(NetPropsT1.ThresBins);

StatsT.Group1 = Group1;
StatsT.Group2 = Group2;
%% Nodal Clustering index
disp('Performing Nodal Clustering Index Statistics ...');
NetPropName = 'NodalClux';
[pn,PmeanDiff] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired);
StatsT.NodalClux = pn;
StatsT.DiffNodalClux = PmeanDiff;
if isempty(pn)
    disp('Nodal Clustering Index Attribute missed in these files ...');
    disp('Nodal Clustering Index Attribute Statistics was not performed ...');
else
    disp('Performing Nodal Clustering Index Statistics ... Done !');
end;
%% Nodal Efficiency
disp('Performing Nodal Efficiency Statistics ...');
NetPropName = 'NodalEfficiency';
[pn,PmeanDiff] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired);
StatsT.NodalEfficiency = pn;
StatsT.DiffNodalEfficiency = PmeanDiff;
if isempty(pn)
    disp('Nodal Efficiency Attribute missed in these files ...');
    disp('Nodal Efficiency Attribute Statistics was not performed ...');
else
    disp('Performing Nodal Efficiency Statistics ... Done !');
end;
%% Nodal Betweenness Centrality
disp('Performing Betweenness Centrality Statistics ...');
NetPropName = 'CentrBet';
[pn,PmeanDiff] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired);
StatsT.CentrBet = pn;
StatsT.DiffCentrBet = PmeanDiff;
if isempty(pn)
    disp('Nodal Betweenness Centrality missed in these files ...');
    disp('Nodal Betweenness Centrality Statistics was not performed ...');
else
    disp('Performing Betweenness Centrality Statistics ... Done !');
end;
%% Nodal Normalized Betweenness Centrality
disp('Performing Normalized Betweenness Centrality Statistics ...');
NetPropName = 'CentrBetNorm';
[pn,PmeanDiff] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired);
StatsT.CentrBetNorm = pn;
StatsT.DiffCentrBetNorm = PmeanDiff;
if isempty(pn)
    disp('Nodal Normalized Betweenness Centrality missed in these files ...');
    disp('Nodal Normalized Betweenness Centrality Statistics was not performed ...');
else
    disp('Performing Normalized Betweenness Centrality Statistics ... Done !');
end;
%% Nodal Strength Connection
disp('Performing Nodal Strength Connection Statistics ...');
NetPropName = 'NodeConnection';
[pn,PmeanDiff] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired);
StatsT.NodeConnection = pn;
StatsT.DiffNodeConnection = PmeanDiff;
StatsT.pthresNodeConnection = pval/NStruct;
if isempty(pn)
    disp('Nodal Nodal Strength Connection missed in these files ...');
    disp('Nodal Nodal Strength Connection Statistics was not performed ...');
else
    disp('Performing Nodal Strength Connection Statistics ... Done !');
end;

StatsT.ispaired = ispaired;
StatsT.pthres = pthres;
StatsT.Structures = NetPropsT1.Structures;
StatsT.isStats = true;
StatsT.info = 'Statistic for Nodal Network attributes';
StatsT.date = date;

return;

%% function [pn,PmeanDiff,ps] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval)
function [pn,PmeanDiff,ps] = Nodal_Stats(NetPropsT1,NetPropsT2,NetPropName,pthres,NStruct,Nthres,PTimes,pval,ispaired)

if (isfield(NetPropsT1,NetPropName)&&isfield(NetPropsT2,NetPropName))
    NP1 = getfield(NetPropsT1,NetPropName); %#ok
    NP2 = getfield(NetPropsT2,NetPropName); %#ok
    Nboot = size(NP1,2);
    if size(NP1,3)>1
        ps = zeros(NStruct,Nthres);
        for i=1:NStruct
            for j=1:Nthres
                X = [squeeze(NP1(i,:,j))',squeeze(NP2(i,:,j))'];  % Group 1  versus Group 2
                if ispaired
                    ps(i,j) = signtest(X(:,1),X(:,2));
                else
                    ps(i,j) = kruskalwallis(X,'','off');
                end;
            end;
        end;
        pn = ((sum(ps<pthres,2))./Nthres)>PTimes;
        NP1 = reshape(NP1,[NStruct,Nthres*Nboot]);
        NP2 = reshape(NP2,[NStruct,Nthres*Nboot]);        
    else
        ps = zeros(NStruct,1);
        for i=1:NStruct
            X = [NP1(i,:)',NP2(i,:)'];  % Group 1  versus Group 2
            if ispaired
                ps(i) = signtest(X(:,1),X(:,2));
            else
                ps(i) = kruskalwallis(X,'','off');
            end;
        end;
        pn = ps<(pval/NStruct); %  pval/NStruct --> Bonferroni Correction        
    end;
    PmeanDiff = mean(NP1,2)-mean(NP2,2);
else
    pn = []; ps = []; PmeanDiff = [];
end;

return;
