function Net_Stats = NetProps_Area_Statistic(NetProps1,NetProps2,Npermut,StatType,PlotFig)

% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 31st, 2009.

Net_Stats = [];

switch StatType
    case 1
        StatTypeLabel = 'T-Student';
    case 2
        StatTypeLabel = 'Absolute_Differences';
end;

logNnodes1 = NetProps1.logNnodes;
logNnodes2 = NetProps2.logNnodes;
if isfield(NetProps1,'kmean')&&(isfield(NetProps2,'kmean'))...
        && (isfield(NetProps1_boot,'kmean'))&&(isfield(NetProps2_boot,'kmean'))
    Nkmean1 = mean(NetProps1_boot.kmean);
    Nkmean2 = mean(NetProps2_boot.kmean);
    ind = find(Nkmean1<=logNnodes1);
    ind2trunc1 = min(ind);    
    ind = find(Nkmean2<=logNnodes2);
    ind2trunc2 = min(ind);    
else
    ind2trunc1 = length(NetProps1.ThresBins);
    ind2trunc2 = length(NetProps2.ThresBins);
end;

if (ind2trunc1==1)&&(ind2trunc2==1)
    ind2trunc = 1;
else
    ind2trunc = min(ind2trunc1,ind2trunc2)-2;
end;

Net_Stats.StatType = StatTypeLabel;
% Cluster Index
if isfield(NetProps1,'Clux')&&(isfield(NetProps2,'Clux'))
    disp('Doing Statistic for Cluster Index ...');
    Clux1 = NetProps1.Clux;
    Clux1 = Clux1(:,1:ind2trunc);
    Clux2 = NetProps2.Clux;
    Clux2 = Clux2(:,1:ind2trunc);
    AClux1 = trapz(Clux1');
    AClux2 = trapz(Clux2');
    pA = Permutation_Test(AClux1',AClux2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(Clux1,Clux2,Npermut,StatType);
    Net_Stats.Clux.T = pT;
    Net_Stats.Clux.AreaStat = pA;
    Net_Stats.Clux.pmax = pmax;
    disp('Statistic for Cluster Index ...  Done!');
    %if PlotFig
    %    figure();
    %end;
end;

% Characteristic Path
if isfield(NetProps1,'CharPathL')&&(isfield(NetProps2,'CharPathL'))
    disp('Doing Statistic for Characteristic Path Length ...');
    CharPathL1 = NetProps1.CharPathL;
    CharPathL1 = CharPathL1(:,1:ind2trunc);
    CharPathL2 = NetProps2.CharPathL;
    CharPathL2 = CharPathL2(:,1:ind2trunc);
    
    ACharPathL1 = trapz(CharPathL1');
    ACharPathL2 = trapz(CharPathL2');
    pA = Permutation_Test(ACharPathL1',ACharPathL2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(CharPathL1,CharPathL2,Npermut,StatType);
    Net_Stats.CharPathL.T = pT;
    Net_Stats.CharPathL.AreaStat = pA;
    Net_Stats.CharPathL.pmax = pmax;
    disp('Statistic for Characteristic Path Length  ...  Done!');
end;

% Local and global Efficiency
if isfield(NetProps1,'Efficiency')&&(isfield(NetProps2,'Efficiency'))
    disp('Doing Statistic for Local Efficiency ...');
    Eloc1 = squeeze(NetProps1.Efficiency(1,:,:));
    Eloc1 = Eloc1(:,1:ind2trunc);
    Eloc2 = squeeze(NetProps2.Efficiency(1,:,:));
    Eloc2 = Eloc2(:,1:ind2trunc);
    AEloc1 = trapz(Eloc1');
    AEloc2 = trapz(Eloc2');
    pA = Permutation_Test(AEloc1',AEloc2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(Eloc1,Eloc2,Npermut,StatType);
    Net_Stats.Elocal.T = pT;
    Net_Stats.Elocal.AreaStat = pA;
    Net_Stats.Elocal.pmax = pmax;
    disp('Statistic for Local Efficiency ...  Done!');
    
    disp('Doing Statistic for Global Efficiency ...');
    Eglob1 = squeeze(NetProps1.Efficiency(2,:,:));
    Eglob1 = Eglob1(:,1:ind2trunc);
    Eglob2 = squeeze(NetProps2.Efficiency(2,:,:));
    Eglob2 = Eglob2(:,1:ind2trunc);
    AEglob1 = trapz(Eglob1');
    AEglob2 = trapz(Eglob2');
    pA = Permutation_Test(AEglob1',AEglob2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(Eglob1,Eglob2,Npermut,StatType);
    Net_Stats.Eglobal.T = pT;
    Net_Stats.Eglobal.AreaStat = pA;
    Net_Stats.Eglobal.pmax = pmax;
    disp('Statistic for Global Efficiency ...  Done!');    
end;

% Small World Properties ...
if isfield(NetProps1,'SmallWorld')&&(isfield(NetProps2,'SmallWorld'))
    disp('Doing Statistic for Small World properties ...');
    gamna1 = squeeze(NetProps1.SmallWorld(1,:,:));
    gamna1 = gamna1(:,1:ind2trunc);
    gamna2 = squeeze(NetProps2.SmallWorld(1,:,:));
    gamna2 = gamna2(:,1:ind2trunc);
    flagInf1_gamna1 = sum(isinf(gamna1),2)==0; % Checking for NaN and Inf values
    flagInf2_gamna2 = sum(isinf(gamna2),2)==0;
    flagNaN1_gamna1 = sum(isnan(gamna1),2)==0;
    flagNaN2_gamna2 = sum(isnan(gamna2),2)==0;
    indf = flagInf1_gamna1 & flagInf2_gamna2 &  flagNaN1_gamna1 & flagNaN2_gamna2;
    gamna1 = gamna1(indf,:);
    gamna2 = gamna2(indf,:);
    Agamna1 = trapz(gamna1');
    Agamna2 = trapz(gamna2');
    pA = Permutation_Test(Agamna1',Agamna2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(gamna1,gamna2,Npermut,StatType);
    Net_Stats.gamna.T = pT;
    Net_Stats.gamna.AreaStat = pA;
    Net_Stats.gamna.pmax = pmax;
    
    lambda1 = squeeze(NetProps1.SmallWorld(2,:,:));
    lambda1 = lambda1(:,1:ind2trunc);
    lambda2 = squeeze(NetProps2.SmallWorld(2,:,:));
    lambda2 = lambda2(:,1:ind2trunc);
    flagInf1_lambda1 = sum(isinf(lambda1),2)==0; % Checking for NaN and Inf values
    flagInf2_lambda2 = sum(isinf(lambda2),2)==0;
    flagNaN1_lambda1 = sum(isnan(lambda1),2)==0;
    flagNaN2_lambda2 = sum(isnan(lambda2),2)==0;
    indf = flagInf1_lambda1 & flagInf2_lambda2 &  flagNaN1_lambda1 & flagNaN2_lambda2;
    lambda1 = lambda1(indf,:);
    lambda2 = lambda2(indf,:);    
    Alambda1 = trapz(lambda1');
    Alambda2 = trapz(lambda2');
    pA = Permutation_Test(Alambda1',Alambda2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(lambda1,lambda2,Npermut,StatType);
    Net_Stats.lambda.T = pT;
    Net_Stats.lambda.AreaStat = pA;
    Net_Stats.lambda.pmax = pmax;
    
    sigma1 = squeeze(NetProps1.SmallWorld(3,:,:));
    sigma1 = sigma1(:,1:ind2trunc);
    sigma2 = squeeze(NetProps2.SmallWorld(3,:,:));
    sigma2 = sigma2(:,1:ind2trunc);
    flagInf1_sigma1 = sum(isinf(sigma1),2)==0; % Checking for NaN and Inf values
    flagInf2_sigma2 = sum(isinf(sigma2),2)==0;
    flagNaN1_sigma1 = sum(isnan(sigma1),2)==0;
    flagNaN2_sigma2 = sum(isnan(sigma2),2)==0;
    indf = flagInf1_sigma1 & flagInf2_sigma2 &  flagNaN1_sigma1 & flagNaN2_sigma2;
    sigma1 = sigma1(indf,:);
    sigma2 = sigma2(indf,:);    
    Asigma1 = trapz(sigma1');
    Asigma2 = trapz(sigma2');
    
    pA = Permutation_Test(Asigma1',Asigma2',Npermut,StatType);
    [pT,pmax] = Permutation_Test(sigma1,sigma2,Npermut,StatType);
    Net_Stats.sigma.T = pT;
    Net_Stats.sigma.AreaStat = pA;
    Net_Stats.sigma.pmax = pmax;
    disp('Statistic for Small World properties ...  Done!'); 
end;

if isfield(NetProps1,'Structures')&&isfield(NetProps2,'Structures')
    Net_Stats.Structures = NetProps1.Structures;
end;

disp('Permutation Test for Network Properties  ...  FINISHED :-)');

return;