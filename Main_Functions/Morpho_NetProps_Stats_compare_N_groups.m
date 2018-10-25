function Net_Stats = Morpho_NetProps_Stats_compare_N_groups(NetworkPropertiesFiles)


% This function performs a Kruskal-Wallis test to compare samples from two
% or more groups of Network Properties. Each column of the m-by-n matrix X represents an independent 
% sample containing m mutually independent observations. The function compares the medians
% of the samples in X, and returns the p-value for the null hypothesis that all samples are 
% drawn from the same population (or equivalently, from different populations with the same distribution).
%
% Input Parameters:
%      NetworkPropertiesFiles : Filename of the Network properties. 
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% UPD, Bern, Switzerland
%
% May 11th, 2010.

NetProps_temp = load(deblank(NetworkPropertiesFiles(1,:)));
NetProps = NetProps_temp.NetProps;
Nboot = NetProps.Nboot;

NNets = size(NetworkPropertiesFiles,1);
NetProps = cell(NNets,1);
for i=1:NNets
    NetProps_temp = load(deblank(NetworkPropertiesFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetProps{i} = NetProps_temp;
end;

%% -------- Cluster index Statistic --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetProps{i},'Clux');
end;
if c
    disp('Doing Statistic for Cluster Index ...');
    X = zeros(Nboot,NNets);    
    for i=1:NNets
        X(:,i) = trapz(NetProps{i}.Clux,2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.Clux.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.Clux.pstats = pstats;    
    disp('Statistic for Cluster Index ...  Done!');
end;
%% -------- Characteristic Path length Statistic --------- %%

c = true;
for i=1:NNets
    c = c&&isfield(NetProps{i},'CharPathL');
end;
if c
    disp('Doing Statistic for Characteristic Path Length ...');
    X = zeros(Nboot,NNets);    
    for i=1:NNets
        X(:,i) = trapz(NetProps{i}.CharPathL,2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.CharPathL.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.CharPathL.pstats = pstats;
    disp('Statistic for Characteristic Path Length ...  Done!');
end;    

%% -------- Efficiency Statistic --------- %%

c = true;
for i=1:NNets
    c = c&&isfield(NetProps{i},'Efficiency');
end;
if c
    disp('Doing Statistic for Efficiency ...');
    % Local Efficiency
    disp('Doing Statistic for Local Efficiency ...');
    X = zeros(Nboot,NNets);    
    for i=1:NNets
        X(:,i) = trapz(squeeze(NetProps{i}.Efficiency(1,:,:)),2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.Elocal.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.Elocal.pstats = pstats;
    % Global Efficiency
    disp('Doing Statistic for Global Efficiency ...');
    X = zeros(Nboot,NNets);    
    for i=1:NNets
        X(:,i) = trapz(squeeze(NetProps{i}.Efficiency(2,:,:)),2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.Eglobal.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.Eglobal.pstats = pstats;

    disp('Statistic for Efficiency ...  Done!');
end;
%% -------- Nodal Normalized Betweenness Centrality Statistic --------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetProps{i},'CentrBetNorm');
end;
if c
    disp('Doing Statistic for Nodal Normalized Betweenness Centrality ...');
    NStruct = size(NetProps{1}.CentrBet,1);
    X = zeros(NStruct,Nboot,NNets);    
%     if size(NetProps{1}.CentrBetNorm,3)>1
%         for i=1:NNets
%             NBC = NetProps{i}.CentrBetNorm;
%             X(:,:,i) = mean(NBC(:,:,1:end),3); %trapz(NBC(:,:,1:end),3);
%         end;
%     else
        for i=1:NNets
            X(:,:,i) = NetProps{i}.CentrBetNorm(:,:,21);
        end;        
%    end;
    for i=1:NStruct
        [pA,kTable,pstats] = kruskalwallis(squeeze(X(i,:,:)),'','off');
        Net_Stats.CentrBetNorm.p(i) = pA;
        pstats = multcompare(pstats,'display','off');
        Net_Stats.CentrBetNorm.pstats(:,:,:,i) = pstats;
    end;
    c1 = true;
    for i=1:NNets
        c1 = c&&isfield(NetProps{i},'Structures');
    end;
    if c1
        Net_Stats.CentrBetNorm.Structures = NetProps{1}.Structures;
    end;
    disp('Statistic for Nodal Normalized Betweenness Centrality ...  Done!');
end;    

%% -------- Small World  -------- %%
c = true;
for i=1:NNets
    c = c&&isfield(NetProps{i},'SmallWorld');
end;
if c
    disp('Doing Statistic for Small World properties ...');
    % for gamma smallworld property
    flagInf = 1;
    flagNaN = 1;
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(1,:,:));
        flagInf = flagInf.*sum(isinf(g1),2)==0; % Checking for NaN and Inf values
        flagNaN = flagNaN.*sum(isnan(g1),2)==0;
    end;   
    indf = logical(flagNaN.*flagInf);
    Ne = sum(indf); % Number of elements different from NaN and Inf.
    X = zeros(Ne,NNets);    
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(1,:,:));
        g1 = g1(indf,:);
        X(:,i) = trapz(g1,2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.gamna.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.gamna.pstats = pstats;
    % for lambda smallworld property
    flagInf = 1;
    flagNaN = 1;
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(2,:,:));
        flagInf = flagInf.*sum(isinf(g1),2)==0; % Checking for NaN and Inf values
        flagNaN = flagNaN.*sum(isnan(g1),2)==0;
    end;
    indf = logical(flagNaN.*flagInf);
    Ne = sum(indf); % Number of elements different from NaN and Inf.
    X = zeros(Ne,NNets);     
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(2,:,:));
        g1 = g1(indf,:);
        X(:,i) = trapz(g1,2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.lambda.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.lambda.pstats = pstats;
    % for  sigma smallworld property
    flagInf = 1;
    flagNaN = 1;
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(3,:,:));
        flagInf = flagInf.*sum(isinf(g1),2)==0; % Checking for NaN and Inf values
        flagNaN = flagNaN.*sum(isnan(g1),2)==0;
    end;
    indf = logical(flagNaN.*flagInf);
    Ne = sum(indf); % Number of elements different from NaN and Inf.
    X = zeros(Ne,NNets);    
    for i=1:NNets
        g1 = squeeze(NetProps{i}.SmallWorld(3,:,:));
        g1 = g1(indf,:);
        X(:,i) = trapz(g1,2);
    end;
    [pA,kTable,pstats] = kruskalwallis(X,'','off');
    Net_Stats.sigma.p = pA;
    pstats = multcompare(pstats,'display','off');
    Net_Stats.sigma.pstats = pstats;
end;

c =cell(NNets,1);
for i=1:NNets
    [FilePath,FileName] = fileparts(NetworkPropertiesFiles(i,:));
    c{i} = [num2str(i),'- ',FileName];
end;
Net_Stats.Groups = strvcat(c); %#ok

disp('Statistical analysis for Network Properties  ...  FINISHED :-)');

return;