function Morpho_Save2plotBrainNet

% This functions save to file to plot in BrainNet.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% November 21st, 2012


Text2File = cell(N,1);
for i=1:N
    Text2File{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ',StructCodes(indj(i)).Name,'  : ', num2str(ConMat(indi(i),indj(i),:))];
end;



