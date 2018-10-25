function surf = SurfStatAv( filenames );

%Averages surfaces.
%
% Usage: surf = SurfStatAv( filenames );
%
% filenames   = n x k cell array of names of .obj files.
%
% surf.coord  = 3 x v matrix of average coordinates, v=#vertices.
% surf.tri    = 3 x t matrix of triangle indices, 1-based, t=#triangles.
% The coordinates and triangle indices of the k files are concatenated. 

[n,k]=size(filenames);
fprintf(1,'%s',[num2str(n) ' x ' num2str(k) ' files to read, % remaining: 100 ']);
n10=floor(n/10);
ab='a';
for i=1:n
    if rem(i,n10)==0
        fprintf(1,'%s',[num2str(round(100*(1-i/n))) ' ']);
    end
    if i==1
        [s,ab]=SurfStatReadSurf(filenames(i,:),ab,2);
        surf.tri=s.tri;
        surf.coord=double(s.coord);        
% passing ab speeds up reading if the next file has the same format. 
    else
        [s,ab]=SurfStatReadSurf(filenames(i,:),ab,1);
        surf.coord=surf.coord+double(s.coord);
    end
end
surf.coord=surf.coord/n;
fprintf(1,'%s\n','Done');  

return
end
