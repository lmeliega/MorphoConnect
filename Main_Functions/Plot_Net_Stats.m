function Plot_Net_Stats(NetStatsFileName,pvalue)

% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% June 13th, 2009.
% Last update: November 22nd, 2009

NFiles = size(NetStatsFileName,1); 

for i=1:NFiles
    X = load(deblank(NetStatsFileName(i,:)));
    Net_Stats{i} = X.Net_Stats; %#ok
    [FilePath,FileName,Fileext] = fileparts(NetStatsFileName(i,:)); %#ok
    Legend_Text{i} = FileName; %#ok
end;

if NFiles==1
    if isfield(Net_Stats{1},'Clux')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.Clux.T,'Clustering Index',pvalue);
    end;
    if isfield(Net_Stats{1},'CharPathL')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.CharPathL.T,'Characteristic Path Length',pvalue);
    end;
    if isfield(Net_Stats{1},'Elocal')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.Elocal.T,'Local Efficiency',pvalue);
    end;
    if isfield(Net_Stats{1},'Eglobal')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.Eglobal.T,'Global Efficiency',pvalue);
    end;
    if isfield(Net_Stats{1},'gamna')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.gamna.T,'Gamma',pvalue);
    end;
    if isfield(Net_Stats{1},'lambda')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.lambda.T,'Lambda',pvalue);
    end;
    if isfield(Net_Stats{1},'sigma')
        Createfigure_pvalues_vs_Sparsity(Net_Stats{1}.sigma.T,'Sigma',pvalue);
    end;
    if isfield(Net_Stats{1},'NodalEfficiency')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.NodalEfficiency.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Efficiency Statistic -- ',Legend_Text{1}]);
    end;
    if isfield(Net_Stats{1},'Vulnerability')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.Vulnerability.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Vulnerability Statistic -- ',Legend_Text{1}]);
    end;
    if isfield(Net_Stats{1},'CentrBet')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.CentrBet.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Betweeness Centrality Statistic -- ',Legend_Text{1}]);
    end;
    if isfield(Net_Stats{1},'CentrBetNorm')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.CentrBet.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Normalized Betweeness Centrality Statistic -- ',Legend_Text{1}]);
    end;    
    if isfield(Net_Stats{1},'NodalClux')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.NodalClux.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Clustering index Statistic -- ',Legend_Text{1}]);
    end;
    if isfield(Net_Stats{1},'NodeConnection')
        NStruct = length(Net_Stats{i}.Structures);
        StructLabels = cell(NStruct,1);
        for j=1:NStruct
            StructLabels{j}= [Net_Stats{i}.Structures(j).Name,'- ',num2str(j)];
        end;
        V = Net_Stats{1}.NodeConnection.AreaStat;
        View_Nodal_Property_Statistic(V,StructLabels,pvalue,['Nodes Connection Statistic -- ',Legend_Text{1}]);
    end;        
else
    if isfield(Net_Stats{1},'Clux')
        Nvec = min(length(Net_Stats{1}.Clux.T),length(Net_Stats{2}.Clux.T));
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.Clux.T(1:Nvec),Net_Stats{2}.Clux.T(1:Nvec)],'Clustering Index',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'CharPathL')
        Nvec = min(length(Net_Stats{1}.CharPathL.T),length(Net_Stats{2}.CharPathL.T));        
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.CharPathL.T(1:Nvec),Net_Stats{2}.CharPathL.T(1:Nvec)],'Characteristic Path Length',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'Elocal')
        Nvec = min(length(Net_Stats{1}.Elocal.T),length(Net_Stats{2}.Elocal.T));        
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.Elocal.T(1:Nvec),Net_Stats{2}.Elocal.T(1:Nvec)],'Local Efficiency',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'Eglobal')
        Nvec = min(length(Net_Stats{1}.Eglobal.T),length(Net_Stats{2}.Eglobal.T));  
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.Eglobal.T(1:Nvec),Net_Stats{2}.Eglobal.T(1:Nvec)],'Global Efficiency',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'gamna')
        Nvec = min(length(Net_Stats{1}.gamna.T),length(Net_Stats{2}.gamna.T));
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.gamna.T(1:Nvec),Net_Stats{2}.gamna.T(1:Nvec)],'Gamma',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'lambda')
        Nvec = min(length(Net_Stats{1}.lambda.T),length(Net_Stats{2}.lambda.T));
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.lambda.T(1:Nvec),Net_Stats{2}.lambda.T(1:Nvec)],'Lambda',pvalue,Legend_Text);
    end;
    if isfield(Net_Stats{1},'sigma')
        Nvec = min(length(Net_Stats{1}.sigma.T),length(Net_Stats{2}.sigma.T));
        Createfigure_pvalues_vs_Sparsity([Net_Stats{1}.sigma.T(1:Nvec),Net_Stats{2}.sigma.T(1:Nvec)],'Sigma',pvalue,Legend_Text);
    end;    
end;

return;