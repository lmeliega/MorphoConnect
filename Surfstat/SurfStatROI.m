function maskROI = SurfStatROI( centre, radius, surf );

%ROI on the surface with a given centre and radius.
%
% Usage: ROImask = SurfStatROI( centre, radius, surf );
% 
% centre     = id number of vertex, or 
%              3 x 1 vector of [x; y; z] coordinates in mm.
% radius     = radius, mm.
% surf.coord = 3 x v matrix of coordinates of surface.
%
% maskROI = 1 x v vector, 1=inside ROI, 0=outside.

if length(centre)==1
    id=centre;
    centre=surf.coord(:,id);
end
d2=sum((centre*ones(1,size(surf.coord,2))-surf.coord).^2);
maskROI=d2<radius^2;
return
end
    