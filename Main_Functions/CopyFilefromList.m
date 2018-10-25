function CopyFilefromList(SubjectsList,InputDirectory,OutputDirectory)

% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, October 20th, 2008

fid = fopen(SubjectsList);
OutNFiles = 0;
IDs{1} = '';
while 1
    OutNFiles = OutNFiles + 1;
    line = fgetl(fid);    
    if ~ischar(line),   break,   end
    IDs{OutNFiles} = line;  %#ok
end
fclose(fid);

H = waitbar(0,'Copying Files','Resize','on','Position',[233.25 237.75 273 50.25],'Resize','off');
NFiles = length(IDs);
StringNFiles = num2str(NFiles);
for i=1:NFiles
    waitbar(i/NFiles,H, ['Copying Files  ' num2str(i) ' of ' StringNFiles]);
    %disp(['File --->   ' num2str(i)]);
    FoundFiles = pickfiles(InputDirectory,IDs{i});
    if ~isempty(FoundFiles)
        for j=1:size(FoundFiles,1)
           copyfile(FoundFiles(j,:),OutputDirectory,'f');
        end;
    end;
end;
close(H);
return;