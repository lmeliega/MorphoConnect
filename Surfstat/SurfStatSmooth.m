function Y = SurfStatSmooth( Y, surf, FWHM );

%Smooths surface data by repeatedly averaging over triangles.
%
% Usage: Y = SurfStatSmooth( Y, surf, FWHM );
% 
% Y         = n x v or n x v x k matrix of surface data, v=#vertices;
%             n=#observations; k=#variates.
% surf.tri  = 3 x t matrix of triangle indices, 1-based, t=#triangles.
% FWHM      = approximate FWHM of Gaussian smoothing filter, in mesh units.
%
% One iteration is a filter with a weight of 1/9 at each of the 6
% neighbours of a vertex, and a weight of 1/3 at the vertex itself. This is
% a filter with expected squared distance = 2/3, so variance = 1/3, FWHM =
% sqrt(8*log(2)/3). n repetions increases this by sqrt(n), so to achieve
% FWHM, the number of iterations is FWHM^2*3/(8*log(2)).

niter=ceil(FWHM^2*3/(8*log(2)));

if ndims(Y)==2
    [n,v]=size(Y);
    k=1;
else
    [n,v,k]=size(Y);
end

Y1=zeros(1,v,'single');
for j=1:3
    Y1=Y1+accumarray(surf.tri(j,:)',3,[v 1])';
end

if n>1
    fprintf(1,'%s',[num2str(n) ' x ' num2str(k) ' surfaces to smooth, % remaining: 100 ']);
end
n10=floor(n/10);
for i=1:n
    if rem(i,n10)==0
        fprintf(1,'%s',[num2str(100-i/n10*10) ' ']);
    end
    for j=1:k
        for iter=1:niter
            Ytri=Y(i,surf.tri(1,:),j) + ...
                 Y(i,surf.tri(2,:),j) + ...
                 Y(i,surf.tri(3,:),j);
            Y(i,:,j)=(accumarray(surf.tri(1,:)',Ytri',[v 1]) + ...
                      accumarray(surf.tri(2,:)',Ytri',[v 1]) + ...
                      accumarray(surf.tri(3,:)',Ytri',[v 1]))'./Y1;
        end
    end
end
if n>1
    fprintf(1,'%s\n','Done');
end
