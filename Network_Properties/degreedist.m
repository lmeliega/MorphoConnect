function [x, y, cy] = degreedist(Mat, Mat_rand)
% [x, y, cy]=degreedist(Mat, Mat_rand)
% ...calculates the Degree Distribution:
% Since not all nodes in a complex network have the same degree,
% usually a degree distribution P(k) is defined. This gives the
% probability that a randomly selected node has k arcs.The degree distribution properties are commonly
% employed to classify networks into different categories.
% three classes of small-world networks attending to their degree distribution
% properties: 1) scale-free networks, 2) broad-scale networks, and
% 3) single-scale networks.

% Mat= Binary inputmatrix
% Mat_rand= Randomized binary inputmatrix 
% x= N-1x1 channels
% y= degree distribution
% cy= cumulative degree distribution

% ?? Fitparameter and Goodness of Fit as output?? 

N = size(Mat,1);
N_original = length(Mat);
for k_edges = 1:N-1
    for node = 1:N
        row_conn = sort(Mat(node,:),'descend');
        Distrib(node) = prod(row_conn(1:k_edges));
    end
    P(k_edges) = (1/N)*sum(Distrib);
end
x1 = [1:N-1]';
y1 = P';


%cumulated
x = [1:N_original-1]';
y = zeros(1,N_original-1)'; y(1:N-1) = y1;
for k = 1:N-1
    cy1(k) = sum(y(k:end));    
end
cy = zeros(1,N_original-1)'; 
cy(1:N-1) = cy1;


% a*x^(-b)           % Scale Free
% a*x^(-b)*exp(-x/c) % Broad Scale
% a*exp(-x/c)        % Single Scale

% cftool

% For Broad-Scale case:
ftype_broadscale = fittype('a*x^(-b)*exp(-x/c)'); % ftype can be changed according
                                                  %to the model (ex. Small-word or free scale)
[fresult_BS,gof_BS] = fit(x,y,ftype_broadscale);
a_BS=fresult_BS.a;
b_BS=fresult_BS.b;
c_BS=fresult_BS.c;

% For Scale-Free case: 
ftype_scalefree = fittype('a*x^(-b)');
[fresult_SF,gof_SF] = fit(x,y,ftype_scalefree);
a_SF=fresult_SF.a;
b_SF=fresult_SF.b;

% For Single-Scale case:
ftype_singlescale = fittype('a*exp(-x/c)');
[fresult_SS,gof_SS] = fit(x,y,ftype_singlescale);
a_SS=fresult_SS.a;
c_SS=fresult_SS.c;


R2=[gof_BS.rsquare, gof_SF.rsquare, gof_SS.rsquare ];
[C,I] = max(R2);
if I==1
    disp(['Broad-Scale behaviour'])
%     figure
%     plot(x,y)
%     hold on
%     plot(fresult_BS)
elseif I==2
    disp(['Scale-Free behaviour'])
%     figure
%     plot(x,y)
%     hold on
%     plot(fresult_SF)
elseif I==3
    disp(['Single-Scale behaviour'])
%     figure
%     plot(x,y)
%     hold on
%     plot(fresult_SS)
end

% figure
% plot(x,y)
% hold on
% plot(fresult_BS)


% ======= Original========================
% ftype_broadscale = fittype('a*x^(-b)*exp(-x/c)'); % ftype can be changed according
% %to the model (ex. Small-word or free scale)
% ftype_scalefree = fittype('a*x^(-b)');
% ftype_singlescale = fittype('a*exp(-x/c)');
% 
% [fresult,gof] = fit(x',y',ftype);
% a=fresult.a;
% b=fresult.b;
% c=fresult.c;

return