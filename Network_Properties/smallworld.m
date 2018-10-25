function [ganma, lambda, sigma, Mat_rand, D_rand, Clux_rand, L_rand] = smallworld(Mat, Clux, charPathL)

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

N = size(Mat,1);

H = waitbar(0,'Generating random networks ...');
Ng = 1;
Clux_rand = zeros(Ng,1);
L_rand = zeros(Ng,1);
lambda = zeros(Ng,1);
ganma = zeros(Ng,1);
sigma = zeros(Ng,1);
for i = 1:Ng
    waitbar(i/Ng,H);
    %Map_rand = randmiou(Mat, 25);
    Mat_rand = randmio_und(Mat, 100);
    % [Map_rand] = randomMatrix(Mat,1);
    Clux_rand(i) = mean(clustering(Mat_rand));
    Dist_rand = Mat_rand.^(-1); ind = isinf(Dist_rand);   Dist_rand(ind)=0;
    D_rand = dijk(Dist_rand); ind = isinf(D_rand); D_rand(ind) = 0;
    L_rand(i) = sum(sum(D_rand))/(N*(N-1));
    
    lambda(i) = Clux/Clux_rand(i);
    ganma(i) = charPathL/L_rand(i);
    sigma(i) = lambda(i)/ganma(i);
end
close(H)

Clux_rand = mean(Clux_rand);
L_rand = mean(L_rand);
lambda = mean(lambda);
ganma = mean(ganma);
sigma = mean(sigma);
disp(['sigma... ' num2str(sigma)]);
