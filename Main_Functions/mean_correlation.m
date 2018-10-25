function [Cmean,p] = mean_correlation(Cin,nv)

% This function calculates the mean correlation matrix transforming the
% correlation values to z values, taking the mean and transforming back to correlation values.
% If the connectivity matrix has only one repetition (2D) then a mean across the columns is taken. 
%
%  Input parameter:
%        Cin : Correlation Matrix.
%         nv : number of data for calculation the correlation coefficient.
%
%  Output parameter:
%       Cmean : Mean correlation matrix.
%          p  : p-value matrix.
% 
%% Lester Melie Garcia
% LREN, CHUV Lausanne July 5th 2017

[m,~,Nr] = size(Cin); % Number of variables in Correlation coefficients ...

z = fisherTransform(Cin,nv,1); % Fisher transformation ...
if Nr>1
    zmean = mean(z,3);
    Cmean=(exp(2*zmean)-1)./(exp(2*zmean)+1); % inverse fisher transform.
    
    lowerhalf = (tril(ones(m),-1)>0);
    
    rv = Cmean(lowerhalf);
    
    Tstat = rv .* sqrt((nv-2) ./ (1 - rv.^2));
    p = zeros(m);
    p(lowerhalf) = 2*tpvalue(-abs(Tstat),nv-2);
    p = p + p';
else
    if sum(diag(Cin))==0
        zmean = sum(z,2)./(m-1);
    else
        zmean = mean(z,2);
    end;
    Cmean=(exp(2*zmean)-1)./(exp(2*zmean)+1); % inverse fisher transform.
    p = [];
end;

end