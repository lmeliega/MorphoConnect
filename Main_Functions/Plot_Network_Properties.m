function Plot_Network_Properties(NetworkPropertiesFiles,isAll_inOne)

% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 31st, 2009.
% Modified January 23rd, 2010

disp('Please wait a few seconds ... : Preprocessing some data to show Network Properties graphs ...');
NetProps_temp = load(deblank(NetworkPropertiesFiles(1,:)));
NetProps = NetProps_temp.NetProps;
if isfield(NetProps,'ConMat')
    NetFilesize = size(NetProps.ConMat);
    if length(NetFilesize)>=3
        Nrep = NetFilesize(3); % Checking if we have a Network properties files with repetitions.
    else
        Nrep = 1;
    end;    
end;
if isfield(NetProps,'Nwins')
    Nrep = NetProps.Nwins;
end;
%if Nrep==1
NNets = size(NetworkPropertiesFiles,1);
NetProps = cell(NNets,1);
Legend_Text = cell(NNets,1);
for i=1:NNets
    NetProps_temp = load(deblank(NetworkPropertiesFiles(i,:)));
    NetProps_temp = NetProps_temp.NetProps;
    NetProps{i} = NetProps_temp;
    Legend_Text{i} = NetProps_temp.Name;
end;

if isfield(NetProps{1},'thresh')
    x = NetProps{1}.thresh(1,:);
else
    if isfield(NetProps{1},'ThresBins')
        x = NetProps{1}.ThresBins(1,:);
    end;
end;

% if isfield(NetProps{1},'kmean')
%     for i=1:NNets
%         if Nrep~=1
%             Nkmean(:,i) = mean(NetProps{i}.kmean);
%             Nkstd(:,i) = std(NetProps{i}.kmean);
%         else
%             Nkmean(:,i) = NetProps{i}.kmean';
%         end;
%     end;
% end;

% if isfield(NetProps{1},'kmean')
%     for i=1:NNets
%         logNnodes = NetProps{i}.logNnodes;
%         x = NetProps{i}.thresh;
%         ind = find(Nkmean(:,i)<=logNnodes);
%         ind2trunc(i) = min(ind);
%     end;
%     ind = min(ind2trunc)-2;
% else
%     ind = length(x)-2;
% end;

Colorvector = {'b','g','r','m','k'};
ind = length(x)-2;
% x = x(1:ind);
% x = x(:);
if length(NetProps{1}.ThresBins)~=1
    ThresBins = (NetProps{1}.ThresBins)/100;
    ThresBins = ThresBins(1:ind);
    ThresBins = ThresBins(:);
    ThresBins_flag = true;
else
    ThresBins_flag = false;
end;

if isAll_inOne
    % Do nothing ....
