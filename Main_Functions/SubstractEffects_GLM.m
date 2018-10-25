function [Y,GLMModel] = SubstractEffects_GLM(Y,glm_Model,IsMeanEffectIncluded, Age, Gender, GrayMatVolume, OtherVars)

% This function subtracts the effects of gender, age,interaction
% age-gender and global effects using a GLM model.
%
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, November 12th, 2008
% Modified : February 27th, 2010

if max(size(OtherVars))==1
    ExistOtherVars = 0;
else
    ExistOtherVars = 1;
end;

switch glm_Model
    case 1  % Model : 1 + Age + Gender + Age*Gender
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + GrayMatVolume + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + GlobalEffect + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + GrayMatVolume);
                GLMModel = '1 + Age + Gender + Age*Gender + GlobalEffect';                
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender + Age*Gender);
                GLMModel = '1 + Age + Gender + Age*Gender';                
            end;
        end;
    case 2  % Model : 1 + Age + Gender
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Gender + GrayMatVolume + OtherVars);
                GLMModel = '1 + Age + Gender + GlobalEffect + OtherVars';                
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender + GrayMatVolume);
                GLMModel = '1 + Age + Gender + GlobalEffect';                
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Gender + OtherVars);
                GLMModel = '1 + Age + Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Gender);
                GLMModel = '1 + Age + Gender';               
            end;
        end;
    case 3  % Model : 1 + Age
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + GrayMatVolume + OtherVars);
                GLMModel = '1 + Age + GlobalEffect + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + GrayMatVolume);
                GLMModel = '1 + Age + GlobalEffect';                
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + OtherVars);
                GLMModel = '1 + Age + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + OtherVars);
                GLMModel = '1 + Age';              
            end;
        end;
    case 4  % Model : 1 + Gender        
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Gender  + GrayMatVolume + OtherVars);
                GLMModel = '1 + Gender + GlobalEffect + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Gender  + GrayMatVolume + OtherVars);
                GLMModel = '1 + Gender + GlobalEffect';               
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Gender + OtherVars);
                GLMModel = '1 + Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Gender + OtherVars);
                GLMModel = '1 + Gender';              
            end;
        end;
    case 5
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + GrayMatVolume + OtherVars);
                GLMModel = '1 + GlobalEffect + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + GrayMatVolume);
                GLMModel = '1 + GlobalEffect';              
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + OtherVars);
                GLMModel = '1 + OtherVars';
            else
                GLMModel = 'None';
            end;            
        end;
    case 6  % Model : 1 + Age + Age^2 + Gender + Age*Gender
        if IsMeanEffectIncluded
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Age^2 + Gender + Age*Gender + GrayMatVolume + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + GlobalEffect + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Age^2 + Gender + Age*Gender + GrayMatVolume);
                GLMModel = '1 + Age + Gender + Age*Gender + GlobalEffect';
            end;
        else
            if ExistOtherVars
                slm = SurfStatLinMod(Y, 1 + Age + Age^2 + Gender + Age*Gender + OtherVars);
                GLMModel = '1 + Age + Gender + Age*Gender + OtherVars';
            else
                slm = SurfStatLinMod(Y, 1 + Age + Age^2 + Gender + Age*Gender);
                GLMModel = '1 + Age + Age^2 + Gender + Age*Gender';
            end;
        end;
end;
if glm_Model~=5
    Y_hat = slm.X*slm.coef;
    Ym = Y - slm.X(:,2:end)*slm.coef(2:end,:); % Leaving the constant term in the reconstructed Y.
    Y = Y - Y_hat;    
else
    if IsMeanEffectIncluded||ExistOtherVars
        Y_hat = slm.X*slm.coef;
        Y = Y - Y_hat;
    end;
end;

return;