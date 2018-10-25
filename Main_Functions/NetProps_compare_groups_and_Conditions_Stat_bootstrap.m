function Net_Stats = NetProps_compare_groups_and_Conditions_Stat_bootstrap(NetProps1_C1,NetProps2_C1,NetProps1_C2,NetProps2_C2, ...
                                                                           NetProps1_boot_C1,NetProps2_boot_C1,NetProps1_boot_C2,NetProps2_boot_C2,pvalue)

% Lester Melie Garcia
% LREN, CHUV
% Lausanne
% February 28th, 2017.

if ~exist('pvalue','var')
    pvalue=0.1;
end;

logNnodes1 = NetProps1_boot_C1.logNnodes;
logNnodes2 = NetProps2_boot_C1.logNnodes;

if (isfield(NetProps1_C1,'kmean'))&&(isfield(NetProps2_C1,'kmean'))&&(isfield(NetProps1_boot_C1,'kmean'))&&(isfield(NetProps2_boot_C1,'kmean'))&& ...
   (isfield(NetProps1_C2,'kmean'))&&(isfield(NetProps2_C2,'kmean'))&&(isfield(NetProps1_boot_C2,'kmean'))&&(isfield(NetProps2_boot_C2,'kmean'))      
    Nkmean1 = mean(NetProps1_boot.kmean);
    Nkmean2 = mean(NetProps2_boot.kmean);
    ind = find(Nkmean1<=logNnodes1);
    ind2trunc1 = min(ind);    
    ind = find(Nkmean2<=logNnodes2);
    ind2trunc2 = min(ind);    
else
    ind2trunc1 = length(NetProps1_boot_C1.ThresBins);
    ind2trunc2 = length(NetProps2_boot_C1.ThresBins);
end;

if (ind2trunc1==1)&&(ind2trunc2==1)
    ind2trunc = 1;
else
    ind2trunc = min(ind2trunc1,ind2trunc2)-2;
end;
Structures=NetProps1_C1.Structures;
if iscell(Structures)
    Structures=Structures(:,1);
else
    NStruct=length(Structures);
    StructuresTemp=cell(NStruct,1);
    for i=1:NStruct
        StructuresTemp(i)={Structures(i).Name};
    end;
    Structures=StructuresTemp;
end;

Net_Stats.Group1_Condition1=NetProps1_C1.Name;
Net_Stats.Group1_Condition2=NetProps1_C2.Name;
Net_Stats.Group2_Condition1=NetProps2_C1.Name;
Net_Stats.Group2_Condition2=NetProps2_C2.Name;
% Cluster Index
if (isfield(NetProps1_C1,'Clux'))&&(isfield(NetProps2_C1,'Clux'))&&(isfield(NetProps1_boot_C1,'Clux'))&&(isfield(NetProps2_boot_C1,'Clux'))&& ...
   (isfield(NetProps1_C2,'Clux'))&&(isfield(NetProps2_C2,'Clux'))&&(isfield(NetProps1_boot_C2,'Clux'))&&(isfield(NetProps2_boot_C2,'Clux'))
    disp('Doing Statistics for Cluster Index ...');
    % Group 1 and Group 2 Condition 1
    Clux1_C1 = NetProps1_C1.Clux;
    Clux1_C1 = Clux1_C1(:,1:ind2trunc);
    Clux2_C1 = NetProps2_C1.Clux;
    Clux2_C1 = Clux2_C1(:,1:ind2trunc);
    Clux1b_C1 = NetProps1_boot_C1.Clux;
    Clux1b_C1 = Clux1b_C1(:,1:ind2trunc);
    Clux2b_C1 = NetProps2_boot_C1.Clux;
    Clux2b_C1 = Clux2b_C1(:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    Clux1_C2 = NetProps1_C2.Clux;
    Clux1_C2 = Clux1_C2(:,1:ind2trunc);
    Clux2_C2 = NetProps2_C2.Clux;
    Clux2_C2 = Clux2_C2(:,1:ind2trunc);
    Clux1b_C2 = NetProps1_boot_C2.Clux;
    Clux1b_C2 = Clux1b_C2(:,1:ind2trunc);
    Clux2b_C2 = NetProps2_boot_C2.Clux;
    Clux2b_C2 = Clux2b_C2(:,1:ind2trunc);

    Clux1=Clux1_C1-Clux2_C1; % group differences condition 1
    Clux2=Clux1_C2-Clux2_C2; % group differences condition 2
    Clux1b=Clux1b_C1-Clux2b_C1;
    Clux2b=Clux1b_C2-Clux2b_C2;    
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Clux1,Clux2,Clux1b,Clux2b,pvalue,false);
    Net_Stats.Clux.Conditions.p = pT;
    Net_Stats.Clux.Conditions.pArea = pA;
    Net_Stats.Clux.Conditions.ci = ci;
    Net_Stats.Clux.Conditions.ciArea = ciA;
    Net_Stats.Clux.Conditions.dm = dm;
    Net_Stats.Clux.Conditions.dbmean= dbmean;

    Clux1=Clux1_C1-Clux1_C2; % conditions differences group 1
    Clux2=Clux2_C1-Clux2_C2; % conditions differences group 2
    Clux1b=Clux1b_C1-Clux1b_C2;
    Clux2b=Clux2b_C1-Clux2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Clux1,Clux2,Clux1b,Clux2b,pvalue,false);
    Net_Stats.Clux.Groups.p = pT;
    Net_Stats.Clux.Groups.pArea = pA;
    Net_Stats.Clux.Groups.ci = ci;
    Net_Stats.Clux.Groups.ciArea = ciA;
    Net_Stats.Clux.Groups.dm = dm;
    Net_Stats.Clux.Groups.dbmean= dbmean;

    disp('Statistics for Cluster Index ...  Done!');
