function gPC = findPCA(Y,Ymean)


% Lester Melie Garcia
% Cuban Neuroscience Center
% November 13th, 2012

[U,s,V] = svd(Y'); % Y: number of subjects by number of structures
Ymean = Ymean(:);
X = [Ymean,V];
Z = corrcoef(X);
Z = abs(Z(1,2:end));
[Zmax,i] = max(Z);
gPC = s(i,i)*mean(U(:,i))*V(:,i);

return;