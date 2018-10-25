function resels = SurfStatResels( slm, mask );

%Resels of surface data inside a mask.
%
% Usage: resels = SurfStatResels( slm [, mask] )
%
% slm.reselsptri  = 1 x t vector of resels per triangle, t=#triangles.
% slm.reselspedge = 3 x t matrix of resels per edge.
% slm.tri         = 3 x t matrix of triangle indices, 1-based.
% mask            = 1 x v, 1=inside, 0=outside, v=#vertices, 
%                 = ones(1,v), i.e. the whole surface, by default.
%
% resels          = 1 x 3 vector or 0,1,2D resels, =EC if slm.reselsptri 
%                   and slm.reselspedge are not given.

if nargin<2
    v=max(slm.tri(:));
    mask=zeros(1,v);
    mask(slm.tri)=1;
end

m1=mask(slm.tri(1,:));
m2=mask(slm.tri(2,:));
m3=mask(slm.tri(3,:));
m12=m1 & m2;
m23=m2 & m3;
m13=m1 & m3;
m123=m1 & m2 & m3;
edge1=[slm.tri(1,m12) slm.tri(2,m23) slm.tri(3,m13)];
edge2=[slm.tri(2,m12) slm.tri(3,m23) slm.tri(1,m13)];
[u,i]=unique([min(edge1,edge2); max(edge1,edge2)]','rows');

resels(1)=sum(mask)-length(i)+sum(m123);
if isfield(slm,'reselspedge')
    re=[slm.reselspedge(1,m12) slm.reselspedge(2,m23) slm.reselspedge(3,m13)];
    resels(2)=sum(re(i))-sum(slm.reselspedge*m123')/2;
end
if isfield(slm,'reselsptri')
    resels(3)=sum(m123.*slm.reselsptri);
end

return
end