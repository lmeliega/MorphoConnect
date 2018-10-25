function [ConnH,ConnH_mean,ConnH_std]=get_homologous_connectivity(C,isabs)

% This functions get the connectivity between homologous regions from the
% connectivity matrix C.
%% Input Parameters:
%   C :  Connectivity matrix, it should the Ns x Ns x Nrep : double of number of structures x double of number of structures x number of repetitions.
%  isabs : this is a logical variable defining if the absolute value should be taken for the mean.
%  
%% Output Parameters:
%    ConnH : The connectivity value between homologous regions. This is a matrix of Ns/2 x Nrep. 
%    ConnH_mean, ConnH_std : Mean and standard deviation of ConnH accross the number of repetition. These are column vectors of  Ns/2 x 1 .
%
%% Lester Melie-Garcia
% LREN, CHUV, Lausanne, October 28th 2016

[Ns,~,Nrep] = size(C);
Ns2 = Ns/2;
ConnH=zeros(Ns2,Nrep);
for i=1:Nrep
    Ct = C(Ns2+1:end,1:Ns2,i);
    ConnH(:,i)= diag(Ct);
end;
if exist('isabs','var')
    if isabs
        ConnH_mean = mean(ConnH,2);
        ConnH_std = std(ConnH,0,2);
    else
        ConnH_mean = mean(abs(ConnH),2);
        ConnH_std = std(abs(ConnH),0,2);
    end;
else
    ConnH_mean = mean(ConnH,2);
    ConnH_std = std(ConnH,0,2);
end;

end