else
    % --- All Figures in separated windows ------ %
    % ----- Small World Properties -------------% 
    if isfield(NetProps{1},'SmallWorld')&&ThresBins_flag
        for i=1:NNets
            smallworld = squeeze(NetProps{i}.SmallWorld);
            if Nrep~=1
                gamna(:,i) = mean(squeeze(smallworld(1,:,:)))'; %#ok
                gamna_std(:,i) = std(squeeze(smallworld(1,:,:)))'; %#ok
            else
                gamna(:,i) = smallworld(1,:)'; %#ok
            end;
        end;
        gamna = gamna(1:ind,:);
        h1 = figure;
        % Create axes
        axes1 = axes('Parent',h1,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        %fighand = figure;
        %axes1 = axes('Parent',fighand,'FontWeight','bold','FontSize',12);
        if Nrep==1
            plot(ThresBins,gamna,'-o','LineWidth',2);
        else
            gamna_std = gamna_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),gamna,gamna_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Gamma','FontSize',14);
        %---------------------------------------------------------------------%
        for i=1:NNets
            smallworld = squeeze(NetProps{i}.SmallWorld);
            if Nrep~=1
                lambda(:,i) = mean(squeeze(smallworld(2,:,:)))'; %#ok
                lambda_std(:,i) = std(squeeze(smallworld(2,:,:)))'; %#ok
            else
                lambda(:,i) = smallworld(2,:)'; %#ok
            end;
        end;
        h2 = figure;
        % Create axes
        axes1 = axes('Parent',h2,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        lambda = lambda(1:ind,:);
        if Nrep==1
            plot(ThresBins,lambda,'-o','LineWidth',2);
        else
            lambda_std = lambda_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),lambda,lambda_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Lambda','FontSize',14);

        %---------------------------------------------------------------------%
        for i=1:NNets
            smallworld = squeeze(NetProps{i}.SmallWorld);
            if Nrep~=1
                sigmaR(:,i) = mean(squeeze(smallworld(3,:,:)))'; %#ok
                sigmaR_std(:,i) = std(squeeze(smallworld(3,:,:)))'; %#ok
            else
                sigmaR(:,i) = smallworld(3,:)'; %#ok
            end;
        end;
        h3 = figure;
        % Create axes
        axes1 = axes('Parent',h3,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        sigmaR = sigmaR(1:ind,:);
        if Nrep==1
            plot(ThresBins,sigmaR,'-o','LineWidth',2);
        else
            sigmaR_std = sigmaR_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),sigmaR,sigmaR_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Sigma','FontSize',14);
    end; % End Small World properties
    %---------------------------------------------------------------------%
    %-------  kmean -------------%
