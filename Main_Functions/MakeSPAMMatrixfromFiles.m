function [SPAMs,MaxPro] = MakeSPAMMatrixfromFiles(SPAMList,StructureCodesFile)

% This function get the SPAM Information contained in SPAMList Files 
%
% Input Parameters:
%        SPAMList : List of SPAMs Files.
%  StructureCodesFile : File with structure codes and names. (*.cod)
%
% Output Parameters:
%     SPAMs : SPAMs for the structures defined in the Code File. 
%     MaxPro : Maximum Probability map
%  
% Lester Melie-Garcia
% Cuban Neuroscience Center
% November 22nd, 2008

if isempty(StructureCodesFile)
    dir = cd;
    StructureCodesFile = spm_select(1,'cod','Loading Structure Code File ...','',dir);
end;

X = load(deblank(SPAMList(1,:)));
Np = length(X); 
Structures = ReadCodeFile(StructureCodesFile);
NStruct = length(Structures);
Codes = getCodes(SPAMList);
Codestrue = zeros(NStruct,1);
SPAMs = zeros(Np,NStruct);
for i=1:NStruct
    Codestrue(i) = Structures(i).Code;
    ind = Codes==Structures(i).Code;
    X = load(deblank(SPAMList(ind,:)));
    X = X(:);
    SPAMs(:,i) = X;    
end;
[Pmax,ind] = max(SPAMs,[],2); 
MaxPro = Codestrue(ind);  % MaxPro Map

return;

%  ------- Internal Functions ------  % 
function Codes = getCodes(SPAMList)

NSPAMs = size(SPAMList);
Codes = zeros(NSPAMs,1);
for i=1:NSPAMs
    [PathName,StructFileName] = fileparts(SPAMList(i,:));
    ind = findstr(StructFileName,'_');
    ind = min(ind);
    Codes(i)= str2double(StructFileName(1:ind-1));
end;

return;