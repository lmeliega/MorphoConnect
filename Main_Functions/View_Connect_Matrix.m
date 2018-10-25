function View_Connect_Matrix(ConnectMatrix,StructLabels,FigColormap,FigTitle,ScaleFlag,ContMatScale)

% This function plot the connectivity matrix
% Syntax :  Morpho_View_Connect_Matrix01(ConnectMatrix,StructLabels,FigColormap,FigTitle)
%
%  Input Parameters:
%     ConnectMatrix : Connectivity Matrix
%     StructLabels : Cell array with labels of the anatomical structures.
%     FigColormap : Char variable that defines the colormap (i.e: 'hot', 'gray')
%         FigTitle : Char variable with the figure title.
%      ScaleFlag  : Flag to indicate that a scale external scale should be used. 
%  ContMatScale : Scale for scaling plot of Connectivity matrices.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, October 7th, 2008
% v.1.0

% Create figure
figure1 = figure('Color',[1 1 1]);

colormap(FigColormap);

NStruct = length(StructLabels);
FigYTicks = 1:1:NStruct;
FigXTicks = 1:1:NStruct;

XLabels = cell(NStruct,1);
step = 2;
for i=1:step:NStruct
    XLabels{i} = num2str(i);
end;
% Create axes
CustomFontSize = 8;
if NStruct>54
    CustomFontSize = 6;
end;
axes1 = axes('Parent',figure1,'ZColor',[1 0 0],...
    'YTickLabel',StructLabels,...
    'YTick',FigYTicks,...
    'YDir','reverse',...
    'YColor',[1 0 0],...
    'XColor',[1 0 0],...
    'Layer','top',...
    'FontWeight','light',...
    'DataAspectRatio',[1 1 1],...
    'Ylim',[0.5,NStruct+0.5],...
    'Xlim',[0.5,NStruct+0.5],...
    'XTickLabel',XLabels,...
    'XTick',FigXTicks,...
    'FontSize',CustomFontSize);
box('on');
hold('all');

% Create image

ConnectMatrix = mean(ConnectMatrix,3);
if exist('ScaleFlag','var')
    imagesc(ConnectMatrix,ContMatScale);
else
    image(ConnectMatrix,'Parent',axes1,'CDataMapping','scaled');
end;

% Create title
title(FigTitle,'FontSize',14,'FontName','Arial');

% Create colorbar
colorbar('peer',axes1,'FontWeight','light');

line([0.5 NStruct+0.5],[ceil(NStruct/2)+0.5 ceil(NStruct/2)+0.5],'LineWidth',2,'Color',[0.3 0.3 0.3]);
line([ceil(NStruct/2)+0.5 ceil(NStruct/2)+0.5],[0.5 NStruct+0.5],'LineWidth',2,'Color',[0.3 0.3 0.3]);

