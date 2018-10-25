function make_BrainNet_node_file(CentroidsFile,StructuresCodeFile,NodeOutputFileName,inds)

%% Lester Melie Garcia
% Lausanne, September 5th 2016

C = load(CentroidsFile);
Structures = readCodeFile(StructuresCodeFile);

N = length(inds);
CC = ones(N,1);
SS = 2*ones(N,1);

fid = fopen(NodeOutputFileName,'wt');
Text2File = cell(N,1);
for i=1:N
    Text = Structures(inds(i)).Name;
    Text2File{i}=[num2str(C(inds(i),1)),' ',num2str(C(inds(i),2)),' ',num2str(C(inds(i),3)),' ',num2str(CC(i)),' ',num2str(SS(i)),' ',Text];
end;

for i=1:N
    fprintf(fid,'%s  \r',Text2File{i});
end;

fclose(fid);

end