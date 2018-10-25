clear;
X = load('D:\WORK\Connectivity\Correlation_Measures\Distance_Correlation\Eckerle4_data.txt');
% pT = zeros(5000,1);
% for i=1:5000
%     [R,p] = distancecorrM(X);
%     pT(i) = p(1,2);
% end;
% 
% figure; hist(pT,50);
% [mean(pT),std(pT)]

[R,p,rmax,pmax] = distancecorrM(X,2000);