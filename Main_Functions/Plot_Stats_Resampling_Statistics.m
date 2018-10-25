function Plot_Stats_Resampling_Statistics(NetStat_ci,NetStat_thresbins,NetStat_mean,NetStat_mean_ciArea,Netprop_Label,dm)

%% 
%% Lester Melie-Garcia
% LREN, CHUV. 
% Lausanne, February 12th, 2017

figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',14);
box('on');
hold('all');
jbfill(NetStat_thresbins,NetStat_ci(2,:),NetStat_ci(1,:),'k');%0);
hold on;
if isempty(dm)
    XData1 = [min(NetStat_thresbins) max(NetStat_thresbins)];
    YData1 = [0,0];
    line(XData1,YData1,'Parent',axes1,'LineWidth',2,'LineStyle','--','Color',[0 0 0]);
else
    plot(NetStat_thresbins,dm,'Color',[0 0 0],'MarkerFaceColor',[0 0 0],'Marker','o','LineStyle','none')
end;
hold on;
plot(NetStat_thresbins,NetStat_mean,'k','LineWidth',3);
xlabel({'Sparsity Degree'},'FontWeight','bold','FontSize',14,...
    'FontName','Century Gothic');
ylabel({'Differences between Groups'},'FontWeight','bold','FontSize',14,'FontName','Century Gothic');
FigureTitle={[Netprop_Label,' ->','  ','AUC Conf. Interv.: (',num2str(NetStat_mean_ciArea(1)),',',num2str(NetStat_mean_ciArea(2)),')']};

title(FigureTitle,'FontWeight','bold','FontSize',16,'FontName','Century Gothic');

end