function Y = readVolsCIVET(AtlasesFiles,StructureCodesFile)

% This function read *.dat Volume files coming from CIVET.
%
% Input Parameters:
%       AtlasesFiles : Atlases Files.
%       IndexStructureFile : File with the structures indexes to be
%       selected.
% Output Parameters:
%    Y : Matrix of Number of files by Number of Structures (NFiles x NStruct)
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, October 23rd, 2008


NFiles = size(AtlasesFiles,1);

Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);

Y = zeros(NFiles,NStruct);
H = waitbar(0,'Reading Files','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
StringNFiles = num2str(NFiles);
for i=1:NFiles
    waitbar(i/NFiles,H, ['Reading Files  ' num2str(i) ' of ' StringNFiles]);
    Vols = load(deblank(AtlasesFiles(i,:)));
    for j=1:NStruct
        ind = find(Vols(:,1)==Structures(j).Code);
        if  ~isempty(ind)
            Y(i,j) = Vols(ind,2);
        end;
    end;
end;

close(H);

return;