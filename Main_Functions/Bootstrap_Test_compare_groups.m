function [p,pU] = Bootstrap_Test_compare_groups(X1,X2,pvalue)
% Input Parameters
%   X1,X2 : Network Properties Files
%                     
% Output Parameters 
%
%   p : p-value of the permutation process.
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% August 2nd, 2011.

% switch Stat
%     case 1
%         X1 = mean(X1,1);
%         X2 = mean(X2,1);
%     case 2
%         X1 = median(X1,1);
%         X2 = median(X2,1);
% end;

d = X1-X2;
pvalue2 = 100*pvalue/2; 
c1 = pvalue2;
c2 = 100-pvalue2;

conf_interv = prctile(d,[c1,c2],2); %[2.5,97.5]
p = conf_interv(:,1).*conf_interv(:,2);
p = p>0;

Ns = size(X1,1);
pU = zeros(Ns,1);
for i=1:Ns
    pU(i) = ranksum(X1(i,:)',X2(i,:)');
end;
%p = [conf_interv(1),mean(d),conf_interv(2)];

return;
