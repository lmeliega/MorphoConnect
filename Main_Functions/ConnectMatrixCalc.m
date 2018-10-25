function [C,p] = ConnectMatrixCalc(X, Connectivity_Method, pvalue)

% This function calculates the connectivity matrix using different
% correlation or interaction measures.
%
% Input Parameters:
%     X : Data Matrix
%
%   Connectivity_Method : Correlation method for connectivity assesment.  
%                         Connectivity_Method = 1 : Pearson Correlation.
%                         Connectivity_Method = 2 : Partial Correlation. 
%                         Connectivity_Method = 3 : Distance Correlation.
%                         Connectivity_Method = 4 : Distance Correlation for fMRI.
%                         Connectivity_Method = 5 : Euclidean distance
%
% Output Parameters:
%       C : Connectivity or association matrix.
%       p : p-value matrix of the association matrix.
%
% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, November 20th, 2010

if ~exist('Connectivity_Method','var')
    Connectivity_Method = 1;
end;
[Ns,NStruct] = size(X);
switch Connectivity_Method
    case 1  % Pearson Correlation
        [C,p] = corrcoef(X);
        %[C,p] = pearson_correlation(X,1000);
    case 2  % Partial Correlation
        [C,p] = partial_correlation(X);
    case 3  % Distance Correlation
        [C,p] = distancecorrM(X,1000);
    %case 4  % Distance Correlation for fMRI
    %    [C,p] = distancecorrMfMRI(X,1000);
    case 4  % Pearson distance
        [C,p] = corrcoef(X);
        C = 1-C; %indf = C>0; C(indf) = 1./C(indf);
    case 5  % Euclidean distance
        [C,p] = euclidean_dist(X);
end;

 % Zeroing diagonal elements of Connectivity matrix
k = 1:NStruct;
inddiag = (k-1)*NStruct + k;
C(inddiag) = 0; %#ok
C = 0.5*(C + C');
p(inddiag) = 0; %#ok
p = 0.5*(p + p');

return;