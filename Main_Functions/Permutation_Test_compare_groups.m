function [p,pmax] = Permutation_Test_compare_groups(X1,X2,X1b,X2b,isabs)

% Input Parameters
%   X1,X2,X1boot,X2boot :  Data set
%                     
% Output Parameters 
%
%   p : p-value of the permutation process.
%
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% October 9th, 2009.
% Modified: January 24th, 2017

if ~exist('isabs','var')
    isabs=false;
end;

NZ=size(X1b);
switch length(NZ)
    case 1
        Nstruct=1; Nboot=NZ(1); Nspar=1;
    case 2
        Nstruct=1; Nboot=NZ(1); Nspar=NZ(2);
    case 3
        Nstruct=NZ(1); Nboot=NZ(2); Nspar=NZ(3);
end;

if length(NZ)
[Nstruct,Nv]=
N = size(X1b,1);
%[N,Nv] = size(X1b);
%p = zeros(Nv,1);
%ppr = p;
%dm = (X1-X2); dmp = dm;
%dmij = (X1b - X2b)';

dm = abs(X1-X2); % dmp = dm;
dmij = abs(X1b - X2b)';

dm = repmat(dm,[1,N]);
p = sum(dm>dmij,2)./N;

%dmax = max(dmij,[],1);
%ppr = prctile(dmax,95);

p = 1-p;
pmax = 999;
% pmax = 1-pmax;

return;
