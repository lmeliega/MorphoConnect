function ConnectMatrix = Modules_Interconnectivity(ConMatFile,StructureCodesFile,OutputFileName)

%% Lester Melie Garcia
% LREN, Lausanne
% March 24th, 2016

if ischar(ConMatFile)
    ConMat = load(ConMatFile);
    if isfield(ConMat,'ConnectMatrix');
        if isfield(ConMat.ConnectMatrix,'ConMatboot')
            ConMat = ConMat.ConnectMatrix.ConMatboot;
        else
            ConMat = ConMat.ConnectMatrix.ConMat;
        end;
    end;
else
    if isstruct(ConMatFile)
        if isfield(ConMatFile,'ConnectMatrix');
            if isfield(ConMatFile.ConnectMatrix,'ConMatboot')
                ConMat = ConMatFile.ConnectMatrix.ConMatboot;
            else
                ConMat = ConMatFile.ConnectMatrix.ConMat;
            end;
        end;
    else
        ConMat = ConMatFile;
    end;
end;

[~,Structures] = ReadCodeFile(StructureCodesFile);
Struct_Labels = Structures(:,1);
Module_Labels = unique(Struct_Labels);
Nm = length(Module_Labels);
ind_modules = cell(Nm,1);
for i=1:Nm
    ind_modules{i} = find(ismember(Struct_Labels,Module_Labels(i)));
end;
Nrep = size(ConMat,3);
ConMat_Modules = zeros(Nm,Nm,Nrep);
ConMat_Modules_homog = zeros(Nm,Nrep); % Connectivity between homologous regions intra-module.
for i=1:Nm
    Ni = length(ind_modules{i}); Ni2 = Ni/2;
    for j=i:Nm
        Nj = length(ind_modules{j});
        Cij_orig = abs(ConMat(ind_modules{i},ind_modules{j},:));
        Cij = sum(Cij_orig,1);Cij = squeeze(sum(Cij,2));Cij = Cij(:);
        if i==j            
            K = Ni*(Ni-1);
            indsi=Ni2+1:Ni; indsj=1:Ni2;
            for k=1:Nrep
                ConMat_Modules_homog(i,k) = mean(diag(Cij_orig(indsi,indsj,k)));
            end;
        else
            K = Ni*Nj;
        end;
        ConMat_Modules(i,j,:) = Cij/K;
        ConMat_Modules(j,i,:) = Cij/K;
    end;
end;

Structures = MakeStructCode(Module_Labels);
ConnectMatrix.ConMat = ConMat_Modules;
ConnectMatrix.ConMat_Homologous = ConMat_Modules_homog;
ConnectMatrix.Structures = Structures;

if exist('OutputFileName','var')
    save(OutputFileName,'-mat','ConnectMatrix');
end;

end

%% =============== Internal Functions =============== %%
function Structures = MakeStructCode(Module_Labels)

Nm = length(Module_Labels);

for i=1:Nm
    Structures(i).Name = Module_Labels{i}; %#ok
    Structures(i).Code = i; %#ok
end;

end

