%% AD Group
AD_C = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\AD_CORTICAL_THICKNESS_CARRIER_40_SUBJ.mat');
AD_NC = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\AD_CORTICAL_THICKNESS_NON_CARRIER_40_SUBJ.mat');

[AD_C_y,thresC,thresS,thresAve,thresbins]  = Netlargest_comp(AD_C.ConnectMatrix.ConMat);
[AD_NC_y,thresC,thresS,thresAve,thresbins] = Netlargest_comp(AD_NC.ConnectMatrix.ConMat);

t = [AD_NC_y,AD_C_y];

%plot(flipud(thresbins),flipud(t));

%% MCI group
MCI_C = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\MCI_CORTICAL_THICKNESS_CARRIER_126_SUBJ.mat');
MCI_NC = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\MCI_CORTICAL_THICKNESS_NON_CARRIER_127_SUBJ.mat');

[MCI_C_y,thresC,thresS,thresAve,thresbins]  = Netlargest_comp(MCI_C.ConnectMatrix.ConMat);
[MCI_NC_y,thresC,thresS,thresAve,thresbins] = Netlargest_comp(MCI_NC.ConnectMatrix.ConMat);

t = [MCI_NC_y,MCI_C_y];

figure;
plot(thresbins,t);

%% NC group

NC_C = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\NC_CORTICAL_THICKNESS_CARRIER_40_SUBJ.mat');
NC_NC = load('D:\ADNI_PAPER_MCI_APOE\Figuras_para_paper\Connect_matrices_sin_boostrap\NC_CORTICAL_THICKNESS_NON_CARRIER_40_SUBJ.mat');

[NC_C_y,thresC,thresS,thresAve,thresbins]  = Netlargest_comp(NC_C.ConnectMatrix.ConMat);
[NC_NC_y,thresC,thresS,thresAve,thresbins] = Netlargest_comp(NC_NC.ConnectMatrix.ConMat);

t = [NC_NC_y,NC_C_y];

figure;
%plot(flipud(thresbins),flipud(t));

plot(thresbins,[t1(:,1),t2(:,1),t3(:,1)]);

figure;

plot(thresbins,[t1(:,2),t2(:,2),t3(:,2)]);