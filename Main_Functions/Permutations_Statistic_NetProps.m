function Net_Stats = Permutations_Statistic_NetProps(Stat,Indep,NetProps1,NetProps2,Npermut)

% This function use the Permutation approach to make statistic between properties of
% networks.
%
%  Input Parameters:
%
%    NetProps1,NetProps2: Struct with the network properties for group 1 &  2
%    Stat : Defines statistic to be used 
%          Stat = 1 : t-student with Identity; 
%          Stat = 2 : Sum of differences with Identity 
%          Stat = 4 : t-student with Absolute value
%          Stat = 5 : Sum of differences with Absolute value
% 
%  Indep : Defines the relationship between groups. Indep = 0 : Dependent groups; 
%                                                   Indep = 1 : Independent groups.
%  Npermut : Number of permutations. 
%
%  Output Parameters:
%
%    Net_Stats : Struct with the statistic results.
%                FSupSup : probabilidad global de significacion si la media es igual a cero
%                FSupDeriv: vector (1:numROI) de probabilidades de significacion si la media es cero en cada
%                           ROI con respecto a todos los times multivariadamente
%                Fsuptime: vector (1:numtime) de probabilidades de significacion si la media es cero en cada
%                          time con respecto a todos las deriv multivariadamente
%                Funiv : matriz (numROI x numtime) de probabilidades de significacion si la media es cero en cada
%                        variable univariadamente
%   
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% May 16th, 2009.

Net_Stats = [];

switch Stat
    case 1
        StatLabel = 't-student with Identity';
    case 2
        StatLabel = 'Sum of differences with Identity';
    case 3
        StatLabel = 't-student with Absolute value';
    case 4
        StatLabel = 'Sum of differences with Absolute value';
end;
if Indep==1
    IndepLabel = 'Dependent Samples';
else
    IndepLabel = 'Independent Samples';
end;

Net_Stats.StatType =  StatLabel;
Net_Stats.SampleType = IndepLabel;
% Cluster Index
if isfield(NetProps1,'Clux')&&(isfield(NetProps2,'Clux'))
    disp('Doing Statistic for Cluster Index ...');
    Clux1 = NetProps1.Clux;
    Clux2 = NetProps2.Clux;
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,Clux1,Clux2,Npermut);
    Net_Stats.Clux.FSupSup = FSupSup;
    Net_Stats.Clux.FSupRep = FSupRep;
    Net_Stats.Clux.FSupSparsity = FSupSparsity;
    Net_Stats.Clux.FUniv = FUniv;
    disp('Statistic for Cluster Index ...  Done!');
end;

% Characteristic Path
if isfield(NetProps1,'CharPathL')&&(isfield(NetProps2,'CharPathL'))
    disp('Doing Statistic for Characteristic Path Length ...');
    CharPathL1 = NetProps1.CharPathL;
    CharPathL2 = NetProps2.CharPathL;
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,CharPathL1,CharPathL2,Npermut);
    Net_Stats.CharPathL.FSupSup = FSupSup;
    Net_Stats.CharPathL.FSupRep = FSupRep;
    Net_Stats.CharPathL.FSupSparsity = FSupSparsity;
    Net_Stats.CharPathL.FUniv = FUniv;
    disp('Statistic for Characteristic Path Length  ...  Done!');
end;

% Local and global Efficiency
if isfield(NetProps1,'Efficiency')&&(isfield(NetProps2,'Efficiency'))
    disp('Doing Statistic for Local Efficiency ...');
    Eloc1 = squeeze(NetProps1.Efficiency(1,:,:));
    Eloc2 = squeeze(NetProps2.Efficiency(1,:,:));
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,Eloc1,Eloc2,Npermut);
    Net_Stats.Elocal.FSupSup = FSupSup;
    Net_Stats.Elocal.FSupRep = FSupRep;
    Net_Stats.Elocal.FSupSparsity = FSupSparsity;
    Net_Stats.Elocal.FUniv = FUniv;
    disp('Statistic for Local Efficiency ...  Done!');
    
    disp('Doing Statistic for Global Efficiency ...');
    Eglob1 = squeeze(NetProps1.Efficiency(2,:,:));
    Eglob2 = squeeze(NetProps2.Efficiency(2,:,:));
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,Eglob1,Eglob2,Npermut);
    Net_Stats.Eglobal.FSupSup = FSupSup;
    Net_Stats.Eglobal.FSupRep = FSupRep;
    Net_Stats.Eglobal.FSupSparsity = FSupSparsity;
    Net_Stats.Eglobal.FUniv = FUniv;
    disp('Statistic for Global Efficiency ...  Done!');    
