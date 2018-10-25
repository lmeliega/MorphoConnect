function ConMat_new = resample_ConnectMatrix(ConMat,indboot)

% This function resample Network properties using a set of index saved in
% indboot input variable
%
% Input Parameters
%     NetProps : Network properties variable
%      indboot : Bootstrap indexes. Matrix of Nsubj x Nsamples
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% September 8th, 2009.

[Ns,Nboot] = size(indboot);

C = ConMat.ConMat;
d = size(C);
Cout = zeros([d(1),d(2),Nboot],'single');

for i=1:Nboot
    ind = indboot(:,i);
    Ct = C(:,:,ind);
    Cout(:,:,i) = single(mean(Ct,3));
end;

ConMat_new.ConMat = Cout;
ConMat_new.Nboot = Nboot;
ConMat_new.Nsubj = Ns;
ConMat_new.Caution = 'This is a resampled Connectivity Matrix'; 

return;