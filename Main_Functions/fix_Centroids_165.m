C = load('E:\WORK\Connectivity\Atlases\Codigos_ATLAS_ordenados\Centroids_aparc.a2009s_cortex_ordenado_165_inverted.txt');

ind = [1,6,10];
C(ind,:) = [];

Structures = ReadCodeFile('E:\WORK\Connectivity\Atlases\Codigos_ATLAS_ordenados\aparc.a2009s_cortex_ordenado_165_siglas_names_inverted.cod');
Structures(ind) = [];
r = 0; l = 0;
for i=1:length(Structures)
    if findstr(Structures(i).Name,'R.')
        r = r + 1;
        indr(r) = i; %#ok
    else
        l = l + 1;
        indl(l) = i; %#ok        
    end;    
end;
C = [C(indr,:);C(indl,:)];

OutputFile = 'E:\WORK\Connectivity\Atlases\Codigos_ATLAS_ordenados\Centroids_aparc.a2009s_cortex_nuclei_ordenado.txt';
fid = fopen(OutputFile,'wt');
N = size(C,1);
Text2File = cell(N,1);
for i=1:N
    Text2File{i}=[num2str(C(i,1)),' ',num2str(C(i,2)),' ',num2str(C(i,3))];
end;
for i=1:N
    fprintf(fid,'%s  \r',Text2File{i});
end;
fclose(fid);