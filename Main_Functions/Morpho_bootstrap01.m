function [ConnectMatrix1,ConnectMatrix2,ind,pValue1,ConnectMatrix1_jack,pValue1_jack] = Morpho_bootstrap01(Y1,Y2,Nboot,N,ind,Connectivity_Method,isReplacement,isDependent)

% Syntax: [ConnectMatrix1,ConnectMatrix2,ind,pValue1,ConnectMatrix1_jack,pValue1_jack] = Morpho_bootstrap01(Y1,Y2,Nboot,N,ind,Connectivity_Method,isReplacement)
%
% Input Parameters:
%
%  Y1,Y2 : Input Data Matrices, Y1 --> Ns1xNStruct, Y2 --> Ns2xNStruct, Ns1,Ns2 : number of subjects 
%  Nboot : Number of bootstrap
%      N : Number of subjects for bootstrap. This is used when the function is invoked as: 
%                                            ConnectMatrix1 =  Morpho_bootstrap(Y1,'',Nboot,N)
%    ind : Optional parameter. If 'ind' is isempty the bootstrap indexes are generated here. 
% 
%   Connectivity_Method : Correlation method for connectivity assesment.  
%                         Connectivity_Method = 1 : Pearson Correlation.
%                         Connectivity_Method = 2 : Partial Correlation. 
%                         Connectivity_Method = 3 : Distance Correlation.
%   isReplacement : It defines if the bootstarping process is with replacement or not.
%   isDependent : It defines, in the case of Y1 and Y2 exist, if the permutation process will be between dependent samples. In other words
%                 indicates if Y1 and Y2 are dependent (same subjects in two conditions)
%
% Output Parameters:
%
%   ConnectMatrix1,ConnectMatrix2 : Sampled Connectivity matrices ; size(ConnectMatrix1)= NStruct x NStruct x Nboot
%   ind : index used for bootstraping.
%   pValue1 : matrix of p-values.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 21st, 2008
% last modification: January 19th, 2017

[Ns1,NStruct] = size(Y1);
%k = 1:NStruct;
%inddiag = (k-1)*NStruct + k;

if ~exist('Connectivity_Method','var')
    Connectivity_Method = 1;
end;
if ~exist('isReplacement','var')
    isReplacement = false;
end;
if ~exist('isDependent','var')
    isDependent = false;
end;
% if isempty(ind)
%     ind = 0; %#ok
% end;
ConnectMatrix1 = 0; %#ok
ConnectMatrix2 = []; %#ok
H = waitbar(0,['Number of Bootstraps  ' num2str(Nboot)],'Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
if isempty(Y2) % Case of one Data Matrix
    if isempty(ind)
        Ns = Ns1;
        ConnectMatrix2 = [];
        ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');  % bootstrapped connectivity matrices.
        ConnectMatrix1_jack = zeros(NStruct,NStruct,Ns,'single'); % jacknife connectivity matrices.
        pValue1 = zeros(NStruct,NStruct,Nboot,'single');
        pValue1_jack = zeros(NStruct,NStruct,Ns,'single'); % jacknife p-values matrices.
        ind = zeros(N,Nboot);
        for i=1:Nboot
            waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
            ind1 = randsample(Ns,N,isReplacement);
            ind(:,i) = ind1;
            [C1,pVals] = ConnectMatrixCalc(Y1(ind1,:),Connectivity_Method);
            ConnectMatrix1(:,:,i) = single(C1);
            pValue1(:,:,i) = pVals;
        end;
        ind = int16(ind);
        % for jackknife Connectivity matrix
        indjack=1:Ns;
        for i=1:Ns
            indp=indjack;
            indp(i)=[];
            [Cjack,pValsjack] = ConnectMatrixCalc(Y1(indp,:),Connectivity_Method);
            ConnectMatrix1_jack(:,:,i)=single(Cjack);
            pValue1_jack(:,:,i) = pValsjack;
        end;
    else
        [~,Nboot] = size(ind);
        ConnectMatrix2 = [];
        ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
        ConnectMatrix1_jack = zeros(NStruct,NStruct,Ns1,'single'); % jacknife connectivity matrices.        
        pValue1 = zeros(NStruct,NStruct,Nboot,'single');
        pValue1_jack = zeros(NStruct,NStruct,Ns1,'single'); % jacknife p-values matrices.
        for i=1:Nboot
            waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
            ind1 = ind(:,i);
            [C1,pVals] = ConnectMatrixCalc(Y1(ind1,:),Connectivity_Method);
            ConnectMatrix1(:,:,i) = single(C1);
            pValue1(:,:,i) = pVals;
        end;
        indjack=1:Ns1;
        for i=1:Ns1
            indp=indjack;
            indp(i)=[];
            [Cjack,pValsjack] = ConnectMatrixCalc(Y1(indp,:),Connectivity_Method);
            ConnectMatrix1_jack(:,:,i)=single(Cjack);
            pValue1_jack(:,:,i) = pValsjack;
        end;
    end;
else    
    ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
    ConnectMatrix2 = zeros(NStruct,NStruct,Nboot,'single');
    %[Y1p,Y2p] = Data_permutation01(Y1,Y2,Nboot,0);
    for i=1:Nboot
        waitbar(i/Nboot,H,['Number of Permutations  ' num2str(i) ' of ' num2str(Nboot)]);
        %[Y1p,Y2p] = Data_permutation(Y1,Y2,1,0);
        [Y1p,Y2p] = Data_permutation01(Y1,Y2,1,isDependent);
        C1 = single(ConnectMatrixCalc(Y1p,Connectivity_Method));
        ConnectMatrix1(:,:,i) = C1;
        C2 = single(ConnectMatrixCalc(Y2p,Connectivity_Method));
        ConnectMatrix2(:,:,i) = C2;
    end;    
end;
close(H);

return;