%     if isfield(NetProps{1},'kmean')
%         h4 = figure;
%         % Create axes
%         axes1 = axes('Parent',h4,'FontSize',12,'FontWeight','bold');
%         box('on');
%         hold('all');
%         Nkmean = Nkmean(1:ind,:);
%         if Nrep==1
%             plot(ThresBins,Nkmean,'-o','LineWidth',2);
%         else
%             Nkstd = Nkstd(1:ind,:);
%             errorbar(repmat(ThresBins,1,NNets),Nkmean,Nkstd,'-o','LineWidth',2);
%         end;
%         legend(Legend_Text);
%         %line([min(ThresBins),max(ThresBins)],[NetProps.logNnodes,NetProps.logNnodes],'LineWidth',1,'Color',[1 0 0],'LineStyle','--');
%         xlabel('Sparsity Degree','FontSize',14);
%         ylabel('Average Degree','FontSize',14);
%     end;
    %---------------------------------------------------------------------%
    %-------  Local & Global Efficiency -------------%
    if isfield(NetProps{1},'Efficiency')&&ThresBins_flag
        for i=1:NNets
            if Nrep~=1
                Elocal(:,i) = mean(squeeze(NetProps{i}.Efficiency(1,:,:)))'; %#ok
                Elocal_std(:,i) = std(squeeze(NetProps{i}.Efficiency(1,:,:)))'; %#ok
            else
                Elocal(:,i) = squeeze(NetProps{i}.Efficiency(1,:,:))'; %#ok
            end;
        end;
        h5 = figure;
        % Create axes
        axes1 = axes('Parent',h5,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        Elocal = Elocal(1:ind,:);
        if Nrep==1
            plot(ThresBins,Elocal,'-o','LineWidth',2);
        else
            Elocal_std = Elocal_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),Elocal,Elocal_std,'-o','LineWidth',2);
            %for i=1:NNets
            %    shadedErrorBar(ThresBins,Elocal(:,i),Elocal_std(:,i),Colorvector{i},1);
            %    hold on;
            %end;
            %hold off;           
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Local Eficiency','FontSize',14);
        %---------------------------------------------------------------------%
        for i=1:NNets
            if Nrep~=1
                Eglobal(:,i) = mean(squeeze(NetProps{i}.Efficiency(2,:,:)))'; %#ok
                Eglobal_std(:,i) = std(squeeze(NetProps{i}.Efficiency(2,:,:)))'; %#ok
            else
                Eglobal(:,i) = squeeze(NetProps{i}.Efficiency(2,:,:))'; %#ok
            end;
        end;
        h6 = figure;
        % Create axes
        axes1 = axes('Parent',h6,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        Eglobal = Eglobal(1:ind,:);
        if Nrep==1
            plot(ThresBins,Eglobal,'-o','LineWidth',2);
        else
            Eglobal_std = Eglobal_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),Eglobal,Eglobal_std,'-o','LineWidth',2);
            %for i=1:NNets
            %    shadedErrorBar(ThresBins,Eglobal(:,i),Eglobal_std(:,i),Colorvector{i},1);
            %    hold on;
            %end;
            %hold off;
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Global Eficiency','FontSize',14);
    end; % End Local & Global Efficiency
    %---------------------------------------------------------------------%
    %----------- Clustering Index ---------%
    if isfield(NetProps{1},'Clux')&&ThresBins_flag
        for i=1:NNets
            if Nrep~=1
                Clustering_Index(:,i) = mean(squeeze(NetProps{i}.Clux))'; %#ok
                Clustering_Index_std(:,i) = std(squeeze(NetProps{i}.Clux))'; %#ok
            else
                Clustering_Index(:,i) = squeeze(NetProps{i}.Clux)'; %#ok
            end;
        end;
        h7 = figure;
        % Create axes
        axes1 = axes('Parent',h7,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        Clustering_Index = Clustering_Index(1:ind,:);
        if Nrep==1
            plot(ThresBins,Clustering_Index,'-o','LineWidth',2);
        else
            Clustering_Index_std = Clustering_Index_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),Clustering_Index,Clustering_Index_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Clustering Index','FontSize',14);
    end; % End Clustering Index
    %---------------------------------------------------------------------%
    %------ Characteristic Path Length ------%
    if isfield(NetProps{1},'CharPathL')&&ThresBins_flag
        for i=1:NNets
            if Nrep~=1
                CharPathL(:,i) = mean(squeeze(NetProps{i}.CharPathL))'; %#ok
                CharPathL_std(:,i) = std(squeeze(NetProps{i}.CharPathL))'; %#ok
            else
                CharPathL(:,i) = squeeze(NetProps{i}.CharPathL)'; %#ok
            end;
        end;
        h8 = figure;
        % Create axes
        axes1 = axes('Parent',h8,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        CharPathL = CharPathL(1:ind,:);
        if Nrep==1
            plot(ThresBins,CharPathL,'-o','LineWidth',2);
        else
            CharPathL_std = CharPathL_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),CharPathL,CharPathL_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Characteristic Path Length','FontSize',14);
    end; % End Characteristic Path Length
    %---------------------------------------------------------------------%
    %------ Target Attack Analysis ------%
    if isfield(NetProps{1},'TargetAttack')&&ThresBins_flag
        for i=1:NNets
            if isfield(NetProps{i},'TargetAttackthresbins')
                t = NetProps{i}.TargetAttackthresbins;
            else
                t = 1:size(NetProps{i}.TargetAttack,1); t = t/100;
            end;
            t = t(:);
            if Nrep~=1
                TargetAttack(:,i) = mean(squeeze(trapz(t,NetProps{i}.TargetAttack,1)))'; %#ok
                TargetAttack_std(:,i) = std(squeeze(trapz(t,NetProps{i}.TargetAttack,1)))'; %#ok
                %TargetAttack(:,i) = mean(squeeze(trapz(NetProps{i}.TargetAttack,3)),2); %#ok
                %TargetAttack_std(:,i) = std(squeeze(trapz(NetProps{i}.TargetAttack,3)),0,2); %#ok                
            else
                TargetAttack(:,i) = squeeze(trapz(t,NetProps{i}.TargetAttack,1))'; %#ok
            end;
        end;
        h8_1 = figure;
        % Create axes
        axes1 = axes('Parent',h8_1,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        TargetAttack = TargetAttack(1:ind,:);
        if Nrep==1
            plot(ThresBins,TargetAttack,'-o','LineWidth',2);
        else
            TargetAttack_std = TargetAttack_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),TargetAttack,TargetAttack_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Area under Target Attack curves','FontSize',14);
        %ylabel('Area under Target Attack Curves','FontSize',14);
    end; % End Target Attack Analysis
    %---------------------------------------------------------------------%
    %------ Modularity ------%
