function [Net_Stats,ResultsTable] = NetProps_compare_groups_Stat01(NetProps1,NetProps2,NetProps1_boot,NetProps2_boot,pvalue)


% Lester Melie Garcia
% LREN, CHUV
% Lausanne
% January 26th, 2017.

if ~exist('pvalue','var')
    pvalue=0.1;
end;

logNnodes1 = NetProps1_boot.logNnodes;
logNnodes2 = NetProps2_boot.logNnodes;


if isfield(NetProps1,'kmean')&&(isfield(NetProps2,'kmean'))...
        && (isfield(NetProps1_boot,'kmean'))&&(isfield(NetProps2_boot,'kmean'))
    Nkmean1 = mean(NetProps1_boot.kmean);
    Nkmean2 = mean(NetProps2_boot.kmean);
    ind = find(Nkmean1<=logNnodes1);
    ind2trunc1 = min(ind);    
    ind = find(Nkmean2<=logNnodes2);
    ind2trunc2 = min(ind);    
else
    ind2trunc1 = length(NetProps1_boot.ThresBins);
    ind2trunc2 = length(NetProps2_boot.ThresBins);
end;

if (ind2trunc1==1)&&(ind2trunc2==1)
    ind2trunc = 1;
else
    ind2trunc = min(ind2trunc1,ind2trunc2)-2;
end;

G1_Name = NetProps1.Name; G2_Name = NetProps2.Name;
TableHeader = {'Network Property',G1_Name,G2_Name,'Confidence Interval (95%)','p-value'};
ResultsTable = {};
cr = 0;

% Cluster Index
if isfield(NetProps1,'Clux')&&(isfield(NetProps2,'Clux'))&&(isfield(NetProps1_boot,'Clux'))&&(isfield(NetProps2_boot,'Clux'))
    disp('Doing Statistics for Cluster Index ...');
    Clux1 = NetProps1.Clux;
    Clux1 = Clux1(:,1:ind2trunc);
    Clux2 = NetProps2.Clux;
    Clux2 = Clux2(:,1:ind2trunc);
    Clux1b = NetProps1_boot.Clux;
    Clux1b = Clux1b(:,1:ind2trunc);
    Clux2b = NetProps2_boot.Clux;
    Clux2b = Clux2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(Clux1,Clux2,Clux1b,Clux2b,pvalue,false);
    %[pT,pA] = Permutation_Test_compare_groups01(Clux1,Clux2,Clux1b,Clux2b,false);
    Net_Stats.Clux.p = pT;
    Net_Stats.Clux.pArea = pA;
    Net_Stats.Clux.ci = ci;
    Net_Stats.Clux.ciArea = ciA;
    Net_Stats.Clux.dm = dm;
    Net_Stats.Clux.dbmean= dbmean;
    %Net_Stats.Clux.pmax = pmax;
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Clustering Index',Clux1b,Clux2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;
    disp('Statistics for Cluster Index ...  Done!');
end;

% Characteristic Path
if isfield(NetProps1,'CharPathL')&&(isfield(NetProps2,'CharPathL'))&&(isfield(NetProps1_boot,'CharPathL'))&&(isfield(NetProps2_boot,'CharPathL'))
    disp('Doing Statistics for Characteristic Path Length ...');
    CharPathL1 = NetProps1.CharPathL;
    CharPathL1 = CharPathL1(:,1:ind2trunc);
    CharPathL2 = NetProps2.CharPathL;
    CharPathL2 = CharPathL2(:,1:ind2trunc);
    CharPathL1b = NetProps1_boot.CharPathL;
    CharPathL1b = CharPathL1b(:,1:ind2trunc);
    CharPathL2b = NetProps2_boot.CharPathL;
    CharPathL2b = CharPathL2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(CharPathL1,CharPathL2,CharPathL1b,CharPathL2b,pvalue,false);
    %[pT,pA] = Permutation_Test_compare_groups01(CharPathL1,CharPathL2,CharPathL1b,CharPathL2b,false);
    Net_Stats.CharPathL.p = pT;
    Net_Stats.CharPathL.pArea = pA;
    Net_Stats.CharPathL.ci = ci;
    Net_Stats.CharPathL.ciArea = ciA;
    Net_Stats.CharPathL.dm = dm;
    Net_Stats.CharPathL.dbmean= dbmean;    
    %Net_Stats.CharPathL.pmax = pmax;
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Characteristic Path Length', CharPathL1b,CharPathL2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;
    disp('Statistics for Characteristic Path Length  ...  Done!');
