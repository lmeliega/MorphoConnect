function Y = make_GLM(InputDataFile,GenderList,AgeList,GlobalVarFile)

% Lester Melie Garcia
% Cuban Neuroscience Center
% May 6th, 2009

[FilePath,FileName,FileExt] = fileparts(InputDataFile);
Y = load(deblank(InputDataFile));
if strcmpi(FileExt,'.mat')
    if isfield(Y,'V')
        Y = Y.V;
    else
        Y = Y.Y;
    end;
end;

gender = textread(GenderList,'%s');
Gender = term(gender);

age = importdata(AgeList);
Age = term(age);

global_effect_Var = load(deblank(GlobalVarFile));
GlobalEffect = term(global_effect_Var);

slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + GlobalEffect);
Y_hat = slm.X*slm.coef;

Y = Y - Y_hat;

return;