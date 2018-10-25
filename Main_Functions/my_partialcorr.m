function [R,p] = my_partialcorr(X)

% This is another way of calculating the partial correlation using 
% the 'partialcorr' subroutine provided by MATLAB.
%
% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% December 18th, 2010.

[Nob,Nv] = size(X);
R = zeros(Nv,Nv);
p = zeros(Nv,Nv);
s = logical(ones(Nv,1));
for i=1:Nv
    for j=i+1:Nv
        sp = s; sp(i)=false; sp(j)=false;
        Z = X(:,sp);        
        [Rt,pt] = partialcorr([X(:,i),X(:,j)],Z);
        R(i,j) = Rt(1,2);
        p(i,j) = pt(1,2);
    end;
end;

R = R + R';
p = p + p';

return;
