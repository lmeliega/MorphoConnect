function [indF,FullIDs] = findIDsFiles(IDsFile,FullListFile)

% This function finds indexes of the files containing IDs in a big of List of IDs.
%
% Input Parameters
%    IDs : Identifiers of the Files to be found
%   FullListFiles: Full List of Files.
%
% Output Parameters
%   FullIDs: The list of files found in 'FullListFiles' with
%            identifiers 'IDs'.
%   indF : Index of found Files referenced to FullList 
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 18th, 2008.

if ~iscell(IDsFile)
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
else
    IDs = IDsFile;
end;

if ~iscell(FullListFile)
    fid = fopen(FullListFile);
    OutNFiles = 0;
    FullIDs{1} = '';
    while 1
        OutNFiles = OutNFiles + 1;
        line = fgetl(fid);
        if ~ischar(line),   break,   end
        FullIDs{OutNFiles} = line;  %#ok
    end
    fclose(fid);
else
    FullIDs = FullListFile;
end;

NFullIDs = length(FullIDs);
NIDs = length(IDs);
indF = 0;
c = 0;
for j=1:NIDs
    g = 0;
    for i=1:NFullIDs
        ind = strfind(deblank(FullIDs{i}),deblank(IDs{j}));    
        if ~isempty(ind)
            c = c + 1;
            indF(c) = i;
            g = 1;
        end;
    end;
    if g==0
        keyboard;
    end;
end;
indF = indF(:);
FullIDs = FullIDs{indF}; %#ok

return;