function [Nc,thresC,thresS,thresAve,thresbins,thresS_course] = Netlargest_comp(ConMat,waitbarflag)

% This function gives the curve of the largest component in the Network
% represented by the connectivity matrix C.
%
% Input Parameters:
%    ConMat : Connectivity Matrix.
%   waitbarflag : if waitbarflag=1, a progressing bar is showed.
%
% Output Parameters:
%     Nc  : curve of the largest component in the Network.
%  thresC : value of the threshold for the connectivity matrix.
%  thresS : value of the threshold for the sparsity degree.
% thresAve : value of the threshold for the average degree where the theoretical value for calculating 
%            sigma network property is possible (2*log(N)).
% thresbins : sparsity degree's bins used for calculating previous measures.
% thresS_course : values of the threshold for the sparsity degree for a set of ConMat repetitions .. This is useful when ConMat is a 3D matrix.
%
%% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% December 18th, 2010.

thres_min = 1;
thres_max = 98;
step = 1;
thresbins = thres_min:step:thres_max; % sparsity degree values.
Nbins = length(thresbins);
N = size(ConMat,1); % Number of nodes.
Is_symmetric = not(logical(sum(sum(ConMat(:,:,1)~=ConMat(:,:,1)'))));

lowerhalf = (tril(ones(N),-1)>0);
upperhalf = (triu(ones(N), 1)>0);

if Is_symmetric
    ind = lowerhalf;
else
    ind = lowerhalf | upperhalf;
end;

Avethres = 2*log(N); % Theoretical value for calculating sigma network property.

Nrep = size(ConMat,3);
Nc = zeros(Nbins,Nrep);
Thresh = zeros(Nbins,Nrep);
Avdegree = zeros(Nbins,Nrep); % Average degree;
thresC = zeros(Nrep,1);
thresS_course = zeros(Nrep,1);
thresAve = zeros(Nrep,1);
if exist('waitbarflag','var')&&waitbarflag
    H = waitbar(0,'Largest Component ...: Repetition ','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
    StringNRep = num2str(Nrep);
end;
for j=1:Nrep
    if exist('waitbarflag','var')&&waitbarflag
        waitbar(j/Nrep,H, ['Largest Component ...: Repetition ' num2str(j) ' of ' StringNRep]);
    end;    
    for i=1:Nbins
        percent = thresbins(i);
        ConMat_Temp = ConMat(:,:,j);
        Thresh(i,j)  = myprctile(abs(ConMat_Temp(ind)),percent);
        C = abs(ConMat_Temp)>Thresh(i,j);
        X = sum(C,1);
        Nc(i,j) = sum(X>0);
        if Is_symmetric
            Avdegree(i,j) = 2*nnz(C(ind)~=0)/N;
        else
            Avdegree(i,j) = nnz(C(ind)~=0)/N;
        end;
    end;
    thresC(j) = Thresh(max(find(Nc(:,j)==N))); %#ok
    thresS_course(j) = thresbins(max(find(Nc(:,j)==N))); %#ok
    thresAve(j) = thresbins(max(find(Avdegree(:,j)>Avethres))); %#ok
end;
if exist('waitbarflag','var')&&waitbarflag
    close(H);
end;

thresC = mean(thresC);  % For 3D connectivity matrices this does not make sense.
thresS = min(thresS_course);
thresAve = min(thresAve);

return;