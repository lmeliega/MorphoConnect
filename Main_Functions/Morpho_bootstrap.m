function [ConnectMatrix1,ConnectMatrix2] = Morpho_bootstrap(Y1,Y2,Nboot,N)

% Syntax: [ConnectMatrix1,ConnectMatrix2] = Morpho_bootstrap(Y1,Y2,Nboot,N)
%
% Input Parameters:
%
%  Y1,Y2 : Input Data Matrices, Y1 --> Ns1xNStruct, Y2 --> Ns2xNStruct, Ns1,Ns2 : number of subjects 
%  Nboot : Number of bootstrap
%      N : Number of subjects for bootstrap. This is used when the function is invoked as: 
%                                            ConnectMatrix1 =  Morpho_bootstrap(Y1,'',Nboot,N)
% 
% Output Parameters:
%
%   ConnectMatrix1,ConnectMatrix2 : Sampled Connectivity matrices ; size(ConnectMatrix1)= NStruct x NStruct x Nboot
%
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 21st, 2008

[Ns1,NStruct] = size(Y1);
k = 1:NStruct;
inddiag = (k-1)*NStruct + k;

if isempty(Y2)
    Ns = Ns1;
    ConnectMatrix2 = [];
    ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
    for i=1:Nboot
        ind1 = randsample(Ns,N);
        C1 = single(corrcoef(Y1(ind1,:)));
        C1(inddiag) = 0; %#ok
        C1 = 0.5*(C1 + C1');
        ConnectMatrix1(:,:,i) = C1;
    end;
else    
    Ns2 = size(Y2,1);
    Ns = Ns1 + Ns2; % Total number of Subjects.
    Y = [Y1;Y2];
    ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
    ConnectMatrix2 = zeros(NStruct,NStruct,Nboot,'single');
    for i=1:Nboot
        ind1 = randsample(Ns,Ns1);
        ind2 = randsample(Ns,Ns2);
        C1 = single(corrcoef(Y(ind1,:)));
        C1(inddiag) = 0; %#ok
        C1 = 0.5*(C1 + C1');
        ConnectMatrix1(:,:,i) = C1;
        C2 = single(corrcoef(Y(ind2,:)));
        C2(inddiag) = 0; %#ok
        C2 = 0.5*(C2 + C2');
        ConnectMatrix2(:,:,i) = C2;
    end;
end;

return;