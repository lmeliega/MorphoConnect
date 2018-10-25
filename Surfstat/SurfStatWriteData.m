function SurfStatWriteData( filename, Y, ab )

%Writes data (e.g. thickness) to a single .txt or FreeSurfer file. 
%
% Usage: SurfStatWriteData( filename, Y [, ab] );
%
% filename = .txt or FS file name, either new version binary or ASCII. 
% ab       = 'a' for ASCII or 'b' for binary. 
%
% Y = k x v matrix of data, v=#vertices.

[k,v]=size(Y);
[pathstr,name,ext] = fileparts(filename);
if strcmp(ext,'.txt')
    % It's a .txt file
    format=[repmat('%f ',1,k) '\n'];
    fid=fopen(file,'w');
    fprintf(fid,format,Y);
else
    % Assume it's a FreeSurfer file
    if nargin<3 | ab(1)=='b'
        fid = fopen(filename, 'wb', 'b') ;
        magic = 16777215;
        b1 = bitand(bitshift(magic, -16), 255) ;
        b2 = bitand(bitshift(magic, -8), 255) ;
        b3 = bitand(magic, 255) ;
        fwrite(fid, [b1 b2 b3], 'uchar') ;
        fwrite(fid, [v 0 k], 'int32') ;
        fwrite(fid, Y, 'float') ;
    else
        fid = fopen(filename, 'w') ;
        fprintf(fid, '%d\n', v) ;
        Y=[zeros(4,v); Y];
        format=[repmat('%f ',1,4+k) '\n'];
		fprintf(fid, format, Y) ;
    end
end
fclose(fid) ;
    
return
end