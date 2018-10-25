function [ci,p,ci_stand] = bootcper_confidence_interval(stat,bstat,alpha)
% corrected percentile bootstrap CI
% B. Efron (1982), "The jackknife, the bootstrap and other resampling
% plans", SIAM.
 
% stat is transformed to a normal random variable z0.
% z0 = invnormCDF[ECDF(stat)]

z_0 = fz0(bstat,stat);
z_alpha = norminv(alpha/2); % normal confidence point
 
% transform z0 back using the invECDF[normCDF(2z0-za)] and
% invECDF[normCDF(2z0+za)] 
pct1 = 100*normcdf(2*z_0-z_alpha); 
pct2 = 100*normcdf(2*z_0+z_alpha);

pct1_stand = 100*normcdf(-z_alpha);
pct2_stand = 100*normcdf(z_alpha);

% inverse ECDF
m = numel(stat);
lower = zeros(1,m);
upper = zeros(1,m);
lower_stand = zeros(1,m); % non-corrected lower ci
upper_stand = zeros(1,m);  % non-corrected upper ci
p = zeros(1,m);
cte = 2*1.96;
for i=1:m
    lower(i) = prctile(bstat(:,i),pct2(i),1);
    upper(i) = prctile(bstat(:,i),pct1(i),1);
    if (upper(i)==0)&&(lower(i)==0)
        SE=inf;
    else
        SE = (upper(i)-lower(i))/cte;
    end;
    zr = abs(stat/SE);
    p(i) = exp(-0.717*zr - 0.416*zr^2);    
    lower_stand(i) = prctile(bstat(:,i),pct2_stand(i),1);
    upper_stand(i) = prctile(bstat(:,i),pct1_stand(i),1);
end

ci = [lower;upper];
ci_stand = [lower_stand;upper_stand];

end 

 
%% ========== Internal functions ========== 
% -------------------------
function z0=fz0(bstat,stat)
% Compute bias-correction constant z0
z0 = norminv(mean(bsxfun(@lt,bstat,stat),1) + mean(bsxfun(@eq,bstat,stat),1)/2);
end   % fz0()