%     if isfield(NetProps{1},'Modularity')&&ThresBins_flag
%         for i=1:NNets
%             if Nrep~=1
%                 Modularity(:,i) = mean(squeeze(NetProps{i}.Modularity))'; %#ok
%                 Modularity_std(:,i) = std(squeeze(NetProps{i}.Modularity))'; %#ok
%             else
%                 Modularity(:,i) = squeeze(NetProps{i}.Modularity)'; %#ok
%             end;
%         end;
%         h8_2 = figure;
%         % Create axes
%         axes1 = axes('Parent',h8_2,'FontSize',12,'FontWeight','bold'); %#ok
%         box('on');
%         hold('all');
%         Modularity = Modularity(1:ind,:);
%         if Nrep==1
%             plot(ThresBins,Modularity,'-o','LineWidth',2);
%         else
%             Modularity_std = Modularity_std(1:ind,:);
%             errorbar(repmat(ThresBins,1,NNets),Modularity,Modularity_std,'-o','LineWidth',2);
%         end;
%         legend(Legend_Text);
%         xlabel('Sparsity Degree','FontSize',14);
%         ylabel('Modularity','FontSize',14);
%     end; % End Characteristic Path Length
    %---------------------------------------------------------------------%
    %------ Degree Distribution ---------%
    if isfield(NetProps{1},'DegDistr')&&ThresBins_flag
        for i=1:NNets
            CC = squeeze(mean(squeeze(NetProps{i}.DegDistr(:,2,:,:)),2));
            CC = CC(:,1:3:end);
            figure;
            plot(log(1:size(CC,1)),CC,'-o','LineWidth',1.5);
            xlabel('log(degree)','FontSize',14);
            ylabel('log(cumulative distribution)','FontSize',14);
            title(Legend_Text{i});
        end;
    end; % End Degree Distribution
    %---------------------------------------------------------------------%
    %------ Callosal Connections statistic -------%
    if ThresBins_flag
        plotflag = 0;
        thresflag = false; %thresflag = 1; thresflag = true; %
        for i=1:NNets
            [pmean,pstd] = Morpho_callosal_connections(NetProps{i},100*ThresBins,plotflag,thresflag);
            Pmean(:,i) = pmean; %#ok
            Pstd(:,i) = pstd; %#ok
        end;
        h9 = figure;
        % Create axes
        axes1 = axes('Parent',h9,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        if Nrep==1
            plot(ThresBins,Pmean,'-o','LineWidth',2);
        else
            errorbar(repmat(ThresBins,1,NNets),Pmean,Pstd,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('% of Detected Homologous Callosal Connections','FontSize',14);
    end;
    % End Callosal Connections statistic
    %---------------------------------------------------------------------%
    %------ Vulnerability -------%
    for i=1:NNets
        if isfield(NetProps{i},'VulnerabilityMat')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            V = mean(NetProps{i}.VulnerabilityMat,2);
            V = squeeze(V);
            View_Nodal_Property(V,StructLabels,['Vulnerability -- ',NetProps{i}.Name]);
        end;
    end;
    %---------------------------------------------------------------------%
    %------ Betweeness Centrality -------%
    for i=1:NNets
        if isfield(NetProps{i},'CentrBet')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            V = mean(NetProps{i}.CentrBet,2);
            V = squeeze(V);
            View_Nodal_Property(V,StructLabels,['Betweeness Centrality -- ',NetProps{i}.Name]);
        end;
    end;
    %---------------------------------------------------------------------%
    %------ Normalized Betweeness Centrality -------%
    for i=1:NNets
        if isfield(NetProps{i},'CentrBetNorm')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            V = mean(NetProps{i}.CentrBetNorm,2);
            V = squeeze(V);
            View_Nodal_Property(V,StructLabels,['Normalized Betweeness Centrality -- ',NetProps{i}.Name]);
        end;
    end;
    %---------------------------------------------------------------------%
    %------ Most Connected nodes -------%
    for i=1:NNets
        if isfield(NetProps{i},'MostConnect')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            View_Nodal_Property(NetProps{i}.MostConnect,StructLabels,['Nodes Connectivity -- ',NetProps{i}.Name]);
        end;
        if isfield(NetProps{i},'NodeConnection')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            View_Nodal_Property(NetProps{i}.NodeConnection,StructLabels,['Nodes Connectivity -- ',NetProps{i}.Name]);
        end;
    end;
    %------ Nodal Efficiency -------%
    for i=1:NNets
        if isfield(NetProps{i},'NodalEfficiency')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            V = mean(NetProps{i}.NodalEfficiency,2);
            V = squeeze(V);
            View_Nodal_Property(V,StructLabels,['Nodes Efficiency -- ',NetProps{i}.Name]);
        end;
    end;
    %------ Nodal Cluster Index -------%
    for i=1:NNets
        if isfield(NetProps{i},'NodalClux')
            NStruct = length(NetProps{i}.Structures);
            StructLabels = cell(NStruct,1);
            for j=1:NStruct
                StructLabels{j}= [NetProps{i}.Structures(j).Name,'- ',num2str(j)];
            end;
            V = mean(NetProps{i}.NodalClux,2);
            V = squeeze(V);
            View_Nodal_Property(V,StructLabels,['Nodes Clustering Index -- ',NetProps{i}.Name]);
        end;
    end;
    %---------------------------------------------------------------------%
    %----------- Modularity ---------%
    if isfield(NetProps{1},'Modularity')&&ThresBins_flag
        for i=1:NNets
            if Nrep~=1
                Modularity_Index(:,i) = mean(squeeze(NetProps{i}.Modularity))'; %#ok
                Modularity_Index_std(:,i) = std(squeeze(NetProps{i}.Modularity))'; %#ok
            else
                Modularity_Index(:,i) = squeeze(NetProps{i}.Modularity)'; %#ok
            end;
        end;
        h10 = figure;
        % Create axes
        axes1 = axes('Parent',h10,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        Modularity_Index = Modularity_Index(1:ind,:);
        if Nrep==1
            plot(ThresBins,Modularity_Index,'-o','LineWidth',2);
        else
            Modularity_Index_std = Modularity_Index_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),Modularity_Index,Modularity_Index_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Modularity','FontSize',14);
    end; % End Clustering Index
    %---------------------------------------------------------------------%
    %% ----------- Number of Modules ---------%
    if isfield(NetProps{1},'ModulesNumber')&&ThresBins_flag
        for i=1:NNets
            if Nrep~=1
                ModulesNumber(:,i) = mean(squeeze(NetProps{i}.ModulesNumber))'; %#ok
                ModulesNumber_std(:,i) = std(squeeze(NetProps{i}.ModulesNumber))'; %#ok
            else
                ModulesNumber(:,i) = squeeze(NetProps{i}.ModulesNumber)'; %#ok
            end;
        end;
        h10_1 = figure;
        % Create axes
        axes1 = axes('Parent',h10_1,'FontSize',12,'FontWeight','bold'); %#ok
        box('on');
        hold('all');
        ModulesNumber = ModulesNumber(1:ind,:);
        if Nrep==1
            plot(ThresBins,ModulesNumber,'-o','LineWidth',2);
        else
            ModulesNumber_std = ModulesNumber_std(1:ind,:);
            errorbar(repmat(ThresBins,1,NNets),ModulesNumber,ModulesNumber_std,'-o','LineWidth',2);
        end;
        legend(Legend_Text);
        xlabel('Sparsity Degree','FontSize',14);
        ylabel('Number of Modules','FontSize',14);
    end; % End Clustering Index

end;

disp('Showing Network Properties graphs ... Done ! ');
return;