end;

% Target Attack ...
if isfield(NetProps1,'TargetAttack')&&(isfield(NetProps2,'TargetAttack'))&&(isfield(NetProps1_boot,'TargetAttack'))&&(isfield(NetProps2_boot,'TargetAttack'))
    disp('Doing Statistics for Target Attack ...');
    if isfield(NetProps1,'TargetAttackthresbins')
        t = NetProps1.TargetAttackthresbins;
    else
        t = 1:size(NetProps1.TargetAttack,1); t = t/100;
    end;
    t = t(:);
    TAttack1 = NetProps1.TargetAttack(:,:,1:ind2trunc);
    TAttack1 = squeeze(trapz(t,TAttack1,1)); TAttack1=TAttack1(:)';
    TAttack2 = NetProps2.TargetAttack(:,:,1:ind2trunc);
    TAttack2 = squeeze(trapz(t,TAttack2,1)); TAttack2=TAttack2(:)';
    TAttack1b = NetProps1_boot.TargetAttack(:,:,1:ind2trunc);
    TAttack1b = squeeze(trapz(t,TAttack1b,1));
    TAttack2b = NetProps2_boot.TargetAttack(:,:,1:ind2trunc);
    TAttack2b = squeeze(trapz(t,TAttack2b,1));
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(TAttack1,TAttack2,TAttack1b,TAttack2b,pvalue,false);
    Net_Stats.TargetAttack.p = pT;
    Net_Stats.TargetAttack.pArea = pA;
    Net_Stats.TargetAttack.ci = ci;
    Net_Stats.TargetAttack.ciArea = ciA;
    Net_Stats.TargetAttack.dm = dm;
    Net_Stats.TargetAttack.dbmean= dbmean;
    % Adding results to the XLS Table
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Target Attack',TAttack1b, TAttack2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;
    disp('Statistics for Target Attack  ...  Done!');
end;


% Local and global Efficiency
if isfield(NetProps1,'Efficiency')&&(isfield(NetProps2,'Efficiency'))&&(isfield(NetProps1_boot,'Efficiency'))&&(isfield(NetProps2_boot,'Efficiency'))
    % ===== Local efficiency  ===== %
    disp('Doing Statistics for Local Efficiency ...');
    Eloc1 = squeeze(NetProps1.Efficiency(1,:,:))';
    Eloc1 = Eloc1(:,1:ind2trunc);
    Eloc2 = squeeze(NetProps2.Efficiency(1,:,:))';
    Eloc2 = Eloc2(:,1:ind2trunc);
    Eloc1b = squeeze(NetProps1_boot.Efficiency(1,:,:));
    Eloc1b = Eloc1b(:,1:ind2trunc);
    Eloc2b = squeeze(NetProps2_boot.Efficiency(1,:,:));
    Eloc2b = Eloc2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(Eloc1,Eloc2,Eloc1b,Eloc2b,pvalue,false);
    %[pT,pA] = Permutation_Test_compare_groups01(Eloc1, Eloc2,Eloc1b,Eloc2b,false);
    Net_Stats.Elocal.p = pT;
    Net_Stats.Elocal.pArea = pA;
    Net_Stats.Elocal.ci = ci;
    Net_Stats.Elocal.ciArea = ciA;
    Net_Stats.Elocal.dm = dm;
    Net_Stats.Elocal.dbmean= dbmean;       
    %Net_Stats.Elocal.pmax = pmax;
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Local Efficiency',Eloc1b, Eloc2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;     
    disp('Statistics for Local Efficiency ...  Done!');
    % ===== Global efficiency  ===== %
    disp('Doing Statistics for Global Efficiency ...');
    Eglob1 = squeeze(NetProps1.Efficiency(2,:,:))';
    Eglob1 = Eglob1(:,1:ind2trunc);
    Eglob2 = squeeze(NetProps2.Efficiency(2,:,:))';
    Eglob2 = Eglob2(:,1:ind2trunc);    
    Eglob1b = squeeze(NetProps1_boot.Efficiency(2,:,:));
    Eglob1b = Eglob1b(:,1:ind2trunc);
    Eglob2b = squeeze(NetProps2_boot.Efficiency(2,:,:));
    Eglob2b = Eglob2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(Eglob1,Eglob2,Eglob1b,Eglob2b,pvalue,false);
    %[pT,pA] = Permutation_Test_compare_groups01(Eglob1,Eglob2,Eglob1b,Eglob2b,false);
    Net_Stats.Eglobal.p = pT;
    Net_Stats.Eglobal.pArea = pA;
    Net_Stats.Eglobal.ci = ci;
    Net_Stats.Eglobal.ciArea = ciA;
    Net_Stats.Eglobal.dm = dm;
    Net_Stats.Eglobal.dbmean= dbmean;
    %Net_Stats.Eglobal.pmax = pmax;
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Global Efficiency',Eglob1b, Eglob2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;    
    disp('Statistics for Global Efficiency ...  Done!');
