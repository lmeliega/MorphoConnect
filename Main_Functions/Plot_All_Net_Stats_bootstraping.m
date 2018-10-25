function Plot_All_Net_Stats_bootstraping(Stats_Network_Props_File,pvalue)

%% 
%% Lester Melie-Garcia
% LREN, CHUV. 
% Lausanne, February 12th, 2017

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

if isfield(Net_Stats,'Clux')
    if isfield(Net_Stats.Clux,'Conditions')||isfield(Net_Stats.Clux,'Groups')  
        if isfield(Net_Stats.Clux,'Conditions')
            MeanCi = mean(Net_Stats.Clux.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Clux.Conditions.ci,NetThresBins,MeanCi,Net_Stats.Clux.Conditions.ciArea,'Clustering Index - Conditions');
        end;
        if isfield(Net_Stats.Clux,'Groups')
            MeanCi = mean(Net_Stats.Clux.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Clux.Groups.ci,NetThresBins,MeanCi,Net_Stats.Clux.Groups.ciArea,'Clustering Index - Groups');
        end;        
    else       
        MeanCi = mean(Net_Stats.Clux.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.Clux.ci,NetThresBins,MeanCi,Net_Stats.Clux.ciArea,'Clustering Index');
    end;
end;
if isfield(Net_Stats,'CharPathL')
    if isfield(Net_Stats.CharPathL,'Conditions')||isfield(Net_Stats.CharPathL,'Groups')  
        if isfield(Net_Stats.CharPathL,'Conditions')
            MeanCi = mean(Net_Stats.CharPathL.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.CharPathL.Conditions.ci,NetThresBins,MeanCi,Net_Stats.CharPathL.Conditions.ciArea,'CharPathL - Conditions');
        end;
        if isfield(Net_Stats.CharPathL,'Groups')
            MeanCi = mean(Net_Stats.CharPathL.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.CharPathL.Groups.ci,NetThresBins,MeanCi,Net_Stats.CharPathL.Groups.ciArea,'CharPathL - Groups');
        end;        
    else       
        MeanCi= mean(Net_Stats.CharPathL.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.CharPathL.ci,NetThresBins,MeanCi,Net_Stats.CharPathL.ciArea,'Characteristic Path Length');
    end;
end;
if isfield(Net_Stats,'Elocal')
    if isfield(Net_Stats.Elocal,'Conditions')||isfield(Net_Stats.Elocal,'Groups')  
        if isfield(Net_Stats.Elocal,'Conditions')
            MeanCi = mean(Net_Stats.Elocal.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Elocal.Conditions.ci,NetThresBins,MeanCi,Net_Stats.Elocal.Conditions.ciArea,'Local Efficiency - Conditions');
        end;
        if isfield(Net_Stats.Clux,'Groups')
            MeanCi = mean(Net_Stats.Elocal.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Elocal.Groups.ci,NetThresBins,MeanCi,Net_Stats.Elocal.Groups.ciArea,'Local Efficiency - Groups');
        end;        
    else       
        MeanCi = mean(Net_Stats.Elocal.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.Elocal.ci,NetThresBins,MeanCi,Net_Stats.Elocal.ciArea,'Local Efficiency');
    end;
end;
if isfield(Net_Stats,'Eglobal')
    if isfield(Net_Stats.Eglobal,'Conditions')||isfield(Net_Stats.Eglobal,'Groups')  
        if isfield(Net_Stats.Eglobal,'Conditions')
            MeanCi = mean(Net_Stats.Eglobal.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Eglobal.Conditions.ci,NetThresBins,MeanCi,Net_Stats.Eglobal.Conditions.ciArea,'Global Efficiency - Conditions');
        end;
        if isfield(Net_Stats.Eglobal,'Groups')
            MeanCi = mean(Net_Stats.Eglobal.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Eglobal.Groups.ci,NetThresBins,MeanCi,Net_Stats.Eglobal.Groups.ciArea,'Global Efficiency - Groups');
        end;        
    else       
        MeanCi = mean(Net_Stats.Eglobal.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.Eglobal.ci,NetThresBins,MeanCi,Net_Stats.Eglobal.ciArea,'Global Efficiency');
    end;
