function [landf,rof] = spectral_density(Matrix)
% Spectral Density:
N = size(Matrix,1);



% Matrix = Mat; color1 = 'r'; colordef white
[V,Av] = eig(Matrix);
Av = round(diag(Av));
km = length(find(Matrix));
p = km/(N*(N));
counter = 0;
ro = [];
for land = -max(abs(Av)):max(abs(Av))
    counter = counter + 1;
    ro(counter) = length(find(land == Av))/N;
end
rof = ro*((N*p*(1-p))^.5);
landf = [-max(abs(Av)):max(abs(Av))]/((N*p*(1-p))^.5);
%     rof = interp(rof,5);
%     landf = interp(landf,5);
rof = smooth(rof)'; %%%
%A=horzcat(A,landf',rof);
%plot(landf,rof,'color',color1);
%if i==1, title('Spectral Density, Red: Data, Blue: Random'); grid on; hold on; end

