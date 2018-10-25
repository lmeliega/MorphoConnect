function NetProps_new = resample_NetProps(NetProps,indboot)

% This function resample Network properties using a set of index save in
% indboot input variable
%
% Input Parameters
%     NetProps : Network properties variable
%     indboot :  bootstrap indexes. matrix of Nsubj x Nsamples
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% September 8th, 2009.

[Ns,Nboot] = size(indboot);
Nbins = length(NetProps.ThresBins);

NetProps_new = NetProps;

sizeDegDistr = size(NetProps.DegDistr);
 
Clux_new = zeros(Nboot,Nbins);
CharPathL_new = zeros(Nboot,Nbins);
SmallWorld_new = zeros(3,Nboot,Nbins);
Efficiency_new = zeros(4,Nboot,Nbins);
DegDistr_new = zeros([sizeDegDistr(1:2),Nboot,Nbins]);
kmean_new = zeros(Nboot,Nbins);
thresh_new = zeros(Nboot,Nbins);

for i=1:Nboot
    ind = indboot(:,i);
    Clux_new(i,:) = mean(NetProps.Clux(ind,:));
    CharPathL_new(i,:) = mean(NetProps.CharPathL(ind,:));
    SmallWorld_new(:,i,:) = mean(NetProps.SmallWorld(:,ind,:),2);
    Efficiency_new(:,i,:) = mean(NetProps.Efficiency(:,ind,:),2);
    DegDistr_new(:,:,i,:) = mean(NetProps.DegDistr(:,:,ind,:),3);
    kmean_new(i,:) = mean(NetProps.kmean(ind,:));
    thresh_new(i,:) = mean(NetProps.thresh(ind,:));
end;

NetProps_new.Name = [NetProps.Name,'_boot'];
NetProps_new.Clux = Clux_new;
NetProps_new.CharPathL = CharPathL_new;
NetProps_new.SmallWorld = SmallWorld_new;
NetProps_new.Efficiency = Efficiency_new;
NetProps_new.DegDistr = DegDistr_new;
NetProps_new.kmean = kmean_new;
NetProps_new.thresh = thresh_new;
NetProps_new.Caution = 'These are resampled Network properties'; 

return;