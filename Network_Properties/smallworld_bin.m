function [gamna, lambda, sigma, Mat_rand, D_rand] = smallworld_bin(Mat, Clux, charPathL)
%[gamna, lambda, sigma, Mat_rand, D_rand]=smallworld(Mat, Clux, charPathL)
% ...calculates mainly the small world condition sigma

% Mat= Binary inputmatrix
% Clux = Clusterindex
% charPathL= Characteristic path length, global mean of the finite entries 
%            of its distance matrix, in literature iqual to L
% gamna= relative clusterindex, gamna >>1 for small world
% lambda= relative pathlength, Lambda ~1 for small world
% sigma= small world condition, sigma>1 for small world
% Mat_rand= Randomized binary inputmatrix 
% D_rand= Randomized distancematrix (compare D) as input for relative values
%
% Modified by: Lester Melie Garcia
% Cuban Neuroscience Center
% February 23rd, 2010

N = size(Mat,1);

Mat_rand = randmio_und(Mat, 100);
Clux_rand = mean(clustering_coef_bu(Mat_rand));
gamna = Clux/Clux_rand;
    
D_rand = distance_bin(Mat_rand);  
ind = (D_rand==Inf);  
D_rand(ind)=0; 

L_rand = sum(sum(D_rand))/(N*(N-1));
lambda = charPathL/L_rand;
    
sigma = gamna/lambda;  
    