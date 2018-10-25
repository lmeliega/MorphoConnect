function Net_Stats = T2_NetProps(NetProps1,NetProps2,pvalue)

% This function calculates T2 statistic to compare properties of
% networks.
%  Input Parameters:
%
%    NetProps1,NetProps2: Struct with the network properties for group 1 &  2
%
%  Output Parameters:
%
%    Net_Stats : Struct with the statistic results; T2-test & T-test.
%   
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% April 27th, 2009.


Nthres = length(NetProps1.thresh(1,:));
Ntrials = size(NetProps1.ConMat,3);
%pvalue = 0.05;

first_label = repmat(1,Ntrials,1);
second_label = repmat(2,Ntrials,1);

Net_Stats = [];
% Cluster Index
if isfield(NetProps1,'Clux')&&(isfield(NetProps2,'Clux'))
    Clux1 = NetProps1.Clux;
    Clux2 = NetProps2.Clux;
    PClux = T2Hot2iho([first_label Clux1; second_label Clux2],pvalue);
    pT_Clux = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_Clux(i)] = ttest2(Clux1(:,i),Clux2(:,i),pvalue);
    end;
    Net_Stats.T2.Clux = PClux;
    Net_Stats.T.Clux = pT_Clux;
end;

% Characteristic Path
if isfield(NetProps1,'CharPathL')&&(isfield(NetProps2,'CharPathL'))
    CharPathL1 = NetProps1.CharPathL;
    CharPathL2 = NetProps2.CharPathL;    
    PCharPathL = T2Hot2iho([first_label CharPathL1; second_label CharPathL2],pvalue);
    pT_CharPathL = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_CharPathL(i)] = ttest2(CharPathL1(:,i),CharPathL2(:,i),pvalue);
    end;
    Net_Stats.T2.CharPathL = PCharPathL;
    Net_Stats.T.CharPathL = pT_CharPathL;
end;

% Local and global Efficiency
if isfield(NetProps1,'Efficiency')&&(isfield(NetProps2,'Efficiency'))
    Eloc1 = squeeze(NetProps1.Efficiency(1,:,:));
    Eloc2 = squeeze(NetProps2.Efficiency(1,:,:));
    Eglob1 = squeeze(NetProps1.Efficiency(2,:,:));
    Eglob2 = squeeze(NetProps2.Efficiency(2,:,:));    
    PEloc = T2Hot2iho([first_label Eloc1;second_label Eloc2],pvalue);
    PEglob = T2Hot2iho([first_label Eglob1;second_label Eglob2],pvalue); 
    pT_Eloc = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_Eloc(i)] = ttest2(Eloc1(:,i),Eloc2(:,i),pvalue);
    end;
    pT_Eglob = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_Eglob(i)] = ttest2(Eglob1(:,i),Eglob2(:,i),pvalue);
    end;
    Net_Stats.T2.Elocal = PEloc;
    Net_Stats.T.Elocal = pT_Eloc;
    Net_Stats.T2.Eglobal = PEglob;
    Net_Stats.T.Eglobal = pT_Eglob;    
end;

%NetProps.SmallWorld(:,t,rt) = [gamna;lambda;sigma];
if isfield(NetProps1,'SmallWorld')&&(isfield(NetProps2,'SmallWorld'))
    gamna1 = squeeze(NetProps1.SmallWorld(1,:,:));
    gamna2 = squeeze(NetProps2.SmallWorld(1,:,:));
    flagInf1_gamna1 = sum(isinf(gamna1),2)==0;
    flagInf2_gamna2 = sum(isinf(gamna2),2)==0;
    
    lambda1 = squeeze(NetProps1.SmallWorld(2,:,:));
    lambda2 = squeeze(NetProps2.SmallWorld(2,:,:));
    flagInf1_lambda1 = sum(isinf(lambda1),2)==0;
    flagInf2_lambda2 = sum(isinf(lambda2),2)==0;
    
    sigma1 = squeeze(NetProps1.SmallWorld(3,:,:));
    sigma2 = squeeze(NetProps2.SmallWorld(3,:,:));
    flagInf1_sigma1 = sum(isinf(sigma1),2)==0;
    flagInf2_sigma2 = sum(isinf(sigma2),2)==0;    
    
    Pgamna = T2Hot2iho([first_label(flagInf1_gamna1) gamna1(flagInf1_gamna1,:);second_label(flagInf2_gamna2) gamna2(flagInf2_gamna2,:)],pvalue);
    Plambda = T2Hot2iho([first_label(flagInf1_lambda1) lambda1(flagInf1_lambda1,:);second_label(flagInf2_lambda2) lambda2(flagInf2_lambda2,:)],pvalue);
    Psigma = T2Hot2iho([first_label(flagInf1_sigma1) sigma1(flagInf1_sigma1,:);second_label(flagInf2_sigma2) sigma2(flagInf2_sigma2,:)],pvalue);
    pT_gamna = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_gamna(i)] = ttest2(gamna1(:,i),gamna2(:,i),pvalue);
    end;
    pT_lambda = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_lambda(i)] = ttest2(lambda1(:,i),lambda2(:,i),pvalue);
    end;
    pT_sigma = zeros(Nthres,1);
    for i=1:Nthres
        [h,pT_sigma(i)] = ttest2(sigma1(:,i),sigma2(:,i),pvalue);
    end;
    Net_Stats.T2.gamna = Pgamna;
    Net_Stats.T.gamna = pT_gamna;
    Net_Stats.T2.lambda = Plambda;
    Net_Stats.T.lambda = pT_lambda;
    Net_Stats.T2.sigma = Psigma;
    Net_Stats.T.sigma = pT_sigma;       
end;

if isfield(NetProps1,'Structures')&&isfield(NetProps2,'Structures')
    Net_Stats.Structures = NetProps1.Structures;
end;

return;



