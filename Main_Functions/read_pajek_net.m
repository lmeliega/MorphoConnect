function  Modules = read_pajek_net(InPajekFile)

% This read Pajek format coming from OSLOM community detection program outputs
%
%% Lester Melie-Garcia
%  LREN, CHUV, Lausanne December 12th 2017

fid = fopen(InPajekFile,'r');

VerticesLabel = '*Vertices';
%EdgesLabel = '*Edges';

tline = fgetl(fid);
inds = strfind(tline,VerticesLabel);
Nnodes = str2double(tline(inds+length(VerticesLabel)+1:end));

Modules = cell(Nnodes,2);
icolorLabel = 'ic';
for i=1:Nnodes
    tline = fgetl(fid);
    inds = strfind(tline,'"');
    Modules{i,1} = str2double(tline(inds(1)+1:inds(2)-1));
    Modules{i,2} = regexprep(tline(strfind(tline,icolorLabel)+length(icolorLabel)+1:end),' ','');
end;

fclose(fid);

end