function [Mcover,ModulesInfo,ModuleIDs] = get_OSLOM_modules(OSLOM_tpFile)

%% Input Parameters
%   OSLOM_tpFile : Output file of OSLOM program
%
%% Output Parameters
%  Mcover : Binary matrix of Number of nodes x Number of modules. Mij = 1 means that node j belongs to module j.
%  ModulesInfo : Cell array variable with the information of modules.
% ModuleIDs : IDs of different modules.
%
%% Lester Melie-Garcia
% LREN, CHUV 
% Lausanne, October 17th 2017


fid = fopen(OSLOM_tpFile,'r');

SizeLabel = 'size:';
pvalueLabel = 'bs:';
ModuleLabel = '#module';
c = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    inds_Module = strfind(tline,ModuleLabel);
    if ~isempty(inds_Module)
        c = c + 1;
        inds_Size = strfind(tline,SizeLabel);
        inds_pvalue = strfind(tline,pvalueLabel);
        Mod_number = str2num(tline(inds_Module+length(ModuleLabel)+1:inds_Size-1)); 
        Mod_Size = str2num(tline(inds_Size+length(SizeLabel)+1:inds_pvalue-1));
        pvalue = str2num(tline(inds_pvalue+length(pvalueLabel)+1:end));
        Module_Nodes = str2num(fgetl(fid)); Module_Nodes = Module_Nodes';
        ModulesInfo{c,1} = Mod_number+1; ModulesInfo{c,2} = Mod_Size;
        ModulesInfo{c,3} = pvalue; 
        ModulesInfo{c,4} = Module_Nodes;
    end;
end
fclose(fid);

X = ModulesInfo(:,4);
X1 = cell2mat(X);

s = unique(X1);
Nnodes = max(s);
Nmodules = size(ModulesInfo,1);

Mcover = zeros(Nnodes,Nmodules);
for i=1:Nmodules
    k = ModulesInfo{i,4};
    Mcover(k,i) = 1;
    ModuleIDs(k) = ModulesInfo{i,1};
end;

Nm  = size(Mcover,2) - sum(cell2mat(ModulesInfo(:,2))==1);
ModuleIDs = zeros(Nnodes,1);
for i=1:Nm
    k = ModulesInfo{i,4};
    ModuleIDs(k) = ModulesInfo{i,1};
end;
if ismember(0,ModuleIDs)
    ModuleIDs = ModuleIDs + 1;
end;

Singletons_inds = cell2mat(ModulesInfo(Nm:end,4));
ModuleIDs(Singletons_inds) = ModulesInfo{Nm,1} + 1;

CellHeader = {'Module Number','Number of nodes','p-value','Module Nodes'};
ModulesInfo = [CellHeader;ModulesInfo];

end