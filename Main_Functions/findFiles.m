function OutputFiles = findFiles(IDsFile,FullListFiles)

% This function find files in a big of List of Files.
%
% Input Parameters
%    IDs : Identifiers of the Files to be found
%   FullListFiles: Full List of Files.
%
% Output Parameters
%   OutputFiles: The list of files found in 'FullListFiles' with
%                identifiers 'IDs'.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, October 20th, 2008.
% Modified, Lausanne March 15th 2017

fid = fopen(IDsFile);
OutNFiles = 0;
IDs{1} = '';
while 1
    OutNFiles = OutNFiles + 1;
    line = fgetl(fid);    
    if ~ischar(line),   break,   end
    IDs{OutNFiles} = line;  %#ok
end
fclose(fid);

NFiles = size(FullListFiles,1);
Files = 0;
c = 0;
for j=1:OutNFiles-1
    for i=1:NFiles
        SubjPath=deblank(FullListFiles(i,:));
        if strcmp(SubjPath(end),filesep)
            SubjPath=deblank(SubjPath(1:end-1));
        end;
        ind = strfind(deblank(SubjPath),IDs{j});
        if ~isempty(ind)&&(strcmpi(SubjPath(ind:end),IDs{j}))
            c = c + 1;
            Files(c) = i;
        end;
    end;
end;
OutputFiles = FullListFiles(Files,:);

return;