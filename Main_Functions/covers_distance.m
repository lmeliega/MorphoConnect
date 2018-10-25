function [NXY,P11,P10,P01] = covers_distance(X,Y)


%% Lester Melie-Garcia
%  LREN, CHUV, Lausanne October 3rd 2017

[NnodesX,NcovX] = size(X);
[NnodesY,NcovY] = size(Y);

if NnodesX~=NnodesY
    disp('The number of nodes in both partitions are not the same ... Please check this ... ');
    NXY = [];
    return;
end;

P11 = (X'*Y)./NnodesX; % Matrix of NcovX x NcovY
Nk = repmat(sum(X)',1,NcovY)./NnodesX;
Nl = repmat(sum(Y) ,NcovX,1)./NnodesX;

P10 = Nk-P11;
P01 = Nl-P11;

Ukl = zeros(NcovX,NcovY); % Union of Xk with Xl
for i=1:NcovX
    for j=1:NcovY
        Ukl(i,j) = sum(double((X(:,i)+Y(:,j))>0));
    end;
end;
P00 = 1 - Ukl./NnodesX;
PX_1 = sum(X)./NnodesX; PX_1 = repmat(PX_1',1,NcovY);
PX_0 = 1-PX_1; 
PY_1 = sum(Y)./NnodesX; PY_1 = repmat(PY_1,NcovX,1);
PY_0 = 1-PY_1; 

HXkYl = pEntropy(P11)+pEntropy(P00)+pEntropy(P10)+pEntropy(P01)-pEntropy(PY_1)-pEntropy(PY_0);
HYlXk = pEntropy(P11)+pEntropy(P00)+pEntropy(P10)+pEntropy(P01)-pEntropy(PX_1)-pEntropy(PX_0);

inds = (pEntropy(P11)+pEntropy(P00))>(pEntropy(P10)+pEntropy(P01));

HXkY = zeros(NcovX,1);
for i=1:NcovX
    if any(inds(i,:))
        HXkY(i) = min(HXkYl(i,inds(i,:)));
    else
        HXkY(i) =  pEntropy(PX_1(i,1)) + pEntropy(PX_0(i,1));
    end;
end;
HYlX = zeros(NcovY,1);
for j=1:NcovY
    if any(inds(:,j))
        HYlX(j) = min(HYlXk(inds(:,j),j));
    else
        HYlX(j) = pEntropy(PY_1(1,j)) + pEntropy(PY_0(1,j));
    end;
end;

% HXk = pEntropy(Nk(:,1)); HXk = HXk(:);
% HYl = pEntropy(Nl(1,:)); HYl = HYl(:);

HXk = pEntropy(PX_1(:,1)) + pEntropy(PX_0(:,1)); HXk = HXk(:);
HYl = pEntropy(PY_1(1,:)) + pEntropy(PY_0(1,:)); HYl = HYl(:);

HXYnorm = sum(HXkY./HXk)/NnodesX;
HYXnorm = sum(HYlX./HYl)/NnodesY;

NXY = 1 - (HXYnorm + HYXnorm)/2;  

end


%% === Internal Functions === %%
function H = pEntropy(p)

H = -p.*log2(p);
H(p==0) = 0;

end