end;

% Small World Properties ...
if isfield(NetProps1,'SmallWorld')&&(isfield(NetProps2,'SmallWorld'))
    disp('Doing Statistic for Small World properties ...');
    gamna1 = squeeze(NetProps1.SmallWorld(1,:,:));
    gamna2 = squeeze(NetProps2.SmallWorld(1,:,:));
    flagInf1_gamna1 = sum(isinf(gamna1),2)==0; % Checking for NaN and Inf values
    flagInf2_gamna2 = sum(isinf(gamna2),2)==0;
    flagNaN1_gamna1 = sum(isnan(gamna1),2)==0;
    flagNaN2_gamna2 = sum(isnan(gamna2),2)==0;
    indf = flagInf1_gamna1 & flagInf2_gamna2 &  flagNaN1_gamna1 & flagNaN2_gamna2;    
    gamna1 = gamna1(indf,:);
    gamna2 = gamna2(indf,:);    
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,gamna1,gamna2,Npermut);
    Net_Stats.gamna.FSupSup = FSupSup;
    Net_Stats.gamna.FSupRep = FSupRep;
    Net_Stats.gamna.FSupSparsity = FSupSparsity;
    Net_Stats.gamna.FUniv = FUniv;    
    
    lambda1 = squeeze(NetProps1.SmallWorld(2,:,:));
    lambda2 = squeeze(NetProps2.SmallWorld(2,:,:));
    flagInf1_lambda1 = sum(isinf(lambda1),2)==0; % Checking for NaN and Inf values
    flagInf2_lambda2 = sum(isinf(lambda2),2)==0;
    flagNaN1_lambda1 = sum(isnan(lambda1),2)==0;
    flagNaN2_lambda2 = sum(isnan(lambda2),2)==0;
    indf = flagInf1_lambda1 & flagInf2_lambda2 &  flagNaN1_lambda1 & flagNaN2_lambda2;
    lambda1 = lambda1(indf,:);
    lambda2 = lambda2(indf,:);    
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,lambda1,lambda2,Npermut);
    Net_Stats.lambda.FSupSup = FSupSup;
    Net_Stats.lambda.FSupRep = FSupRep;
    Net_Stats.lambda.FSupSparsity = FSupSparsity;
    Net_Stats.lambda.FUniv = FUniv;
    
    sigma1 = squeeze(NetProps1.SmallWorld(3,:,:));
    sigma2 = squeeze(NetProps2.SmallWorld(3,:,:));
    flagInf1_sigma1 = sum(isinf(sigma1),2)==0; % Checking for NaN and Inf values
    flagInf2_sigma2 = sum(isinf(sigma2),2)==0;
    flagNaN1_sigma1 = sum(isnan(sigma1),2)==0;
    flagNaN2_sigma2 = sum(isnan(sigma2),2)==0;
    indf = flagInf1_sigma1 & flagInf2_sigma2 &  flagNaN1_sigma1 & flagNaN2_sigma2; 
    sigma1 = sigma1(indf,:);
    sigma2 = sigma2(indf,:);    
    [FSupSup,FSupRep,FSupSparsity,FUniv] = TestPermut2Grupos(Stat,Indep,sigma1,sigma2,Npermut);
    Net_Stats.sigma.FSupSup = FSupSup;
    Net_Stats.sigma.FSupRep = FSupRep;
    Net_Stats.sigma.FSupSparsity = FSupSparsity;
    Net_Stats.sigma.FUniv = FUniv;
    disp('Statistic for Small World properties ...  Done!');
end;

if isfield(NetProps1,'Structures')&&isfield(NetProps2,'Structures')
    Net_Stats.Structures = NetProps1.Structures;
end;

disp('Permutation Test for Network Properties  ...  FINISHED :-)');

return;



