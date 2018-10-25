function Plot_All_Net_Stats_Resampling(Stats_Network_Props_File,pvalue)

%% 
%% Lester Melie-Garcia
% LREN, CHUV. 
% Lausanne, October 25th, 2017

if ~exist('pvalue','var')
    pvalue=0.05;
end;
if ischar(Stats_Network_Props_File)
   Net_Stats=load(Stats_Network_Props_File);
   Net_Stats = Net_Stats.Net_Stats;
else
   Net_Stats=Stats_Network_Props_File;
   clear Stats_Network_Props_File;
end;
NetThresBins = Net_Stats.ThresBins./100;
if isfield(Net_Stats,'ResamplingMethod')
    ResamplingMethod = Net_Stats.ResamplingMethod;
else
    ResamplingMethod = 'Bootstraps'; 
end;

if isfield(Net_Stats,'Clux')
    NetPropTR = Net_Stats.Clux;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Clustering Index');
end;
if isfield(Net_Stats,'CharPathL')
    NetPropTR = Net_Stats.CharPathL;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'CharPathL');
end;
if isfield(Net_Stats,'Elocal')
    NetPropTR = Net_Stats.Elocal;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Local Efficiency');
end;
if isfield(Net_Stats,'Eglobal')
    NetPropTR = Net_Stats.Eglobal;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Global Efficiency');
end;
if isfield(Net_Stats,'TargetAttack')
    NetPropTR = Net_Stats.TargetAttack;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Target Attack');
end;
if isfield(Net_Stats,'Modularity')
    NetPropTR = Net_Stats.Modularity;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Modularity');
end;
if isfield(Net_Stats,'GlobalCentrBet')
    NetPropTR = Net_Stats.GlobalCentrBet;
    Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,'Global Betweennes Centrality');
end;

% if isfield(Net_Stats,'CharPathL')
%     
%     Plot_Stats_Resampling_Statistics(Net_Stats.CharPathL.ci,NetThresBins,Net_Stats.CharPathL.dm,Net_Stats.CharPathL.ciArea,'Characteristic Path Length');
% end;
% if isfield(Net_Stats,'Elocal')
%     Plot_Stats_Resampling_Statistics(Net_Stats.Elocal.ci,NetThresBins,Net_Stats.Elocal.dm,Net_Stats.Elocal.ciArea,'Local Efficiency');
% end;
% if isfield(Net_Stats,'Eglobal')
%     Plot_Stats_Resampling_Statistics(Net_Stats.Eglobal.ci,NetThresBins,Net_Stats.Eglobal.dm,Net_Stats.Eglobal.ciArea,'Global Efficiency');
% end;
% if isfield(Net_Stats{1},'NodalEfficiency')
%     NStruct = length(Net_Stats{i}.Structures);
%     StructLabels = cell(NStruct,1);
%     for j=1:NStruct
%         StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
%     end;
%     V = Net_Stats{1}.NodalEfficiency.AreaStat;
%     View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Efficiency Statistic -- ',Legend_Text{1}]);
% end;
% if isfield(Net_Stats{1},'Vulnerability')
%     NStruct = length(Net_Stats{i}.Structures);
%     StructLabels = cell(NStruct,1);
%     for j=1:NStruct
%         StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
%     end;
%     V = Net_Stats{1}.Vulnerability.AreaStat;
%     View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Vulnerability Statistic -- ',Legend_Text{1}]);
% end;

end

%% ======= Internal Functions ======= %%
function Plot_One_NP_Stat(NetPropTR,ResamplingMethod,NetThresBins,NetPropertyName)

if isfield(NetPropTR,'Conditions')||isfield(NetPropTR,'Groups')    
    if isfield(NetPropTR,'Conditions')
        MeanCi = mean(NetPropTR.Conditions.ci);
        Plot_Stats_Resampling_Statistics(NetPropTR.Conditions.ci,NetThresBins,MeanCi,NetPropTR.Conditions.ciArea,[NetPropertyName,'- Conditions']);
    end;
    if isfield(Net_Stats.Clux,'Groups')
        MeanCi = mean(Net_Stats.Clux.Groups.ci);
        Plot_Stats_Resampling_Statistics(NetPropTR.Groups.ci,NetThresBins,MeanCi,NetPropTR.Groups.ciArea,[NetPropertyName,' - Groups']);
    end;
else
    MeanCi = mean(NetPropTR.ci);
    if strcmp(ResamplingMethod,'Permutations')
        dm = NetPropTR.dm;
    else
        dm = '';
    end;
    Plot_Stats_Resampling_Statistics(NetPropTR.ci,NetThresBins,MeanCi,NetPropTR.ciArea,NetPropertyName,dm);
end;

end