end;

% Characteristic Path
if (isfield(NetProps1_C1,'CharPathL'))&&(isfield(NetProps2_C1,'CharPathL'))&&(isfield(NetProps1_boot_C1,'CharPathL'))&&(isfield(NetProps2_boot_C1,'CharPathL'))&& ...
   (isfield(NetProps1_C2,'CharPathL'))&&(isfield(NetProps2_C2,'CharPathL'))&&(isfield(NetProps1_boot_C2,'CharPathL'))&&(isfield(NetProps2_boot_C2,'CharPathL'))
    disp('Doing Statistics for Characteristic Path Length ...');
   % Group 1 and Group 2 Condition 1
    CharPathL1_C1 = NetProps1_C1.CharPathL;
    CharPathL1_C1 = CharPathL1_C1(:,1:ind2trunc);
    CharPathL2_C1 = NetProps2_C1.CharPathL;
    CharPathL2_C1 = CharPathL2_C1(:,1:ind2trunc);
    CharPathL1b_C1 = NetProps1_boot_C1.CharPathL;
    CharPathL1b_C1 = CharPathL1b_C1(:,1:ind2trunc);
    CharPathL2b_C1 = NetProps2_boot_C1.CharPathL;
    CharPathL2b_C1 = CharPathL2b_C1(:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    CharPathL1_C2 = NetProps1_C2.Clux;
    CharPathL1_C2 = CharPathL1_C2(:,1:ind2trunc);
    CharPathL2_C2 = NetProps2_C2.Clux;
    CharPathL2_C2 = CharPathL2_C2(:,1:ind2trunc);
    CharPathL1b_C2 = NetProps1_boot_C2.CharPathL;
    CharPathL1b_C2 = CharPathL1b_C2(:,1:ind2trunc);
    CharPathL2b_C2 = NetProps2_boot_C2.CharPathL;
    CharPathL2b_C2 = CharPathL2b_C2(:,1:ind2trunc);   
    
    CharPathL1=CharPathL1_C1-CharPathL2_C1; % group differences condition 1
    CharPathL2=CharPathL1_C2-CharPathL2_C2; % group differences condition 2
    CharPathL1b=CharPathL1b_C1-CharPathL2b_C1;
    CharPathL2b=CharPathL1b_C2-CharPathL2b_C2;    
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(CharPathL1,CharPathL2,CharPathL1b,CharPathL2b,pvalue,false);
    Net_Stats.CharPathL.Conditions.p = pT;
    Net_Stats.CharPathL.Conditions.pArea = pA;
    Net_Stats.CharPathL.Conditions.ci = ci;
    Net_Stats.CharPathL.Conditions.ciArea = ciA;
    Net_Stats.CharPathL.Conditions.dm = dm;
    Net_Stats.CharPathL.Conditions.dbmean= dbmean;
    
    CharPathL1=CharPathL1_C1-CharPathL1_C2; % conditions differences group 1
    CharPathL2=CharPathL2_C1-CharPathL2_C2; % conditions differences group 2
    CharPathL1b=CharPathL1b_C1-CharPathL1b_C2;
    CharPathL2b=CharPathL2b_C1-CharPathL2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(CharPathL1,CharPathL2,CharPathL1b,CharPathL2b,pvalue,false);
    Net_Stats.CharPathL.Groups.p = pT;
    Net_Stats.CharPathL.Groups.pArea = pA;
    Net_Stats.CharPathL.Groups.ci = ci;
    Net_Stats.CharPathL.Groups.ciArea = ciA;
    Net_Stats.CharPathL.Groups.dm = dm;
    Net_Stats.CharPathL.Groups.dbmean= dbmean; 
    
    %Net_Stats.CharPathL.pmax = pmax;
    disp('Statistics for Characteristic Path Length  ...  Done!');
end;

% Local and global Efficiency
if (isfield(NetProps1_C1,'Efficiency'))&&(isfield(NetProps2_C1,'Efficiency'))&&(isfield(NetProps1_boot_C1,'Efficiency'))&&(isfield(NetProps2_boot_C1,'Efficiency'))&& ...
   (isfield(NetProps1_C2,'Efficiency'))&&(isfield(NetProps2_C2,'Efficiency'))&&(isfield(NetProps1_boot_C2,'Efficiency'))&&(isfield(NetProps2_boot_C2,'Efficiency'))
    % ===== Local efficiency  ===== %
    disp('Doing Statistics for Local Efficiency ...');
    % Group 1 and Group 2 Condition 1
    Eloc1_C1 = squeeze(NetProps1_C1.Efficiency(1,:,:))';
    Eloc1_C1 = Eloc1_C1(:,1:ind2trunc);
    Eloc2_C1 = squeeze(NetProps2_C1.Efficiency(1,:,:))';
    Eloc2_C1 = Eloc2_C1(:,1:ind2trunc);
    Eloc1b_C1 = squeeze(NetProps1_boot_C1.Efficiency(1,:,:));
    Eloc1b_C1 = Eloc1b_C1(:,1:ind2trunc);
    Eloc2b_C1 = squeeze(NetProps2_boot_C1.Efficiency(1,:,:));
    Eloc2b_C1 = Eloc2b_C1(:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    Eloc1_C2 = squeeze(NetProps1_C2.Efficiency(1,:,:))';
    Eloc1_C2 = Eloc1_C2(:,1:ind2trunc);
    Eloc2_C2 = squeeze(NetProps2_C2.Efficiency(1,:,:))';
    Eloc2_C2 = Eloc2_C2(:,1:ind2trunc);
    Eloc1b_C2 = squeeze(NetProps1_boot_C2.Efficiency(1,:,:));
    Eloc1b_C2 = Eloc1b_C2(:,1:ind2trunc);
    Eloc2b_C2 = squeeze(NetProps2_boot_C2.Efficiency(1,:,:));
    Eloc2b_C2 = Eloc2b_C2(:,1:ind2trunc);
    
    Eloc1=Eloc1_C1-Eloc2_C1; % group differences condition 1
    Eloc2=Eloc1_C2-Eloc2_C2; % group differences condition 2
    Eloc1b=Eloc1b_C1-Eloc2b_C1;
    Eloc2b=Eloc1b_C2-Eloc2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Eloc1,Eloc2,Eloc1b,Eloc2b,pvalue,false);
    Net_Stats.Elocal.Conditions.p = pT;
    Net_Stats.Elocal.Conditions.pArea = pA;
    Net_Stats.Elocal.Conditions.ci = ci;
    Net_Stats.Elocal.Conditions.ciArea = ciA;
    Net_Stats.Elocal.Conditions.dm = dm;
    Net_Stats.Elocal.Conditions.dbmean= dbmean;    
    
    Eloc1=Eloc1_C1-Eloc1_C2; % conditions differences group 1
    Eloc2=Eloc2_C1-Eloc2_C2; % conditions differences group 2
    Eloc1b=Eloc1b_C1-Eloc1b_C2;
    Eloc2b=Eloc2b_C1-Eloc2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Eloc1,Eloc2,Eloc1b,Eloc2b,pvalue,false);
    Net_Stats.Elocal.Groups.p = pT;
    Net_Stats.Elocal.Groups.pArea = pA;
    Net_Stats.Elocal.Groups.ci = ci;
    Net_Stats.Elocal.Groups.ciArea = ciA;
    Net_Stats.Elocal.Groups.dm = dm;
    Net_Stats.Elocal.Groups.dbmean= dbmean; 
    
    disp('Statistics for Local Efficiency ...  Done!');
    
    % ===== Global efficiency  ===== %
    disp('Doing Statistics for Global Efficiency ...');
    % Group 1 and Group 2 Condition 1
    Eglob1_C1 = squeeze(NetProps1_C1.Efficiency(2,:,:))';
    Eglob1_C1 = Eglob1_C1(:,1:ind2trunc);
    Eglob2_C1 = squeeze(NetProps2_C1.Efficiency(2,:,:))';
    Eglob2_C1 = Eglob2_C1(:,1:ind2trunc);
    Eglob1b_C1 = squeeze(NetProps1_boot_C1.Efficiency(2,:,:));
    Eglob1b_C1 = Eglob1b_C1(:,1:ind2trunc);
    Eglob2b_C1 = squeeze(NetProps2_boot_C1.Efficiency(2,:,:));
    Eglob2b_C1 = Eglob2b_C1(:,1:ind2trunc);     
    % Group 1 and Group 2 Condition 2
    Eglob1_C2 = squeeze(NetProps1_C2.Efficiency(2,:,:))';
    Eglob1_C2 = Eglob1_C2(:,1:ind2trunc);
    Eglob2_C2 = squeeze(NetProps2_C2.Efficiency(2,:,:))';
    Eglob2_C2 = Eglob2_C2(:,1:ind2trunc);
    Eglob1b_C2 = squeeze(NetProps1_boot_C2.Efficiency(2,:,:));
    Eglob1b_C2 = Eglob1b_C2(:,1:ind2trunc);
    Eglob2b_C2 = squeeze(NetProps2_boot_C2.Efficiency(2,:,:));
    Eglob2b_C2 = Eglob2b_C2(:,1:ind2trunc);      
    
    Eglob1=Eglob1_C1-Eglob2_C1; % group differences condition 1
    Eglob2=Eglob1_C2-Eglob2_C2; % group differences condition 2
    Eglob1b=Eglob1b_C1-Eglob2b_C1;
    Eglob2b=Eglob1b_C2-Eglob2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Eglob1,Eglob2,Eglob1b,Eglob2b,pvalue,false);
    Net_Stats.Eglobal.Conditions.p = pT;
    Net_Stats.Eglobal.Conditions.pArea = pA;
    Net_Stats.Eglobal.Conditions.ci = ci;
    Net_Stats.Eglobal.Conditions.ciArea = ciA;
    Net_Stats.Eglobal.Conditions.dm = dm;
    Net_Stats.Eglobal.Conditions.dbmean= dbmean; 
    
    Eglob1=Eglob1_C1-Eglob1_C2; % conditions differences group 1
    Eglob2=Eglob2_C1-Eglob2_C2; % conditions differences group 2
    Eglob1b=Eglob1b_C1-Eglob1b_C2;
    Eglob2b=Eglob2b_C1-Eglob2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(Eglob1,Eglob2,Eglob1b,Eglob2b,pvalue,false);
    Net_Stats.Eglobal.Groups.p = pT;
    Net_Stats.Eglobal.Groups.pArea = pA;
    Net_Stats.Eglobal.Groups.ci = ci;
    Net_Stats.Eglobal.Groups.ciArea = ciA;
    Net_Stats.Eglobal.Groups.dm = dm;
    Net_Stats.Eglobal.Groups.dbmean= dbmean; 
    
    disp('Statistics for Global Efficiency ...  Done!');
