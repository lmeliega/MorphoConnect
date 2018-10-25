function [ surf, ab ] = SurfStatReadSurf( filenames, ab, numfields );

%Reads coordinates and triangles from an array of .obj or FreeSurfer files. 
%
% Usage: [ surf, ab ] = SurfStatReadSurf( filenames [,ab [,numfields ]] );
% 
% filenames = .obj or FS file name (n=1) or n x k cell array of file names.
% ab        = 'a' for ASCII or 'b' for binary. If it doesn't work it 
%             will try the other. Default is 'a'.
% numfields = number of fields to read, in the order below, default 2.
%
% surf.coord = 3 x v matrix of coordinates, v=#vertices, if n=1, or
%              n x v x 3 array if n>1.
% surf.tri   = 3 x t matrix of triangle indices, 1-based, t=#triangles.
% ab         = whichever was successful.
% The coordinates and triangle indices of the k files are concatenated. 
% If n=1, surf.coord is double precision; 
% if n>1, surf.coord is single precision.

if nargin<2
    ab='a';
end
if nargin<3
    numfields=2;
end
numfields1=(numfields-1)*3+1;

if isstr(filenames)
    sf=filenames;
    filenames=cell(1,1);
    filenames(1)={sf};
end

[n,k]=size(filenames);
if n>1
    fprintf(1,'%s',[num2str(n) ' x ' num2str(k) ' files to read, % remaining: 100 ']);
end
c=[];
sizecoord=zeros(1,k);
if numfields==2
    surf.tri=[];
end
for j=1:k
    [s,ab]=SurfStatReadSurf1(filenames{1,j},ab,numfields1);
    if numfields==2
        surf.tri=[surf.tri s.tri+size(c,2)];
    end
    c=[c s.coord];
    sizecoord(j)=size(s.coord,2);
end

if n==1
    surf.coord=c;
else
    n10=floor(n/10);
    surf.coord=zeros(n,size(c,2),3,'single');
    surf.coord(1,:,:)=single(c)';
    v2=cumsum(sizecoord);
    v1=v2-sizecoord+1;
    for i=2:n
        if rem(i,n10)==0 
            fprintf(1,'%s',[num2str(round(100*(1-i/n))) ' ']);
        end
        for j=1:k
            [s,ab]=SurfStatReadSurf1(filenames{i,j},ab,1);
            surf.coord(i,v1(j):v2(j),:)=single(s.coord)';
        end
    end
    fprintf(1,'%s\n','Done');
end
 
return
end

