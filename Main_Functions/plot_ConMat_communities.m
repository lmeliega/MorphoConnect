function plot_ConMat_communities(ConMat,Comm)

% Lester Melie Garcia
% LREN, Lausanne
% August 17th, 2017 

[X,Y,indsort] = grid_communities(Comm);
CommColors = {'b','g','r','m','c','y','k'};
Comm_ColorTable = [0 0 1;0 0.5 0;1 0 0;1 0 1;0 1 1;1 1 0; 0 0 0];
Comm_Char = {'1','2','3','4','5','6','7'};

Ncomm = max(Comm);
Nstruct = size(ConMat,1);
figure;
imagesc(ConMat(indsort,indsort)); colormap(gray); % colormap(jet);
axis equal;
xlim([1 Nstruct]);
ylim([1 Nstruct]);

X = reshape(X(:),length(X)/Ncomm,Ncomm);
Y = reshape(Y(:),length(Y)/Ncomm,Ncomm);

for i=1:Ncomm
    hold on;
    plot(X(:,i),Y(:,i),'linewidth',4,'Color',Comm_ColorTable(i,:));    
end;

%colormap(Comm_ColorTable)
% ch = colorbar;
% Comm_ColorTable = Comm_ColorTable(1:Ncomm,:);
% set(ch,'ColorOrder',Comm_ColorTable);
% set(ch,'YTickLabel',char(Comm_Char(1:Ncomm)));

end