function Net_Stats = NetProps_compare_groups_Stat_bootstrap(NetProps1,NetProps2,pvalue,Stat)


% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% August 2nd, 2011.

logNnodes1 = NetProps1.logNnodes;
logNnodes2 = NetProps2.logNnodes;


if isfield(NetProps1,'kmean')&&(isfield(NetProps2,'kmean'))
    Nkmean1 = mean(NetProps1.kmean);
    Nkmean2 = mean(NetProps2.kmean);
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

% Cluster Index
if isfield(NetProps1,'Clux')&&(isfield(NetProps2,'Clux'))
    disp('Doing Statistics for Cluster Index ...');
    if ind2trunc==1
        Clux1 = NetProps1.Clux;
        Clux2 = NetProps2.Clux;
        pT = Bootstrap_Test_compare_groups(Clux1',Clux2',pvalue);
        pA = pT;
    else
        Clux1 = NetProps1.Clux;
        Clux1 = Clux1(:,1:ind2trunc);
        Clux2 = NetProps2.Clux;
        Clux2 = Clux2(:,1:ind2trunc);
        AClux1 = trapz(Clux1');
        AClux2 = trapz(Clux2');
        [pA,pUA] = Bootstrap_Test_compare_groups(AClux1,AClux2,pvalue);
        %pU = ranksum(AClux1',AClux2');
        [pT,pU] = Bootstrap_Test_compare_groups(Clux1',Clux2',pvalue);
    end;
    Net_Stats.Clux.T = pU;
    Net_Stats.Clux.AreaStat = pA;
    disp('Statistics for Cluster Index ...  Done!');
end;

% Characteristic Path
if isfield(NetProps1,'CharPathL')&&(isfield(NetProps2,'CharPathL'))
    disp('Doing Statistics for Characteristic Path Length ...');    
    if ind2trunc==1
        CharPathL1 = NetProps1.CharPathL;
        CharPathL2 = NetProps2.CharPathL;
        pT = Bootstrap_Test_compare_groups(CharPathL1',CharPathL2',pvalue);
        pA = pT;
    else
        CharPathL1 = NetProps1.CharPathL;
        CharPathL1 = CharPathL1(:,1:ind2trunc);
        CharPathL2 = NetProps2.CharPathL;
        CharPathL2 = CharPathL2(:,1:ind2trunc);
        ACharPathL1 = trapz(CharPathL1');
        ACharPathL2 = trapz(CharPathL2');
        [pA,pUA] = Bootstrap_Test_compare_groups(ACharPathL1,ACharPathL2,pvalue);
        [pT,pU] = Bootstrap_Test_compare_groups(CharPathL1',CharPathL2',pvalue);
    end;
    Net_Stats.CharPathL.T = pU;
    Net_Stats.CharPathL.AreaStat = pA;
    disp('Statistics for Characteristic Path Length  ...  Done!');
end;

% Local and global Efficiency
if isfield(NetProps1,'Efficiency')&&(isfield(NetProps2,'Efficiency'))
    disp('Doing Statistics for Local Efficiency ...');
    if ind2trunc==1
        Eloc1 = squeeze(NetProps1.Efficiency(1,:,:));
        Eloc2 = squeeze(NetProps2.Efficiency(1,:,:));
        pT = Bootstrap_Test_compare_groups(Eloc1,Eloc2,pvalue);
        pA = pT;
    else
        Eloc1 = squeeze(NetProps1.Efficiency(1,:,:));
        Eloc1 = Eloc1(:,1:ind2trunc);
        Eloc2 = squeeze(NetProps2.Efficiency(1,:,:));
        Eloc2 = Eloc2(:,1:ind2trunc);
        AEloc1 = trapz(Eloc1');
        AEloc2 = trapz(Eloc2');        
        [pA,pUA] = Bootstrap_Test_compare_groups(AEloc1,AEloc2,pvalue);
        [pT,pU] = Bootstrap_Test_compare_groups(Eloc1',Eloc2',pvalue);
    end;
    
    Net_Stats.Elocal.T = pU;
    Net_Stats.Elocal.AreaStat = pA;
    disp('Statistics for Local Efficiency ...  Done!');
    
    disp('Doing Statistics for Global Efficiency ...');
    if ind2trunc==1
        Eglob1 = squeeze(NetProps1.Efficiency(2,:,:));
        Eglob2 = squeeze(NetProps2.Efficiency(2,:,:));
        pT = Bootstrap_Test_compare_groups(Eglob1,Eglob2,pvalue);
        pA = pT;
    else
        Eglob1 = squeeze(NetProps1.Efficiency(2,:,:));
        Eglob1 = Eglob1(:,1:ind2trunc);
        Eglob2 = squeeze(NetProps2.Efficiency(2,:,:));
        Eglob2 = Eglob2(:,1:ind2trunc);
        AEglob1 = trapz(Eglob1');
        AEglob2 = trapz(Eglob2');        
        [pA,pUA] = Bootstrap_Test_compare_groups(AEglob1,AEglob2,pvalue);
        [pT,pU] = Bootstrap_Test_compare_groups(Eglob1',Eglob2',pvalue);
    end;
    Net_Stats.Eglobal.T = pU;
    Net_Stats.Eglobal.AreaStat = pA;
    disp('Statistics for Global Efficiency ...  Done!');
end;

% Small World Properties ...
% if isfield(NetProps1,'SmallWorld')&&(isfield(NetProps2,'SmallWorld'))
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
% if isfield(NetProps1,'NodalEfficiency')&&(isfield(NetProps2,'NodalEfficiency'))&&(isfield(NetProps1_boot,'NodalEfficiency'))&&(isfield(NetProps2_boot,'NodalEfficiency'))
%    disp('Doing Statistics for Nodal Efficiency ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.NodalEfficiency;
%        NodalP2 = NetProps2.NodalEfficiency;
%        NodalP1b = NetProps1_boot.NodalEfficiency;
%        NodalP2b = NetProps2_boot.NodalEfficiency;
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = NodalP1(i,:);
%            NE2 = NodalP2(i,:);
%            NE1b= NodalP1b(i,:)';
%            NE2b= NodalP2b(i,:)';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end; 
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.NodalEfficiency(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.NodalEfficiency(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.NodalEfficiency(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.NodalEfficiency(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.NodalEfficiency.T = pT;
%    Net_Stats.NodalEfficiency.AreaStat = pA;
%    Net_Stats.NodalEfficiency.pmax = pmax;
% 
%    disp('Statistics for Nodal Efficiency ...  Done!');
% end;
% 
% if isfield(NetProps1,'VulnerabilityMat')&&(isfield(NetProps2,'VulnerabilityMat'))&&(isfield(NetProps1_boot,'VulnerabilityMat'))&&(isfield(NetProps2_boot,'VulnerabilityMat'))
%    disp('Doing Statistics for Nodal Vulnerability ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.VulnerabilityMat(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:));
%            NE2 = squeeze(NodalP2(i,:));
%            NE1b= squeeze(NodalP1b(i,:))';
%            NE2b= squeeze(NodalP2b(i,:))';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.VulnerabilityMat(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.VulnerabilityMat(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.Vulnerability.T = pT;
%    Net_Stats.Vulnerability.AreaStat = pA;
%    Net_Stats.Vulnerability.pmax = pmax;
%    
%    disp('Statistics for Nodal Vulnerability ...  Done!'); 
% end;
% 
% if isfield(NetProps1,'CentrBet')&&(isfield(NetProps2,'CentrBet'))&&(isfield(NetProps1_boot,'CentrBet'))&&(isfield(NetProps2_boot,'CentrBet'))
%    disp('Doing Statistics for Nodal Centrality ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.CentrBet;
%        NodalP2 = NetProps2.CentrBet;
%        NodalP1b = NetProps1_boot.CentrBet;
%        NodalP2b = NetProps2_boot.CentrBet;
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:));
%            NE2 = squeeze(NodalP2(i,:));
%            NE1b= squeeze(NodalP1b(i,:))';
%            NE2b= squeeze(NodalP2b(i,:))';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.CentrBet(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.CentrBet(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.CentrBet(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.CentrBet(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.CentrBet.T = pT;
%    Net_Stats.CentrBet.AreaStat = pA;
%    Net_Stats.CentrBet.pmax = pmax;
%    
%    disp('Statistics for Nodal Centrality ...  Done!'); 
% end;
% 
% if isfield(NetProps1,'CentrBetNorm')&&(isfield(NetProps2,'CentrBetNorm'))&&(isfield(NetProps1_boot,'CentrBetNorm'))&&(isfield(NetProps2_boot,'CentrBetNorm'))
%    disp('Doing Statistics for Nodal Normalized Centrality ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.CentrBetNorm;
%        NodalP2 = NetProps2.CentrBetNorm;
%        NodalP1b = NetProps1_boot.CentrBetNorm;
%        NodalP2b = NetProps2_boot.CentrBetNorm;
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:));
%            NE2 = squeeze(NodalP2(i,:));
%            NE1b= squeeze(NodalP1b(i,:))';
%            NE2b= squeeze(NodalP2b(i,:))';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.CentrBetNorm(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.CentrBetNorm(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.CentrBetNorm(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.CentrBetNorm(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.CentrBetNorm.T = pT;
%    Net_Stats.CentrBetNorm.AreaStat = pA;
%    Net_Stats.CentrBetNorm.pmax = pmax;
%    
%    disp('Statistics for Nodal Normalized Centrality ...  Done!'); 
% end;
% 
% if isfield(NetProps1,'NodalClux')&&(isfield(NetProps2,'NodalClux'))&&(isfield(NetProps1_boot,'NodalClux'))&&(isfield(NetProps2_boot,'NodalClux'))
%    disp('Doing Statistics for Nodal Clustering index ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.NodalClux;
%        NodalP2 = NetProps2.NodalClux;
%        NodalP1b = NetProps1_boot.NodalClux;
%        NodalP2b = NetProps2_boot.NodalClux;
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:));
%            NE2 = squeeze(NodalP2(i,:));
%            NE1b= squeeze(NodalP1b(i,:))';
%            NE2b= squeeze(NodalP2b(i,:))';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.NodalClux(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.NodalClux(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.NodalClux(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.NodalClux(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.NodalClux.T = pT;
%    Net_Stats.NodalClux.AreaStat = pA;
%    Net_Stats.NodalClux.pmax = pmax;
%    
%    disp('Statistics for Nodal Clustering Index ...  Done!'); 
% end;
%%% HASTA AQUI
% if isfield(NetProps1,'NodeConnection')&&(isfield(NetProps2,'NodeConnection'))&&(isfield(NetProps1_boot,'NodeConnection'))&&(isfield(NetProps2_boot,'NodeConnection'))
%    disp('Doing Statistics for Nodal Connectivity index ...');
%    if ind2trunc==1
%        NodalP1 = NetProps1.NodeConnection;
%        NodalP2 = NetProps2.NodeConnection;
%        NodalP1b = NetProps1_boot.NodeConnection;
%        NodalP2b = NetProps2_boot.NodeConnection;
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:));
%            NE2 = squeeze(NodalP2(i,:));
%            NE1b= squeeze(NodalP1b(i,:))';
%            NE2b= squeeze(NodalP2b(i,:))';
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%        pA = pT(:);
%    else
%        NodalP1 = NetProps1.NodeConnection(:,:,1:ind2trunc);
%        NodalP2 = NetProps2.NodeConnection(:,:,1:ind2trunc);
%        NodalP1b = NetProps1_boot.NodeConnection(:,:,1:ind2trunc);
%        NodalP2b = NetProps2_boot.NodeConnection(:,:,1:ind2trunc);
%        N = size(NodalP1,1); % Number of Nodes
%        Nsparsity = size(NodalP1b,3);
%        pA = zeros(N,1);
%        pT = zeros(Nsparsity,N);
%        pmax = zeros(N,1);
%        for i=1:N
%            NE1 = squeeze(NodalP1(i,:,:));
%            NE2 = squeeze(NodalP2(i,:,:));
%            NE1b= squeeze(NodalP1b(i,:,:));
%            NE2b= squeeze(NodalP2b(i,:,:));
%            ANodalE1 = trapz(NE1');
%            ANodalE2 = trapz(NE2');
%            ANodalE1b = trapz(NE1b');
%            ANodalE2b = trapz(NE2b');
%            pA(i) = Permutation_Test_compare_groups(ANodalE1',ANodalE2',ANodalE1b',ANodalE2b');
%            [pT(:,i),pmax(i)] = Permutation_Test_compare_groups(NE1,NE2,NE1b,NE2b);
%        end;
%    end;
%    Net_Stats.NodeConnection.T = pT;
%    Net_Stats.NodeConnection.AreaStat = pA;
%    Net_Stats.NodeConnection.pmax = pmax;
%    
%    disp('Statistics for Nodal Connectivity index ...  Done!'); 
% end;

if isfield(NetProps1,'Structures')&&isfield(NetProps2,'Structures')
    Net_Stats.Structures = NetProps1.Structures;
end;

disp('Permutation Test for Network Properties  ...  FINISHED :-)');

return;