end;
if isfield(Net_Stats,'TargetAttack')
    if isfield(Net_Stats.TargetAttack,'Conditions')||isfield(Net_Stats.TargetAttack,'Groups')  
        if isfield(Net_Stats.TargetAttack,'Conditions')
            MeanCi = mean(Net_Stats.TargetAttack.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.TargetAttack.Conditions.ci,NetThresBins,MeanCi,Net_Stats.TargetAttack.Conditions.ciArea,'Target Attack - Conditions');
        end;
        if isfield(Net_Stats.TargetAttack,'Groups')
            MeanCi = mean(Net_Stats.TargetAttack.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.TargetAttack.Groups.ci,NetThresBins,MeanCi,Net_Stats.TargetAttack.Groups.ciArea,'Target Attack - Groups');
        end;        
    else  
        MeanCi = mean(Net_Stats.TargetAttack.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.TargetAttack.ci,NetThresBins,MeanCi,Net_Stats.TargetAttack.ciArea,'Target Attack');
    end;
end;
if isfield(Net_Stats,'Modularity')
    if isfield(Net_Stats.Modularity,'Conditions')||isfield(Net_Stats.Modularity,'Groups')  
        if isfield(Net_Stats.Modularity,'Conditions')
            MeanCi = mean(Net_Stats.Modularity.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Modularity.Conditions.ci,NetThresBins,MeanCi,Net_Stats.Modularity.Conditions.ciArea,'Modularity - Conditions');
        end;
        if isfield(Net_Stats.Modularity,'Groups')
            MeanCi = mean(Net_Stats.Modularity.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.Modularity.Groups.ci,NetThresBins,MeanCi,Net_Stats.Modularity.Groups.ciArea,'Modularity - Groups');
        end;        
    else 
        MeanCi = mean(Net_Stats.Modularity.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.Modularity.ci,NetThresBins,MeanCi,Net_Stats.Modularity.ciArea,'Modularity');
    end;
end;
if isfield(Net_Stats,'GlobalCentrBet')
    if isfield(Net_Stats.GlobalCentrBet,'Conditions')||isfield(Net_Stats.GlobalCentrBet,'Groups')  
        if isfield(Net_Stats.GlobalCentrBet,'Conditions')
            MeanCi = mean(Net_Stats.GlobalCentrBet.Conditions.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.GlobalCentrBet.Conditions.ci,NetThresBins,MeanCi,Net_Stats.GlobalCentrBet.Conditions.ciArea,'Global Betweennes Centrality - Conditions');
        end;
        if isfield(Net_Stats.GlobalCentrBet,'Groups')
            MeanCi = mean(Net_Stats.GlobalCentrBet.Groups.ci);
            Plot_Stats_boostraping_Statistics(Net_Stats.GlobalCentrBet.Groups.ci,NetThresBins,MeanCi,Net_Stats.GlobalCentrBet.Groups.ciArea,'Global Betweennes Centrality - Groups');
        end;        
    else
        MeanCi = mean(Net_Stats.GlobalCentrBet.ci);
        Plot_Stats_boostraping_Statistics(Net_Stats.GlobalCentrBet.ci,NetThresBins,MeanCi,Net_Stats.GlobalCentrBet.ciArea,'Global Betweennes Centrality');
    end;
end;


% if isfield(Net_Stats,'CharPathL')
%     
%     Plot_Stats_boostraping_Statistics(Net_Stats.CharPathL.ci,NetThresBins,Net_Stats.CharPathL.dm,Net_Stats.CharPathL.ciArea,'Characteristic Path Length');
% end;
% if isfield(Net_Stats,'Elocal')
%     Plot_Stats_boostraping_Statistics(Net_Stats.Elocal.ci,NetThresBins,Net_Stats.Elocal.dm,Net_Stats.Elocal.ciArea,'Local Efficiency');
% end;
% if isfield(Net_Stats,'Eglobal')
%     Plot_Stats_boostraping_Statistics(Net_Stats.Eglobal.ci,NetThresBins,Net_Stats.Eglobal.dm,Net_Stats.Eglobal.ciArea,'Global Efficiency');
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