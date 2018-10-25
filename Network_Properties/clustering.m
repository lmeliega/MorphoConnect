function [Cluxi,Clux] = clustering(Mat)
% Clux = clustering(Mat)
% ...calculates clusterindex of Mat

% Clux = Clusterindex

N = size(Mat,1);
% Weighted clustering  (Onnela et. al., 2005):
Mat2 = Mat/max(max(Mat));
Cluxi = zeros(N,1);
ki = zeros(N,1);
for i = 1:N
    ki(i) = length(find(Mat2(i,:)));
    sum_term = 0;
    for j = 1:N
        aij = double(Mat2(i,j)>0);
        if aij > 0
            wij = Mat2(i,j);
            for h = 1:N
                whi = Mat2(h,i);
                wjh = Mat2(j,h);
                sum_term = sum_term + (wij*wjh*whi)^(1/3);
            end
        end
    end
    Cluxi(i) = (1/(ki(i)*(ki(i)-1)+eps))*sum_term;
end

Clux = mean(Cluxi);

%disp(['Cluster Index... ' num2str(Clux)]);