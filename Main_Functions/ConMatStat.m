function [Xthres,THstat] = ConMatStat(X,fdrflag,qvalue,N) 

% Input Parameters:
%      X : Statistic matrix. It could be pvalues in case of using False
%          discovery rate as method for the multiple tests correction.
%      fdrflag : possible values: 'locfdr' or 'fdr'
%      qvalue : fdr or local fdr (locfdr) q-value.
%      N : Number of data used for calculating the correlation measure.
%
% Output Parameters:
%       Xthres : Statistic matrix thresholded.
%       THstat : range of significant values. 
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 19th, 2010

Nv = size(X,1);

Is_symmetric = not(logical(sum(sum(X~=X'))));
lowerhalf = (tril(ones(Nv),-1)>0);
if Is_symmetric
    ind = lowerhalf;
else
    upperhalf = (triu(ones(Nv), 1)>0);
    ind = lowerhalf | upperhalf;
end;

Xthres = zeros(Nv);
if strcmpi(fdrflag,'locfdr')
    fdroptionsq= qvalue;
    fdroptionsstat='z';
    fdroptionsdep=1;
    fdroptionstail='both';
    k = 1;
    fdroptionsN = N-2-k;
    [THstat,indsig,maxPVAL] = fdrthreshold(X(ind), fdroptionsN,fdrflag, ...
        fdroptionsq,fdroptionsstat,fdroptionsdep,fdroptionstail);
    Xthres(X<THstat(1)) = 1;
    Xthres(X>THstat(2)) = 1;
end;
if strcmpi(fdrflag,'fdr')
    [THstat,THstatN] = fdr(X(ind),qvalue);
    if ~isempty(THstat)
        Xthres(ind)= X(ind)<THstat;
    else
        Xthres(ind)= -999999999;
    end;
end;

if Is_symmetric
    Xthres = Xthres + Xthres';
end;

Xthres = logical(Xthres);

return;