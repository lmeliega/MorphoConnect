function [HomoConn,NetProps] = Connnectivity_Homologous(ConMat,isNetProps)

% This function calculates the global homologous connections strength.
% If ConMat is a NetProps variable a new field NetProps.HomologousStructConnection will be added to this struct variable.
%
%% Lester Melie Garcia
% LREN, Lausanne, November 18th, 2016

if isNetProps
    NetProps=ConMat;
    ConMat=double(NetProps.ConMat);
end;

[Nstruct,~,Nrep]=size(ConMat);
ind_half1 = 1:floor(Nstruct/2); ind_half2 = floor(Nstruct/2)+1:Nstruct;
HomoConn = zeros(Nrep,1);
for i=1:Nrep
    ConMat_inter = abs(ConMat(ind_half1,ind_half2,i)); % Inter-hemispheric part of the Connectivity Matrix.
    HomoConn(i) = mean(diag(ConMat_inter));
end;

if isNetProps
    NetProps.HomologousStructConnection = HomoConn;
else
    NetProps = [];
end;

end