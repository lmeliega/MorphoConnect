function [pmean,pstd,pnC1mean,pnC1std,pnC2mean,pnC2std] = Morpho_callosal_connections(ConnectMatrix,ThresBins,plotflag,thresflag)

% This function calculates the number of callosal connections that survive
% for different sparsity degrees. The result can be plotted if it is requested.
%
% Input Parameters:
%     ConnectMatrix :  Connectivity matrix structure.
%     plotflag : flag to request plotting results.
%    thresflag : Defines if we are working with Network properties Files.
%                For thresflag = false : we introduced a Connectivity struct variable. 
%                    thresflag = true : it is introduced a Network properties variable.
%
% Output Parameters:
%     pmean : mean of the percent of callosal connections for each sparsity degree.
%     pstd : standard deviation of the percent of callosal connections for each sparsity degree.
%     pnC1mean : mean of the percent of interhemispheric connections for each sparsity degree in hemisphere 1.
%     pnC1std : standard deviation of the percent of interhemispheric connections for each sparsity degree in hemisphere 1.
%     pnC2mean : mean of the percent of interhemispheric connections for each sparsity degree in hemisphere 2.
%     pnC2std : standard deviation of the percent of interhemispheric connections for each sparsity degree in hemisphere 2.
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 1st, 2009
% Modified January 5th, 2011.

if isempty(ThresBins)
    ThresBins = 50:2:96;
end;

Nbins = length(ThresBins);

Nrep = size(ConnectMatrix.ConMat,3);
NStruct = size(ConnectMatrix.ConMat,1);
Nhalf = floor(NStruct/2);
ind_struct = Nhalf+1:NStruct;

Ncallosa = zeros(Nbins,Nrep);
Nncallosa1 = zeros(Nbins,Nrep); % Number of non-callosal connections in hemisphere 1.
Nncallosa2 = zeros(Nbins,Nrep); % Number of non-callosal connections in hemisphere 2.

if ~thresflag
    for i=1:Nrep
        tempConMat = abs(ConnectMatrix.ConMat(:,:,i));
        [IsSymmetric,ind] = Issymetric(tempConMat);
        ind = (ind + ind')>0;
        for j=1:Nbins
            percent = ThresBins(j);
            Thresh  = myprctile(tempConMat(ind),percent);
            ConMat = double(tempConMat>Thresh);
            ConMatC = ConMat(1:Nhalf,ind_struct);
            Ncallosa(j,i) = sum(diag(ConMatC));
            ConMatnC = ConMat(1:Nhalf,1:Nhalf);
            Nncallosa1(j,i) = sum(ConMatnC(:));
            ConMatnC = ConMat(ind_struct,ind_struct);
            Nncallosa2(j,i) = sum(ConMatnC(:));
        end;
    end;
else
    % This is for Network properties files.
    for i=1:Nrep
        tempConMat = squeeze(abs(ConnectMatrix.ConMat(:,:,i,1)));
        [IsSymmetric,ind] = Issymetric(tempConMat);
        for j=1:Nbins
            ConMat = squeeze(double(ConnectMatrix.ConMat(:,:,i,j)));
            ConMatC = ConMat(1:Nhalf,ind_struct);
            Ncallosa(j,i) = sum(diag(ConMatC));
            ConMatnC = ConMat(1:Nhalf,1:Nhalf);
            Nncallosa1(j,i) = sum(ConMatnC(:));
            ConMatnC = ConMat(ind_struct,ind_struct);
            Nncallosa2(j,i) = sum(ConMatnC(:));
        end;
    end;
end;

p = 2*Ncallosa/NStruct*100;
pmean = mean(p,2);
pstd = std(p,0,2);

if IsSymmetric
    Ns = Nhalf*(Nhalf-1)/2;
else
    Ns = Nhalf*(Nhalf-1);    
end;
pnC1 = Nncallosa1/Ns*100;
pnC2 = Nncallosa2/Ns*100;
pnC1mean = mean(pnC1,2);
pnC1std = std(pnC1,0,2);
pnC2mean = mean(pnC2,2);
pnC2std = std(pnC2,0,2);

if plotflag
    figure;
    errorbar(ThresBins,pmean,pstd,'-o','LineWidth',2);
    xlabel('Sparsity Degree','FontSize',14);
    ylabel('% of Detected Callosal Connections','FontSize',14);
    figure;
    errorbar(ThresBins,pnC1mean,pnC1std,'-o','LineWidth',2);
    xlabel('Sparsity Degree','FontSize',14);
    ylabel('% of Detected Connections in Hemisphere 1','FontSize',14);
    figure;
    errorbar(ThresBins,pnC2mean,pnC2std,'-o','LineWidth',2);
    xlabel('Sparsity Degree','FontSize',14);
    ylabel('% of Detected Connections in Hemisphere 2','FontSize',14);
end;

return;



