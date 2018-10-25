function [ConnectMatrix1,ConnectMatrix2,ind] = Morpho_bootstrap01(Y1,Y2,Nboot,N,ind,Connectivity_Method)

% Syntax: [ConnectMatrix1,ConnectMatrix2,ind] = Morpho_bootstrap01(Y1,Y2,Nboot,N)
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

if ~exist('Connectivity_Method','var')
    Connectivity_Method = 1;
end;
% if isempty(ind)
%     ind = 0; %#ok
% end;
ConnectMatrix1 = 0; %#ok
ConnectMatrix2 = 0; %#ok
H = waitbar(0,['Number of Bootstraps  ' num2str(Nboot)],'Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
if isempty(Y2) % Case of one Data Matrix
    if isempty(ind)
        Ns = Ns1;
        ConnectMatrix2 = [];
        ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
        ind = zeros(N,Nboot);
        switch Connectivity_Method
            case 1  % Pearson Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = randsample(Ns,N);
                    ind(:,i) = ind1;
                    C1 = single(corrcoef(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
            case 2  % Partial Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = randsample(Ns,N);
                    ind(:,i) = ind1;
                    C1 = single(partial_correlation(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
            case 3  % Distance Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = randsample(Ns,N);
                    ind(:,i) = ind1;
                    C1 = single(distancecorrM(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
        end; % End switch
        ind = int16(ind);
    else
        [N,Nboot] = size(ind);
        ConnectMatrix2 = [];
        ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
        switch Connectivity_Method
            case 1  % Pearson Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = ind(:,i);
                    C1 = single(corrcoef(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
            case 2  % Partial Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = ind(:,i);
                    C1 = single(partial_correlation(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
            case 3  % Distance Correlation
                for i=1:Nboot
                    waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                    ind1 = ind(:,i);
                    C1 = single(distancecorrM(Y1(ind1,:)));
                    C1(inddiag) = 0; %#ok
                    C1 = 0.5*(C1 + C1');
                    ConnectMatrix1(:,:,i) = C1;
                end;
        end;% End switch
    end;
else    
    ConnectMatrix1 = zeros(NStruct,NStruct,Nboot,'single');
    ConnectMatrix2 = zeros(NStruct,NStruct,Nboot,'single');
    %Ns2 = size(Y2,1);
    %Ns = Ns1 + Ns2; % Total number of Subjects.
    %Y = [Y1;Y2];
    %for i=1:Nboot
    %    ind = randsample(Ns,Ns);
    %    ind1 = ind(1:Ns1);
    %    ind2 = ind(Ns1+1:end);
    %    C1 = single(corrcoef(Y(ind1,:)));
    %    C1(inddiag) = 0; %#ok
    %    ConnectMatrix1(:,:,i) = C1;
    %    C2 = single(corrcoef(Y(ind2,:)));
    %    C2(inddiag) = 0; %#ok
    %    ConnectMatrix2(:,:,i) = C2;
    %end;
    switch Connectivity_Method
        case 1  % Pearson Correlation
            for i=1:Nboot
                waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                [Y1p,Y2p] = Data_permutation(Y1,Y2,1,0);
                C1 = single(corrcoef(Y1p));
                C1(inddiag) = 0; %#ok
                C1 = 0.5*(C1 + C1');
                ConnectMatrix1(:,:,i) = C1;
                C2 = single(corrcoef(Y2p));
                C2(inddiag) = 0; %#ok
                C2 = 0.5*(C2 + C2');
                ConnectMatrix2(:,:,i) = C2;
            end;
        case 2  % Partial Correlation
            for i=1:Nboot
                waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                [Y1p,Y2p] = Data_permutation(Y1,Y2,1,0);
                C1 = single(partial_correlation(Y1p));
                C1(inddiag) = 0; %#ok
                C1 = 0.5*(C1 + C1');
                ConnectMatrix1(:,:,i) = C1;
                C2 = single(partial_correlation(Y2p));
                C2(inddiag) = 0; %#ok
                C2 = 0.5*(C2 + C2');
                ConnectMatrix2(:,:,i) = C2;
            end;
        case 3  % Distance Correlation
            for i=1:Nboot
                waitbar(i/Nboot,H,['Number of Bootstraps  ' num2str(i) ' of ' num2str(Nboot)]);
                [Y1p,Y2p] = Data_permutation(Y1,Y2,1,0);
                C1 = single(distancecorrM(Y1p));
                C1(inddiag) = 0; %#ok
                C1 = 0.5*(C1 + C1');
                ConnectMatrix1(:,:,i) = C1;
                C2 = single(distancecorrM(Y2p));
                C2(inddiag) = 0; %#ok
                C2 = 0.5*(C2 + C2');
                ConnectMatrix2(:,:,i) = C2;
            end;
    end;
end;
close(H);

return;
