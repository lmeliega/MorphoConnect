function [r,p] = distancecorr_temp1(X,Nboot)

% This function calculates the distance correlation between variables X and Y.
%
% Input parameters:
%    X,Y : data vectors of the same length.
%    Nboot : Number of permutation for computing the p-value.
%    
% Output parameters:
%    r :  distance correlation coefficient.
%    p :  pvalue of the correlation coefficient.
%
% References:
%
% [1] GÁBOR J. SZÉKELY,1 MARIA L. RIZZO AND NAIL K. BAKIROV. MEASURING AND TESTING DEPENDENCE BY CORRELATION OF DISTANCES.
%     The Annals of Statistics 2007, Vol. 35, No. 6, 2769–2794

% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, September 3rd, 2010

N = size(X,1); % Number of observations.
Nv = size(X,2); % Number of variables.

A = zeros(N,N,Nv);
AA = zeros(N*N,Nv);
Cte = (1/N^2);
for i=1:Nv
    d = pdist(X(:,i),'euclidean');
    D = squareform(d);
    at = mean(D,1);
    [ak_hat,al_hat] = meshgrid(at,at);
    asum = Cte*sum(D(:));
    Atemp = D - ak_hat - al_hat + asum;
    A(:,:,i) = Atemp;
    AA(:,i) = Atemp(:);
end;

VXY2 = AA'*AA;
VX2VY2 = sqrt(diag(VXY2)*diag(VXY2)');
r = sqrt(VXY2./VX2VY2);

indAux = 1:N*N;
indAux = reshape(indAux,[N,N]);
rboot = zeros(Nv,Nv,Nboot);
if Nboot~=1
    AAb = zeros(N*N,Nv);
    H = waitbar(0,'Doing permutation process for p-values ...','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNboot = num2str(Nboot);    
    for i=1:Nboot
        waitbar(i/Nboot,H, ['Doing permutation process for p-values ...' num2str(i) ' of ' StringNboot]);
        for j=1:Nv
            inda = randsample(N,N);
            indAuxt = indAux(inda,inda);
            indAuxt = indAuxt(:);
            AAb(:,j) = AA(indAuxt,j);
        end;
        VXY2 = AAb'*AAb;
        VX2VY2 = sqrt(diag(VXY2)*diag(VXY2)');
        rboot(:,:,i) = sqrt(VXY2./VX2VY2);
    end;
    rboot = reshape(rboot,[Nv*Nv,Nboot]);
    rc = repmat(r(:),[1,Nboot]);
    p = sum(rc<rboot,2)./Nboot;
    p = reshape(p,[Nv,Nv]);
    close(H);
else
    p = NaN;
end;

return;


