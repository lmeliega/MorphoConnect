function Y = SurfStatReadData( filenames )

%Reads data (e.g. thickness) from an array of .txt or FreeSurfer files. 
%
% Usage: Y = SurfStatReadData( filenames );
%
% filenames = .txt or FS file name (n=1) or n x k cell array of file names.
%
% Y = n x v matrix of data, v=#vertices; the k rows are concatenated.
% If n=1, Y is double precision; 
% if n>1, Y is single precision.

if isstr(filenames)
    sf=filenames;
    filenames=cell(1,1);
    filenames(1)={sf};
end

[n,k]=size(filenames);
if n>1
    fprintf(1,'%s',[num2str(n) ' x ' num2str(k) ' files to read, % remaining: 100 ']);
end
Y1=[];
v=zeros(1,k);
for j=1:k
    Y11=SurfStatReadData1(filenames{1,j});
    Y1=[Y1 Y11];
    v(j)=size(Y11,2);
end

if n==1
    Y=Y1;
else
    n10=floor(n/10);
    Y=zeros(n,size(Y1,2),'single');
    Y(1,:)=single(Y1);
    v2=cumsum(v);
    v1=v2-v+1;
    for i=2:n
        if rem(i,n10)==0 
            fprintf(1,'%s',[num2str(round(100*(1-i/n))) ' ']);
        end
        for j=1:k
            Y1=SurfStatReadData1(filenames{i,j});
            Y(i,v1(j):v2(j))=single(Y1);
        end
    end
    fprintf(1,'%s\n','Done');
end
    
return
end