end;

% % Small World Properties ...
% if isfield(NetProps1,'SmallWorld')&&(isfield(NetProps2,'SmallWorld'))&&(isfield(NetProps1_boot,'SmallWorld'))&&(isfield(NetProps2_boot,'SmallWorld'))
%     disp('Doing Statistic for Small World properties ...');
%     if ind2trunc==1
%         gamna1 = squeeze(NetProps1.SmallWorld(1,:,:))';
%         gamna2 = squeeze(NetProps2.SmallWorld(1,:,:))';
%         gamna1b = squeeze(NetProps1_boot.SmallWorld(1,:,:))';
%         gamna2b = squeeze(NetProps2_boot.SmallWorld(1,:,:))';
%         flagInf1_gamna1 = sum(isinf(gamna1),2)==0; % Checking for NaN and Inf values
%         flagInf2_gamna2 = sum(isinf(gamna2),2)==0;
%         flagNaN1_gamna1 = sum(isnan(gamna1),2)==0;
%         flagNaN2_gamna2 = sum(isnan(gamna2),2)==0;
%         indf = flagInf1_gamna1 & flagInf2_gamna2 &  flagNaN1_gamna1 & flagNaN2_gamna2;
%         gamna1 = gamna1(indf,:);
%         gamna2 = gamna2(indf,:);
%         [pT,pmax] = Permutation_Test_compare_groups(gamna1,gamna2,gamna1b,gamna2b);
%         pA = pT;
%     else
%         gamna1 = squeeze(NetProps1.SmallWorld(1,:,:))';
%         gamna1 = gamna1(:,1:ind2trunc);
%         gamna2 = squeeze(NetProps2.SmallWorld(1,:,:))';
%         gamna2 = gamna2(:,1:ind2trunc);
%         flagInf1_gamna1 = sum(isinf(gamna1),2)==0; % Checking for NaN and Inf values
%         flagInf2_gamna2 = sum(isinf(gamna2),2)==0;
%         flagNaN1_gamna1 = sum(isnan(gamna1),2)==0;
%         flagNaN2_gamna2 = sum(isnan(gamna2),2)==0;
%         indf = flagInf1_gamna1 & flagInf2_gamna2 &  flagNaN1_gamna1 & flagNaN2_gamna2;
%         gamna1 = gamna1(indf,:);
%         gamna2 = gamna2(indf,:);
%         Agamna1 = trapz(gamna1');
%         Agamna2 = trapz(gamna2');
%         
%         gamna1b = squeeze(NetProps1_boot.SmallWorld(1,:,:));
%         gamna1b = gamna1b(:,1:ind2trunc);
%         gamna2b = squeeze(NetProps2_boot.SmallWorld(1,:,:));
%         gamna2b = gamna2b(:,1:ind2trunc);
%         flagInf1_gamna1b = sum(isinf(gamna1b),2)==0; % Checking for NaN and Inf values
%         flagInf2_gamna2b = sum(isinf(gamna2b),2)==0;
%         flagNaN1_gamna1b = sum(isnan(gamna1b),2)==0;
%         flagNaN2_gamna2b = sum(isnan(gamna2b),2)==0;
%         indf = flagInf1_gamna1b & flagInf2_gamna2b &  flagNaN1_gamna1b & flagNaN2_gamna2b;
%         gamna1b = gamna1b(indf,:);
%         gamna2b = gamna2b(indf,:);
%         Agamna1b = trapz(gamna1b');
%         Agamna2b = trapz(gamna2b');
%         
%         pA = Permutation_Test_compare_groups(Agamna1',Agamna2',Agamna1b',Agamna2b');
%         [pT,pmax] = Permutation_Test_compare_groups(gamna1',gamna2',gamna1b,gamna2b);
%     end;
%     Net_Stats.gamna.T = pT;
%     Net_Stats.gamna.AreaStat = pA;
%     Net_Stats.gamna.pmax = pmax;
%     
%     % ---- Lambda ----- %
%     if ind2trunc==1
%         lambda1 = squeeze(NetProps1.SmallWorld(2,:,:));
%         lambda2 = squeeze(NetProps2.SmallWorld(2,:,:));
%         lambda1b = squeeze(NetProps1_boot.SmallWorld(2,:,:))';
%         lambda2b = squeeze(NetProps2_boot.SmallWorld(2,:,:))';
%         flagInf1_lambda1 = sum(isinf(lambda1),2)==0; % Checking for NaN and Inf values
%         flagInf2_lambda2 = sum(isinf(lambda2),2)==0;
%         flagNaN1_lambda1 = sum(isnan(lambda1),2)==0;
%         flagNaN2_lambda2 = sum(isnan(lambda2),2)==0;
%         indf = flagInf1_lambda1 & flagInf2_lambda2 &  flagNaN1_lambda1 & flagNaN2_lambda2;
%         lambda1 = lambda1(indf,:);
%         lambda2 = lambda2(indf,:);        
%         [pT,pmax] = Permutation_Test_compare_groups(lambda1,lambda2,lambda1b,lambda2b);
%         pA = pT;
%     else
%         lambda1 = squeeze(NetProps1.SmallWorld(2,:,:))';
%         lambda1 = lambda1(:,1:ind2trunc);
%         lambda2 = squeeze(NetProps2.SmallWorld(2,:,:))';
%         lambda2 = lambda2(:,1:ind2trunc);
%         flagInf1_lambda1 = sum(isinf(lambda1),2)==0; % Checking for NaN and Inf values
%         flagInf2_lambda2 = sum(isinf(lambda2),2)==0;
%         flagNaN1_lambda1 = sum(isnan(lambda1),2)==0;
%         flagNaN2_lambda2 = sum(isnan(lambda2),2)==0;
%         indf = flagInf1_lambda1 & flagInf2_lambda2 &  flagNaN1_lambda1 & flagNaN2_lambda2;
%         lambda1 = lambda1(indf,:);
%         lambda2 = lambda2(indf,:);
%         Alambda1 = trapz(lambda1');
%         Alambda2 = trapz(lambda2');
%         
%         lambda1b = squeeze(NetProps1_boot.SmallWorld(2,:,:));
%         lambda1b = lambda1b(:,1:ind2trunc);
%         lambda2b = squeeze(NetProps2_boot.SmallWorld(2,:,:));
%         lambda2b = lambda2b(:,1:ind2trunc);
%         flagInf1_lambda1b = sum(isinf(lambda1b),2)==0; % Checking for NaN and Inf values
%         flagInf2_lambda2b = sum(isinf(lambda2b),2)==0;
%         flagNaN1_lambda1b = sum(isnan(lambda1b),2)==0;
%         flagNaN2_lambda2b = sum(isnan(lambda2b),2)==0;
%         indf = flagInf1_lambda1b & flagInf2_lambda2b &  flagNaN1_lambda1b & flagNaN2_lambda2b;
%         lambda1b = lambda1b(indf,:);
%         lambda2b = lambda2b(indf,:);
%         Alambda1b = trapz(lambda1b');
%         Alambda2b = trapz(lambda2b');
%         
%         pA = Permutation_Test_compare_groups(Alambda1',Alambda2',Alambda1b',Alambda2b');
%         [pT,pmax] = Permutation_Test_compare_groups(lambda1',lambda2',lambda1b,lambda2b);
%     end;
%     Net_Stats.lambda.T = pT;
%     Net_Stats.lambda.AreaStat = pA;
%     Net_Stats.lambda.pmax = pmax;
%     % ---- Sigma ----- %
%     if ind2trunc==1
%         sigma1 = squeeze(NetProps1.SmallWorld(3,:,:));
%         sigma2 = squeeze(NetProps2.SmallWorld(3,:,:));
%         sigma1b = squeeze(NetProps1_boot.SmallWorld(3,:,:))';
%         sigma2b = squeeze(NetProps2_boot.SmallWorld(3,:,:))';
%         flagInf1_sigma1 = sum(isinf(sigma1),2)==0; % Checking for NaN and Inf values
%         flagInf2_sigma2 = sum(isinf(sigma2),2)==0;
%         flagNaN1_sigma1 = sum(isnan(sigma1),2)==0;
%         flagNaN2_sigma2 = sum(isnan(sigma2),2)==0;
%         indf = flagInf1_sigma1 & flagInf2_sigma2 &  flagNaN1_sigma1 & flagNaN2_sigma2;
%         sigma1 = sigma1(indf,:);
%         sigma2 = sigma2(indf,:);        
%         [pT,pmax] = Permutation_Test_compare_groups(sigma1,sigma2,sigma1b,sigma2b);
%         pA = pT;
%     else
%         sigma1 = squeeze(NetProps1.SmallWorld(3,:,:))';
%         sigma1 = sigma1(:,1:ind2trunc);
%         sigma2 = squeeze(NetProps2.SmallWorld(3,:,:))';
%         sigma2 = sigma2(:,1:ind2trunc);
%         flagInf1_sigma1 = sum(isinf(sigma1),2)==0; % Checking for NaN and Inf values
%         flagInf2_sigma2 = sum(isinf(sigma2),2)==0;
%         flagNaN1_sigma1 = sum(isnan(sigma1),2)==0;
%         flagNaN2_sigma2 = sum(isnan(sigma2),2)==0;
%         indf = flagInf1_sigma1 & flagInf2_sigma2 &  flagNaN1_sigma1 & flagNaN2_sigma2;
%         sigma1 = sigma1(indf,:);
%         sigma2 = sigma2(indf,:);
%         Asigma1 = trapz(sigma1');
%         Asigma2 = trapz(sigma2');
%         
%         sigma1b = squeeze(NetProps1_boot.SmallWorld(3,:,:));
%         sigma1b = sigma1b(:,1:ind2trunc);
%         sigma2b = squeeze(NetProps2_boot.SmallWorld(3,:,:));
%         sigma2b = sigma2b(:,1:ind2trunc);
%         flagInf1_sigma1b = sum(isinf(sigma1b),2)==0; % Checking for NaN and Inf values
%         flagInf2_sigma2b = sum(isinf(sigma2b),2)==0;
%         flagNaN1_sigma1b = sum(isnan(sigma1b),2)==0;
%         flagNaN2_sigma2b = sum(isnan(sigma2b),2)==0;
%         indf = flagInf1_sigma1b & flagInf2_sigma2b &  flagNaN1_sigma1b & flagNaN2_sigma2b;
%         sigma1b = sigma1b(indf,:);
%         sigma2b = sigma2b(indf,:);
%         Asigma1b = trapz(sigma1b');
%         Asigma2b = trapz(sigma2b');
%         
%         pA = Permutation_Test_compare_groups(Asigma1',Asigma2',Asigma1b',Asigma2b');
%         [pT,pmax] = Permutation_Test_compare_groups(sigma1',sigma2',sigma1b,sigma2b);
%     end;
%     Net_Stats.sigma.T = pT;
%     Net_Stats.sigma.AreaStat = pA;
%     Net_Stats.sigma.pmax = pmax;
%     disp('Statistics for Small World properties ...  Done!');
% end;
% 
if isfield(NetProps1,'NodalEfficiency')&&(isfield(NetProps2,'NodalEfficiency'))&&(isfield(NetProps1_boot,'NodalEfficiency'))&&(isfield(NetProps2_boot,'NodalEfficiency'))
    disp('Doing Statistics for Nodal Efficiency ...');
    NodalP1 = NetProps1.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2 = NetProps2.NodalEfficiency(:,:,1:ind2trunc);
    NodalP1b = NetProps1_boot.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2b = NetProps2_boot.NodalEfficiency(:,:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.NodalEfficiency.p = pT;
    Net_Stats.NodalEfficiency.pArea = pA;
    Net_Stats.NodalEfficiency.ci = ci;
    Net_Stats.NodalEfficiency.ciArea = ciA;
    Net_Stats.NodalEfficiency.dm = dm;
    Net_Stats.NodalEfficiency.dbmean= dbmean;
    disp('Statistics for Nodal Efficiency ...  Done!');
end;

if isfield(NetProps1,'VulnerabilityMat')&&(isfield(NetProps2,'VulnerabilityMat'))&&(isfield(NetProps1_boot,'VulnerabilityMat'))&&(isfield(NetProps2_boot,'VulnerabilityMat'))
    disp('Doing Statistics for Nodal Vulnerability ...');
    NodalP1 = NetProps1.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2 = NetProps2.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP1b = NetProps1_boot.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2b = NetProps2_boot.VulnerabilityMat(:,:,1:ind2trunc);    
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.VulnerabilityMat.p = pT;
    Net_Stats.VulnerabilityMat.pArea = pA;
    Net_Stats.VulnerabilityMat.ci = ci;
    Net_Stats.VulnerabilityMat.ciArea = ciA;
    Net_Stats.VulnerabilityMat.dm = dm;
    Net_Stats.VulnerabilityMat.dbmean= dbmean;
    disp('Statistics for Nodal Vulnerability ...  Done!');
end;

if isfield(NetProps1,'CentrBet')&&(isfield(NetProps2,'CentrBet'))&&(isfield(NetProps1_boot,'CentrBet'))&&(isfield(NetProps2_boot,'CentrBet'))
    disp('Doing Statistics for Nodal Centrality ...');
    NodalP1 = NetProps1.CentrBet(:,:,1:ind2trunc);
    NodalP2 = NetProps2.CentrBet(:,:,1:ind2trunc);
    NodalP1b = NetProps1_boot.CentrBet(:,:,1:ind2trunc);
    NodalP2b = NetProps2_boot.CentrBet(:,:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.CentrBet.p = pT;
    Net_Stats.CentrBet.pArea = pA;
    Net_Stats.CentrBet.ci = ci;
    Net_Stats.CentrBet.ciArea = ciA;
    Net_Stats.CentrBet.dm = dm;
    Net_Stats.CentrBet.dbmean= dbmean;
    disp('Statistics for Nodal Centrality ...  Done!');
end;

if isfield(NetProps1,'CentrBetNorm')&&(isfield(NetProps2,'CentrBetNorm'))&&(isfield(NetProps1_boot,'CentrBetNorm'))&&(isfield(NetProps2_boot,'CentrBetNorm'))
    disp('Doing Statistics for Nodal Normalized Centrality ...');
    NodalP1 = NetProps1.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2 = NetProps2.CentrBetNorm(:,:,1:ind2trunc);
    NodalP1b = NetProps1_boot.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2b = NetProps2_boot.CentrBetNorm(:,:,1:ind2trunc);
    if ndims(NodalP1b)==3
        [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    else
        [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    end;
    Net_Stats.CentrBetNorm.p = pT;
    Net_Stats.CentrBetNorm.pArea = pA;
    Net_Stats.CentrBetNorm.ci = ci;
    Net_Stats.CentrBetNorm.ciArea = ciA;
    Net_Stats.CentrBetNorm.dm = dm;
    Net_Stats.CentrBetNorm.dbmean= dbmean;    
    disp('Statistics for Nodal Normalized Centrality ...  Done!');
end;

if isfield(NetProps1,'NodalClux')&&(isfield(NetProps2,'NodalClux'))&&(isfield(NetProps1_boot,'NodalClux'))&&(isfield(NetProps2_boot,'NodalClux'))
    disp('Doing Statistics for Nodal Clustering index ...');
    NodalP1 = NetProps1.NodalClux(:,:,1:ind2trunc);
    NodalP2 = NetProps2.NodalClux(:,:,1:ind2trunc);
    NodalP1b = NetProps1_boot.NodalClux(:,:,1:ind2trunc);
    NodalP2b = NetProps2_boot.NodalClux(:,:,1:ind2trunc);    
    if ndims(NodalP1b)==3
        [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    else
        [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    end;      
    Net_Stats.NodalClux.p = pT;
    Net_Stats.NodalClux.pArea = pA;
    Net_Stats.NodalClux.ci = ci;
    Net_Stats.NodalClux.ciArea = ciA;
    Net_Stats.NodalClux.dm = dm;
    Net_Stats.NodalClux.dbmean= dbmean;      
    disp('Statistics for Nodal Clustering Index ...  Done!');
end;

if isfield(NetProps1,'NodeConnection')&&(isfield(NetProps2,'NodeConnection'))&&(isfield(NetProps1_boot,'NodeConnection'))&&(isfield(NetProps2_boot,'NodeConnection'))
    disp('Doing Statistics for Nodal Connectivity index ...');
    NodalP1 = NetProps1.NodeConnection;
    NodalP2 = NetProps2.NodeConnection;
    NodalP1b = NetProps1_boot.NodeConnection;
    NodalP2b = NetProps2_boot.NodeConnection;
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    Net_Stats.NodeConnection.p = pT;
    Net_Stats.NodeConnection.pArea = pA;
    Net_Stats.NodeConnection.ci = ci;
    Net_Stats.NodeConnection.ciArea = ciA;
    Net_Stats.NodeConnection.dm = dm;
    Net_Stats.NodeConnection.dbmean= dbmean;    
    disp('Statistics for Nodal Connectivity index ...  Done!');
end;

if isfield(NetProps1,'GlobalConnectivity')&&(isfield(NetProps2,'GlobalConnectivity'))&&(isfield(NetProps1_boot,'GlobalConnectivity'))&&(isfield(NetProps2_boot,'GlobalConnectivity'))
    disp('Doing Statistics for Global Connectivity ...');
    GlobalC1 = NetProps1.GlobalConnectivity;
    GlobalC2 = NetProps2.GlobalConnectivity;
    GlobalC1b = NetProps1_boot.GlobalConnectivity;
    GlobalC2b = NetProps2_boot.GlobalConnectivity;
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(GlobalC1,GlobalC2,GlobalC1b,GlobalC2b,pvalue,true);
    Net_Stats.GlobalConnectivity.p = pT;
    Net_Stats.GlobalConnectivity.pArea = pA;
    Net_Stats.GlobalConnectivity.ci = ci;
    Net_Stats.GlobalConnectivity.ciArea = ciA;
    Net_Stats.GlobalConnectivity.dm = dm;
    Net_Stats.GlobalConnectivity.dbmean= dbmean;
    % Adding results to the XLS Table
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Global Connectivity',GlobalC1b,GlobalC2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;      
    disp('Statistics for Global Connectivity ...  Done!');
end;
if isfield(NetProps1,'HomologousStructConnection')&&(isfield(NetProps2,'HomologousStructConnection'))&&(isfield(NetProps1_boot,'HomologousStructConnection'))&&(isfield(NetProps2_boot,'HomologousStructConnection'))
    disp('Doing Statistics for Homologous Regions Connectivity ...');
    GlobalC1 = NetProps1.HomologousStructConnection;
    GlobalC2 = NetProps2.HomologousStructConnection;
    GlobalC1b = NetProps1_boot.HomologousStructConnection;
    GlobalC2b = NetProps2_boot.HomologousStructConnection;
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(GlobalC1,GlobalC2,GlobalC1b,GlobalC2b,pvalue,true);
    Net_Stats.HomologousStructConnection.p = pT;
    Net_Stats.HomologousStructConnection.pArea = pA;
    Net_Stats.HomologousStructConnection.ci = ci;
    Net_Stats.HomologousStructConnection.ciArea = ciA;
    Net_Stats.HomologousStructConnection.dm = dm;
    Net_Stats.HomologousStructConnection.dbmean= dbmean;    
    % Adding results to the XLS Table
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Homologous Regions Connectivity',GlobalC1b,GlobalC2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;    
    disp('Statistics for Global Connectivity ...  Done!');
    disp('Statistics for Homologous Regions Connectivity ...  Done!');    
end;
% Modularity
if isfield(NetProps1,'Modularity')&&(isfield(NetProps2,'Modularity'))&&(isfield(NetProps1_boot,'Modularity'))&&(isfield(NetProps2_boot,'Modularity'))
    disp('Doing Statistics for Modularity ...');
    Modularity1 = NetProps1.Modularity;
    Modularity1 = Modularity1(:,1:ind2trunc);
    Modularity2 = NetProps2.Modularity;
    Modularity2 = Modularity2(:,1:ind2trunc);
    Modularity1b = NetProps1_boot.Modularity;
    Modularity1b = Modularity1b(:,1:ind2trunc);
    Modularity2b = NetProps2_boot.Modularity;
    Modularity2b = Modularity2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(Modularity1,Modularity2,Modularity1b,Modularity2b,pvalue,false);    
    Net_Stats.Modularity.p = pT;
    Net_Stats.Modularity.pArea = pA;
    Net_Stats.Modularity.ci = ci;
    Net_Stats.Modularity.ciArea = ciA;
    Net_Stats.Modularity.dm = dm;
    Net_Stats.Modularity.dbmean= dbmean;      
    % Adding results to the XLS Table
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Modularity',Modularity1b,Modularity2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;   
    disp('Statistics for Modularity  ...  Done!');
end;

% Global centrality ...
if isfield(NetProps1,'GlobalCentrBet')&&(isfield(NetProps2,'GlobalCentrBet'))&&(isfield(NetProps1_boot,'GlobalCentrBet'))&&(isfield(NetProps2_boot,'GlobalCentrBet'))
    disp('Doing Statistics for Global Network Centrality ...');
    GlobalCentrBet1 = NetProps1.GlobalCentrBet;
    GlobalCentrBet1 = GlobalCentrBet1(:,1:ind2trunc);
    GlobalCentrBet2 = NetProps2.GlobalCentrBet;
    GlobalCentrBet2 = GlobalCentrBet2(:,1:ind2trunc);
    GlobalCentrBet1b = NetProps1_boot.GlobalCentrBet;
    GlobalCentrBet1b = GlobalCentrBet1b(:,1:ind2trunc);
    GlobalCentrBet2b = NetProps2_boot.GlobalCentrBet;
    GlobalCentrBet2b = GlobalCentrBet2b(:,1:ind2trunc);
    [pT,pA,ci,ciA,dm,dbmean] = Permutation_Test_compare_groups01(GlobalCentrBet1,GlobalCentrBet2,GlobalCentrBet1b,GlobalCentrBet2b,pvalue,false);
    Net_Stats.GlobalCentrBet.p = pT;
    Net_Stats.GlobalCentrBet.pArea = pA;
    Net_Stats.GlobalCentrBet.ci = ci;
    Net_Stats.GlobalCentrBet.ciArea = ciA;
    Net_Stats.GlobalCentrBet.dm = dm;
    Net_Stats.GlobalCentrBet.dbmean= dbmean;   
    %Net_Stats.CharPathL.pmax = pmax;
    % Adding results to the XLS Table
    cr = cr+1;
    NetPropsResultsTable = add2XLSTable('Global Centrality',GlobalCentrBet1b,GlobalCentrBet2b,ciA,pA);
    ResultsTable(cr,:) = NetPropsResultsTable;
    disp('Statistics for Global Network Centrality  ...  Done!');
end;

if isfield(NetProps1,'Structures')&&isfield(NetProps2,'Structures')&&isfield(NetProps1_boot,'Structures')&&isfield(NetProps2_boot,'Structures')
    Net_Stats.Structures = NetProps1.Structures;
end;

Net_Stats.pvalue=pvalue;
Net_Stats.ThresBins=NetProps1_boot.ThresBins(1:ind2trunc);

Net_Stats.ResamplingMethod = 'Permutations';

if ~isempty(ResultsTable)
    ResultsTable = [TableHeader;ResultsTable];
end;

disp('Permutation Test for Network Properties  ...  FINISHED :-)');

end

%%  ======= Internal functions ======== %%
function NetPropsResultsTable = add2XLSTable(NetPropName,C1b,C2b,ciA,pA)

if ~isvector(C1b)
    C1b = trapz(C1b,2);
    C2b = trapz(C2b,2);
end;
Ymean1 = mean(C1b); Ystd1 = std(C1b);
Ymean2 = mean(C2b); Ystd2 = std(C2b);
NetPropsResultsTable{1,1} = NetPropName;
NetPropsResultsTable{1,2} = [num2str(Ymean1),'(',num2str(Ystd1),')'];
NetPropsResultsTable{1,3} = [num2str(Ymean2),'(',num2str(Ystd2),')'];
NetPropsResultsTable{1,4} = ['[',num2str(ciA(1)),',',num2str(ciA(2)),']'];
NetPropsResultsTable{1,5} = num2str(pA);
  
end