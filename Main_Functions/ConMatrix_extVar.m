function [ConMat,pCt] = ConMatrix_extVar(Y,ExtVar)

% This function calculates a connectivity matrix where each element cij will the correlation of the interaction between 
% structure i and j with external variable.

%% Lester Melie Garcia
% LREN, CHUV.
% April 7th, 2016

ExtVar = ExtVar(:);
Ns = size(Y,2);
ConMat = zeros(Ns,Ns); pCt = zeros(Ns,Ns);
for i=1:Ns
    for j=i+1:Ns
        [Ct,pt] = corrcoef(Y(:,i).*Y(:,j),ExtVar);
        ConMat(i,j) = Ct(1,2); pCt(i,j) = pt(1,2);
    end;
end;

ConMat = ConMat + ConMat';
pCt = pCt + pCt';

end