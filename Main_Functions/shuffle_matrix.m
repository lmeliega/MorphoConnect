function [Ar,Br] = shuffle_matrix(A,B,N)

% This function shuffles the matrices A and B , N times. This is used for
% computing probability of null hypothesis H0 of distance correlation
% coefficient r = 0.
%
%  Input Parameters: 
%    A, B : Matrices to be shuffled.
%     N : number of times the matrices A, B will be suffled.
%
% Output Parameters:
%     Ar, Br : Shuffled matrices.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, December 20th, 2010

[Nr,Nc] = size(A);
if Nr~=Nc
    disp('The number of rows and columns have to be the same ...');
    return;
end;

Ar = zeros([Nr,Nr,N]);
Br = zeros([Nr,Nr,N]);
for i=1:N
    inda = randsample(Nr,Nr);
    indb = randsample(Nr,Nr);
    Ar(:,:,i) = A(inda,inda);    
    Br(:,:,i) = B(indb,indb);
end;

return;
    
