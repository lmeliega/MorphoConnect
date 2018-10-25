function d = distanceDist(X,Y)

% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, October 4th, 2010

Nx = size(X,1); % Number of observations.
Ny = size(Y,1); % Number of observations.

% For X variable
Dx = pdist(X,'euclidean');
Dx = Dx.^2;
Dx = 2*sum(Dx)/(Nx*Nx);

Dy = pdist(Y,'euclidean');
Dy = Dy.^2;
Dy = 2*sum(Dy)/(Ny*Ny);

[Xm,Ym] = meshgrid(X,Y);
Dxy = sum((Xm(:)-Ym(:)).^2)/(Nx*Ny); 

c = (Nx*Ny)/(Nx+Ny);
d = c*(2*Dxy-Dx-Dy);

return;


