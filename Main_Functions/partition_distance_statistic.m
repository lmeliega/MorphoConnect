function [MIn_sig,VIn_sig,MIn,VIn] = partition_distance_statistic(CommG1,CommG2,pvalue,Nresamp)

%  This function quantifies information-theoretic distance (normalized variation of information) or similarity (normalized mutual information)
%   between community partitions and its statistical significance based on resampling methdos.
%
%% Input Parameters
% CommG1, CommG2 : These are the partitions. They should be column vectors.
% pvalue : for determining the significance of the difference.
% Nresamp : Number of resampling iterations.
%
%% Output Parameters
%   MIn,VIn : Normalized variation of information and normalized mutual information.
%   MIn_sig,VIn_sig : If MIn_sig,VIn_sig = 1 then partition are different, if MIn_sig,VIn_sig=0 then partition are similar. 
%
%% Lester Melie-Garcia
% LREN, CHUV, Lausanne August 24th 2017

if ~exist('pvalue','var')
    pvalue = 0.05;
end;
if ~exist('Nresamp','var')
    Nresamp = 1000;
end;

ci = [pvalue/2,1-pvalue/2]*100;

CommG1 = CommG1(:);
CommG2 = CommG2(:);

Nv = length(CommG1);

[VIn,MIn]=partition_distance([CommG1,CommG2]);
VIn = VIn(1,2); MIn = MIn(1,2); 

MIn_boot = zeros(Nresamp,1);
VIn_boot = zeros(Nresamp,1);

for i=1:Nresamp
    [VIn_temp,MIn_temp]=partition_distance([CommG1(randperm(Nv)),CommG2(randperm(Nv))]);
    MIn_boot(i) =  MIn_temp(1,2);
    VIn_boot(i) =  VIn_temp(1,2);
end;

%MIn_ci = prctile(MIn_boot,ci);
%VIn_ci = prctile(VIn_boot,ci);
VIn_ci = bootcper_confidence_interval(VIn,VIn_boot,pvalue);
MIn_ci = bootcper_confidence_interval(MIn,MIn_boot,pvalue);

MIn_sig = (MIn>MIn_ci(1))&&(MIn<MIn_ci(2));
VIn_sig = (VIn>VIn_ci(1))&&(VIn<VIn_ci(2));

end