end;

if (isfield(NetProps1_C1,'NodalEfficiency'))&&(isfield(NetProps2_C1,'NodalEfficiency'))&&(isfield(NetProps1_boot_C1,'NodalEfficiency'))&&(isfield(NetProps2_boot_C1,'NodalEfficiency'))&& ...
   (isfield(NetProps1_C2,'NodalEfficiency'))&&(isfield(NetProps2_C2,'NodalEfficiency'))&&(isfield(NetProps1_boot_C2,'NodalEfficiency'))&&(isfield(NetProps2_boot_C2,'NodalEfficiency'))
    disp('Doing Statistics for Nodal Efficiency ...');    
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2_C1 = NetProps2_C1.NodalEfficiency(:,:,1:ind2trunc);
    NodalP1b_C1 = NetProps1_boot_C1.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2b_C1 = NetProps2_boot_C1.NodalEfficiency(:,:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2_C2 = NetProps2_C2.NodalEfficiency(:,:,1:ind2trunc);
    NodalP1b_C2 = NetProps1_boot_C2.NodalEfficiency(:,:,1:ind2trunc);
    NodalP2b_C2 = NetProps2_boot_C2.NodalEfficiency(:,:,1:ind2trunc);    
    
    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.NodalEfficiency.Conditions.p = pT;
    Net_Stats.NodalEfficiency.Conditions.pArea = pA;
    Net_Stats.NodalEfficiency.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodalEfficiency.Conditions.ci = ci;
    Net_Stats.NodalEfficiency.Conditions.ciArea = ciA;
    Net_Stats.NodalEfficiency.Conditions.dm = dm;
    Net_Stats.NodalEfficiency.Conditions.dbmean= dbmean;
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.NodalEfficiency.Groups.p = pT;
    Net_Stats.NodalEfficiency.Groups.pArea = pA;
    Net_Stats.NodalEfficiency.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodalEfficiency.Groups.ci = ci;
    Net_Stats.NodalEfficiency.Groups.ciArea = ciA;
    Net_Stats.NodalEfficiency.Groups.dm = dm;
    Net_Stats.NodalEfficiency.Groups.dbmean= dbmean;
    
    disp('Statistics for Nodal Efficiency ...  Done!');
end;

if (isfield(NetProps1_C1,'VulnerabilityMat'))&&(isfield(NetProps2_C1,'VulnerabilityMat'))&&(isfield(NetProps1_boot_C1,'VulnerabilityMat'))&&(isfield(NetProps2_boot_C1,'VulnerabilityMat'))&& ...
   (isfield(NetProps1_C2,'VulnerabilityMat'))&&(isfield(NetProps2_C2,'VulnerabilityMat'))&&(isfield(NetProps1_boot_C2,'VulnerabilityMat'))&&(isfield(NetProps2_boot_C2,'VulnerabilityMat'))
    disp('Doing Statistics for Nodal Vulnerability ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2_C1 = NetProps2_C1.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP1b_C1 = NetProps1_boot_C1.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2b_C1 = NetProps2_boot_C1.VulnerabilityMat(:,:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2_C2 = NetProps2_C2.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP1b_C2 = NetProps1_boot_C2.VulnerabilityMat(:,:,1:ind2trunc);
    NodalP2b_C2 = NetProps2_boot_C2.VulnerabilityMat(:,:,1:ind2trunc);    
    
    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.VulnerabilityMat.Conditions.p = pT;
    Net_Stats.VulnerabilityMat.Conditions.pArea = pA;
    Net_Stats.VulnerabilityMat.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.VulnerabilityMat.Conditions.ci = ci;
    Net_Stats.VulnerabilityMat.Conditions.ciArea = ciA;
    Net_Stats.VulnerabilityMat.Conditions.dm = dm;
    Net_Stats.VulnerabilityMat.Conditions.dbmean= dbmean;
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.VulnerabilityMat.Groups.p = pT;
    Net_Stats.VulnerabilityMat.Groups.pArea = pA;
    Net_Stats.VulnerabilityMat.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.VulnerabilityMat.Groups.ci = ci;
    Net_Stats.VulnerabilityMat.Groups.ciArea = ciA;
    Net_Stats.VulnerabilityMat.Groups.dm = dm;
    Net_Stats.VulnerabilityMat.Groups.dbmean= dbmean;
    
    disp('Statistics for Nodal Vulnerability ...  Done!');    
end;

if (isfield(NetProps1_C1,'CentrBet'))&&(isfield(NetProps2_C1,'CentrBet'))&&(isfield(NetProps1_boot_C1,'CentrBet'))&&(isfield(NetProps2_boot_C1,'CentrBet'))&& ...
   (isfield(NetProps1_C2,'CentrBet'))&&(isfield(NetProps2_C2,'CentrBet'))&&(isfield(NetProps1_boot_C2,'CentrBet'))&&(isfield(NetProps2_boot_C2,'CentrBet'))
    disp('Doing Statistics for Nodal Centrality ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.CentrBet(:,:,1:ind2trunc);
    NodalP2_C1 = NetProps2_C1.CentrBet(:,:,1:ind2trunc);
    NodalP1b_C1 = NetProps1_boot_C1.CentrBet(:,:,1:ind2trunc);
    NodalP2b_C1 = NetProps2_boot_C1.CentrBet(:,:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.CentrBet(:,:,1:ind2trunc);
    NodalP2_C2 = NetProps2_C2.CentrBet(:,:,1:ind2trunc);
    NodalP1b_C2 = NetProps1_boot_C2.CentrBet(:,:,1:ind2trunc);
    NodalP2b_C2 = NetProps2_boot_C2.CentrBet(:,:,1:ind2trunc);    
    
    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.CentrBet.Conditions.p = pT;
    Net_Stats.CentrBet.Conditions.pArea = pA;
    Net_Stats.CentrBet.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.CentrBet.Conditions.ci = ci;
    Net_Stats.CentrBet.Conditions.ciArea = ciA;
    Net_Stats.CentrBet.Conditions.dm = dm;
    Net_Stats.CentrBet.Conditions.dbmean= dbmean;
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.CentrBet.Groups.p = pT;
    Net_Stats.CentrBet.Groups.pArea = pA;
    Net_Stats.CentrBet.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.CentrBet.Groups.ci = ci;
    Net_Stats.CentrBet.Groups.ciArea = ciA;
    Net_Stats.CentrBet.Groups.dm = dm;
    Net_Stats.CentrBet.Groups.dbmean= dbmean;    

    disp('Statistics for Nodal Centrality ...  Done!');
end;

if (isfield(NetProps1_C1,'CentrBetNorm'))&&(isfield(NetProps2_C1,'CentrBetNorm'))&&(isfield(NetProps1_boot_C1,'CentrBetNorm'))&&(isfield(NetProps2_boot_C1,'CentrBetNorm'))&& ...
   (isfield(NetProps1_C2,'CentrBetNorm'))&&(isfield(NetProps2_C2,'CentrBetNorm'))&&(isfield(NetProps1_boot_C2,'CentrBetNorm'))&&(isfield(NetProps2_boot_C2,'CentrBetNorm'))
    disp('Doing Statistics for Nodal Normalized Centrality ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2_C1 = NetProps2_C1.CentrBetNorm(:,:,1:ind2trunc);
    NodalP1b_C1 = NetProps1_boot_C1.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2b_C1 = NetProps2_boot_C1.CentrBetNorm(:,:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2_C2 = NetProps2_C2.CentrBetNorm(:,:,1:ind2trunc);
    NodalP1b_C2 = NetProps1_boot_C2.CentrBetNorm(:,:,1:ind2trunc);
    NodalP2b_C2 = NetProps2_boot_C2.CentrBetNorm(:,:,1:ind2trunc);    
    
    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.CentrBetNorm.Conditions.p = pT;
    Net_Stats.CentrBetNorm.Conditions.pArea = pA;
    Net_Stats.CentrBetNorm.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.CentrBetNorm.Conditions.ci = ci;
    Net_Stats.CentrBetNorm.Conditions.ciArea = ciA;
    Net_Stats.CentrBetNorm.Conditions.dm = dm;
    Net_Stats.CentrBetNorm.Conditions.dbmean= dbmean;
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.CentrBetNorm.Groups.p = pT;
    Net_Stats.CentrBetNorm.Groups.pArea = pA;
    Net_Stats.CentrBetNorm.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.CentrBetNorm.Groups.ci = ci;
    Net_Stats.CentrBetNorm.Groups.ciArea = ciA;
    Net_Stats.CentrBetNorm.Groups.dm = dm;
    Net_Stats.CentrBetNorm.Groups.dbmean= dbmean;    
    
    disp('Statistics for Nodal Normalized Centrality ...  Done!');
end;

if (isfield(NetProps1_C1,'NodalClux'))&&(isfield(NetProps2_C1,'NodalClux'))&&(isfield(NetProps1_boot_C1,'NodalClux'))&&(isfield(NetProps2_boot_C1,'NodalClux'))&& ...
   (isfield(NetProps1_C2,'NodalClux'))&&(isfield(NetProps2_C2,'NodalClux'))&&(isfield(NetProps1_boot_C2,'NodalClux'))&&(isfield(NetProps2_boot_C2,'NodalClux'))
    disp('Doing Statistics for Nodal Clustering index ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.NodalClux(:,:,1:ind2trunc);
    NodalP2_C1 = NetProps2_C1.NodalClux(:,:,1:ind2trunc);
    NodalP1b_C1 = NetProps1_boot_C1.NodalClux(:,:,1:ind2trunc);
    NodalP2b_C1 = NetProps2_boot_C1.NodalClux(:,:,1:ind2trunc);
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.NodalClux(:,:,1:ind2trunc);
    NodalP2_C2 = NetProps2_C2.NodalClux(:,:,1:ind2trunc);
    NodalP1b_C2 = NetProps1_boot_C2.NodalClux(:,:,1:ind2trunc);
    NodalP2b_C2 = NetProps2_boot_C2.NodalClux(:,:,1:ind2trunc);    
    
    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.NodalClux.Conditions.p = pT;
    Net_Stats.NodalClux.Conditions.pArea = pA;
    Net_Stats.NodalClux.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodalClux.Conditions.ci = ci;
    Net_Stats.NodalClux.Conditions.ciArea = ciA;
    Net_Stats.NodalClux.Conditions.dm = dm;
    Net_Stats.NodalClux.Conditions.dbmean= dbmean;
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,false);
    Net_Stats.NodalClux.Groups.p = pT;
    Net_Stats.NodalClux.Groups.pArea = pA;
    Net_Stats.NodalClux.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodalClux.Groups.ci = ci;
    Net_Stats.NodalClux.Groups.ciArea = ciA;
    Net_Stats.NodalClux.Groups.dm = dm;
    Net_Stats.NodalClux.Groups.dbmean= dbmean;  
    
    disp('Statistics for Nodal Clustering Index ...  Done!');
end;

if (isfield(NetProps1_C1,'NodeConnection'))&&(isfield(NetProps2_C1,'NodeConnection'))&&(isfield(NetProps1_boot_C1,'NodeConnection'))&&(isfield(NetProps2_boot_C1,'NodeConnection'))&& ...
   (isfield(NetProps1_C2,'NodeConnection'))&&(isfield(NetProps2_C2,'NodeConnection'))&&(isfield(NetProps1_boot_C2,'NodeConnection'))&&(isfield(NetProps2_boot_C2,'NodeConnection'))
    disp('Doing Statistics for Nodal Connectivity index ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.NodeConnection;
    NodalP2_C1 = NetProps2_C1.NodeConnection;
    NodalP1b_C1 = NetProps1_boot_C1.NodeConnection;
    NodalP2b_C1 = NetProps2_boot_C1.NodeConnection;    
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.NodeConnection;
    NodalP2_C2 = NetProps2_C2.NodeConnection;
    NodalP1b_C2 = NetProps1_boot_C2.NodeConnection;
    NodalP2b_C2 = NetProps2_boot_C2.NodeConnection;     

    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    Net_Stats.NodeConnection.Conditions.p = pT;
    Net_Stats.NodeConnection.Conditions.pArea = pA;
    Net_Stats.NodeConnection.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodeConnection.Conditions.ci = ci;
    Net_Stats.NodeConnection.Conditions.ciArea = ciA;
    Net_Stats.NodeConnection.Conditions.dm = dm;
    Net_Stats.NodeConnection.Conditions.dbmean= dbmean; 
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    Net_Stats.NodeConnection.Groups.p = pT;
    Net_Stats.NodeConnection.Groups.pArea = pA;
    Net_Stats.NodeConnection.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.NodeConnection.Groups.ci = ci;
    Net_Stats.NodeConnection.Groups.ciArea = ciA;
    Net_Stats.NodeConnection.Groups.dm = dm;
    Net_Stats.NodeConnection.Groups.dbmean= dbmean; 
    
    disp('Statistics for Nodal Connectivity index ...  Done!');
end;

if (isfield(NetProps1_C1,'GlobalConnectivity'))&&(isfield(NetProps2_C1,'GlobalConnectivity'))&&(isfield(NetProps1_boot_C1,'GlobalConnectivity'))&&(isfield(NetProps2_boot_C1,'GlobalConnectivity'))&& ...
   (isfield(NetProps1_C2,'GlobalConnectivity'))&&(isfield(NetProps2_C2,'GlobalConnectivity'))&&(isfield(NetProps1_boot_C2,'GlobalConnectivity'))&&(isfield(NetProps2_boot_C2,'GlobalConnectivity'))
    disp('Doing Statistics for Global Connectivity ...');
    % Group 1 and Group 2 Condition 1
    NodalP1_C1 = NetProps1_C1.GlobalConnectivity;
    NodalP2_C1 = NetProps2_C1.GlobalConnectivity;
    NodalP1b_C1 = NetProps1_boot_C1.GlobalConnectivity;
    NodalP2b_C1 = NetProps2_boot_C1.GlobalConnectivity;    
    % Group 1 and Group 2 Condition 2
    NodalP1_C2 = NetProps1_C2.GlobalConnectivity;
    NodalP2_C2 = NetProps2_C2.GlobalConnectivity;
    NodalP1b_C2 = NetProps1_boot_C2.GlobalConnectivity;
    NodalP2b_C2 = NetProps2_boot_C2.GlobalConnectivity;     

    NodalP1=NodalP1_C1-NodalP2_C1; % group differences condition 1
    NodalP2=NodalP1_C2-NodalP2_C2; % group differences condition 2
    NodalP1b=NodalP1b_C1-NodalP2b_C1;
    NodalP2b=NodalP1b_C2-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    Net_Stats.GlobalConnectivity.Conditions.p = pT;
    Net_Stats.GlobalConnectivity.Conditions.pArea = pA;
    Net_Stats.GlobalConnectivity.Conditions.pAreaStructures=Structures(logical(pA));
    Net_Stats.GlobalConnectivity.Conditions.ci = ci;
    Net_Stats.GlobalConnectivity.Conditions.ciArea = ciA;
    Net_Stats.GlobalConnectivity.Conditions.dm = dm;
    Net_Stats.GlobalConnectivity.Conditions.dbmean= dbmean;     
    
    NodalP1=NodalP1_C1-NodalP1_C2; % conditions differences group 1
    NodalP2=NodalP2_C1-NodalP2_C2; % conditions differences group 2
    NodalP1b=NodalP1b_C1-NodalP1b_C2;
    NodalP2b=NodalP2b_C1-NodalP2b_C2;
    [pT,pA,ci,ciA,dm,dbmean] = Bootstrap_Test_compare_groups01(NodalP1,NodalP2,NodalP1b,NodalP2b,pvalue,true);
    Net_Stats.GlobalConnectivity.Groups.p = pT;
    Net_Stats.GlobalConnectivity.Groups.pArea = pA;
    Net_Stats.GlobalConnectivity.Groups.pAreaStructures=Structures(logical(pA));
    Net_Stats.GlobalConnectivity.Groups.ci = ci;
    Net_Stats.GlobalConnectivity.Groups.ciArea = ciA;
    Net_Stats.GlobalConnectivity.Groups.dm = dm;
    Net_Stats.GlobalConnectivity.Groups.dbmean= dbmean;

    disp('Statistics for Global Connectivity ...  Done!');
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
if (isfield(NetProps1_C1,'Structures'))&&(isfield(NetProps2_C1,'Structures'))&&(isfield(NetProps1_boot_C1,'Structures'))&&(isfield(NetProps2_boot_C1,'Structures'))&& ...
   (isfield(NetProps1_C2,'Structures'))&&(isfield(NetProps2_C2,'Structures'))&&(isfield(NetProps1_boot_C2,'Structures'))&&(isfield(NetProps2_boot_C2,'Structures'))
    Net_Stats.Structures = NetProps1_C1.Structures;
end;

Net_Stats.pvalue=pvalue;
Net_Stats.ThresBins=NetProps1_boot_C1.ThresBins(1:ind2trunc);

disp('Bootstrap Test for Network Properties different groups, different conditions  ...  FINISHED :-)');

return;
