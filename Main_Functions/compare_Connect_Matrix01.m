function x = compare_Connect_Matrix01(ConMat1,ConMat2)

% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% September 8th, 2009.


ConMat1 = abs(ConMat1);
ConMat2 = abs(ConMat2);

N = size(ConMat1,1);

percent = 1:1:90;
Np = length(percent);

ind = abs(ConMat1)>0;
thresh1  = myprctile(ConMat1(ind),percent);

ind = abs(ConMat2)>0;
thresh2  = myprctile(ConMat2(ind),percent);

x = zeros(Np,1);
for i=1:Np
    C11 = ConMat1>=thresh1(i);
    C10 = not(C11);
    C21 = ConMat2>=thresh2(i);
    C20 = not(C21);
    C1 =  sum(C11(:)& C21(:))/sum(C11(:));
    C2 =  (sum(C10(:)&C20(:))- N) /(sum(C10(:))-N);
    %x(i) = sqrt(C1*C2);
    %x(i) = sum(C11(:)& C21(:));
    %x(i) = C2;
    x(i) = C1*C2;
    %x(i) = sqrt(sum((C11(:)-C21(:)).^2));
end;

return;