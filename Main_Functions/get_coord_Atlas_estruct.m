V = spm_vol('G:\Toolboxes\IBASPM_13Nov2008\Ibaspm_1.0\atlas116.img');
I = spm_read_vols(V);
[Nx,Ny,Nz] = size(I);

ind = unique(I(:));

ind = ind(ind>0);

NStruct = length(ind);
x = zeros(NStruct,1);
y = zeros(NStruct,1);
z = zeros(NStruct,1);
for i=1:NStruct
    disp(i);
    indS = find(I(:)==ind(i));
    [xt,yt,zt] = ind2sub([Nx,Ny,Nz],indS);
    x(i) = mean(xt);
    y(i) = mean(yt);
    z(i) = mean(zt);
end;

d = sqrt(x.^2 + y.^2 +z.^2);
x = x/max(d);
y = y/max(d);
z = z/max(d);


plot3(x(1:2:end),y(1:2:end),z(1:2:end),'*');
hold on;
plot3(x(2:2:end),y(2:2:end),z(2:2:end),'r*');