function R = vectorcorrM(X,method)

% This function calculates the vector correlation between different sites.
%
% Input Parameters:
%     X : Matrix of dimension n x m x p; n : number of vector samples (repetitions); m : number of sites; p :  vector size
%    Method : Method for calculation de correlation Matrix. 
%             Method = 1 --> Mardia definition of Correlation. See
%                            reference below
%             Method = 2 --> Canonical Correlation. The first canonical
%                            correlation is took it into account.
%             Method = 3 --> Distance Correlation. (See Reference 2)
%     
% Output Parameters:
%     R : Matrix of the Vector correlation between 'm' sites.
%
% [1] - P. E. Jupp and K. V. Mardia. A General Correlation Coefficient for Directional Data and Related Regression Problems
%      Biometrika, Vol. 67, No. 1 (Apr., 1980), pp. 163-173
% [2] - GÁBOR J. SZÉKELY,1 MARIA L. RIZZO AND NAIL K. BAKIROV. MEASURING AND TESTING DEPENDENCE BY CORRELATION OF DISTANCES.
%      The Annals of Statistics 2007, Vol. 35, No. 6, 2769–2794
% 
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 12th, 2008


[n,p,m] = size(X);
X = permute(X,[1 3 2]);
R = zeros(p,p);

switch method
    case 1 % Mardia's correlation
        for i=1:p
            for j=i+1:p
                Sigma = cov([X(:,:,i),X(:,:,j)],1); % X(:,:,i) : variables for the site 'i' ; X(:,:,j) : variables for the site 'j'
                SigmaXX = Sigma(1:m,1:m);
                SigmaYY = Sigma(m+1:end,m+1:end);
                SigmaXY = Sigma(m+1:end,1:m);
                SigmaYX = Sigma(1:m,m+1:end);
                m = min(rank(SigmaXX),rank(SigmaYY));
                r2 = (1/m)*trace(pinv(SigmaXX)*SigmaXY*pinv(SigmaYY)*SigmaYX); % see Reference [1], expression 2.1 
                R(i,j) = sqrt(r2);                
                %if R(i,j)>1
                %    keyboard;
                %end;
            end;
        end; 
    case 2 % Canonical Correlation
        for i=1:p
            for j=i+1:p
                [A,B,r] = canoncorr(X(:,:,i),X(:,:,j)); % X(:,:,i) : variables for the site 'i' ; X(:,:,j) : variables for the site 'j'
                R(i,j) = r(1); % Taking the first canonical correlation.
            end;
        end;
    case 3 % Distance correlation
        for i=1:p
            for j=i+1:p
                R(i,j) = distancecorr(X(:,:,i),X(:,:,j)); % X(:,:,i) : variables for the site 'i' ; X(:,:,j) : variables for the site 'j'
            end;
        end;
end;

R = R + R';

return;