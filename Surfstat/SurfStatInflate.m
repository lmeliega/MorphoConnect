function surfw = SurfStatInflate( surf, w, spherefile );

%Inflates a surface towards two fitted hemi-ellipsoids.
%
% Usage: surfw = SurfStatInflate( surf [, w [, spherefile ]] );
%
% surf.coord  = 3 x v matrix of coordinates, v=#vertices.
% w           = weight in [0,1] given to hemi-ellipsoids, default 0.5.
% spherefile  = file name of a sphere surface for the left hemisphere. It 
%               assumes that the triangulation of the right hemisphere is a
%               mirror image. The default is sphere.obj for a 40962 vertex
%               (v=81924 for both hemispheres) icosahedral mesh.
%
% surfw.coord = 3 x v matrix of inflated coordinates.

if nargin<2
    w=0.5;
end
if nargin<3
    spherefile='sphere.obj';
end
sphere=SurfStatReadSurf(spherefile);
sphere.tri=[sphere.tri sphere.tri+size(sphere.coord,2)];
sphere.coord=[sphere.coord(1,:).*(sphere.coord(1,:)<0) ...
    -sphere.coord(1,:).*(sphere.coord(1,:)<0); 
     sphere.coord(2:3,:) sphere.coord(2:3,:)];
maxs=max(surf.coord,[],2);
mins=min(surf.coord,[],2);
surfw=surf;
for i=1:3
    surfw.coord(i,:)=((sphere.coord(i,:)+1)/2*(maxs(i)-mins(i))+...
        mins(i))*w+surf.coord(i,:)*(1-w);
end

return
end

