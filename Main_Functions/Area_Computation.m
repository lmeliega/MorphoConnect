function Area = Area_Computation(NetProps,isMean,ind2trunc)

% Lester Melie-Garcia

if exist('ind2trunc','var')
    if isempty(ind2trunc)
        ind2trunc = length(NetProps.ThresBins);
    end;
else
    ind2trunc = length(NetProps.ThresBins);
end;
isBinaryGraph = NetProps.isBinaryGraph;
%% -------- Cluster index --------- %%
if isfield(NetProps,'Clux')
    disp('Computing for Cluster Index ...');
    Clux = NetProps.Clux;
    if isBinaryGraph
        Clux = Clux(:,1:ind2trunc);
        Area.Clux = trapz(Clux,2);
    else
        Area.Clux = Clux;
    end;
    if isMean
        Area.Clux = mean(Area.Clux,1);
    end;    
end;
%% -------- Characteristic Path length  --------- %%
if isfield(NetProps,'CharPathL')
    disp('Computing for Characteristic Path Length ...');
    CharPathL = NetProps.CharPathL;
    if isBinaryGraph
        CharPathL = CharPathL(:,1:ind2trunc);
        Area.CharPathL = trapz(CharPathL,2);
    else
        Area.CharPathL = CharPathL;
    end;
    if isMean
        Area.CharPathL = mean(Area.CharPathL,1);
    end;      
end;
%% -------- Efficiency  --------- %%
if isfield(NetProps,'Efficiency')
    disp('Computing for Global and Local Efficiency ...');
    Efficiency = NetProps.Efficiency;
    if isBinaryGraph
        Eloc  = squeeze(Efficiency(1,:,:));
        Eglob = squeeze(Efficiency(2,:,:));
        if min(size(Eloc))==1
            Eloc=Eloc';
            Eglob=Eglob';
        end;
        Eloc  = Eloc(:,1:ind2trunc);
        Eglob  = Eglob(:,1:ind2trunc);
        Area.Local_Efficiency = trapz(Eloc,2);
        Area.Global_Efficiency = trapz(Eglob,2);
    else
        Area.Local_Efficiency  = Efficiency(1);
        Area.Global_Efficiency  = Efficiency(2);
    end;
    if isMean
        Area.Local_Efficiency = mean(Area.Local_Efficiency,1);
        Area.Global_Efficiency = mean(Area.Global_Efficiency,1);
    end;     
end;
%% -------- Global Connectivity  --------- %%
if isfield(NetProps,'NodeConnection')
    disp('Computing for Node Connection ...');
    NodeConnection = NetProps.NodeConnection;
    if isMean
        Area.GlobalConnectivity = mean(NodeConnection(:));
    else
        Area.GlobalConnectivity = mean(NodeConnection,1)';
    end;    
end;
%% -------- Target Attack Connectivity  --------- %%
if isfield(NetProps,'TargetAttack')
    disp('Computing for Target Attack analysis ...');
    if isfield(NetProps,'TargetAttackthresbins')
        t = NetProps.TargetAttackthresbins;
    else
        t = 1:size(NetProps.TargetAttack,1); t = t/100;
    end;
    t = t(:);
    TA = squeeze(trapz(t,NetProps.TargetAttack,1));    
    if isBinaryGraph
        TA = trapz(TA(:,1:ind2trunc),2);
    end;
    Area.TargetAttack = TA;
    if isMean
        Area.TargetAttack = mean(TA);
    end;
end;
%% -------- Small World Parameter  --------- %%
if isfield(NetProps,'SmallWorld')
    disp('Computing for Small World Parameter (Sigma) ...');
    SmallWorldPar = NetProps.SmallWorld;
    if isBinaryGraph
        SigmaR  = squeeze(SmallWorldPar(3,:,1:ind2trunc));
        Area.SmallWorld_Sigma = trapz(SigmaR,2);
    else
        Area.SmallWorld_Sigma  = SmallWorldPar(1);
    end;
    if isMean
        Area.SmallWorld_Sigma = mean(Area.SmallWorld_Sigma,1);
    end;     
end;
%% -------- Modularity --------- %%
if isfield(NetProps,'Modularity')
    disp('Computing for Modularity Index ...');
    Modularity = NetProps.Modularity;
    if isBinaryGraph
        Modularity = Modularity(:,1:ind2trunc);
        Area.Modularity = trapz(Modularity,2);
    else
        Area.Modularity = Modularity;
    end;
    if isMean
        Area.Modularity = mean(Area.Modularity,1);
    end;    
end;
%% -------- Mean Number of Modules --------- %%
if isfield(NetProps,'ModulesNumber')
    disp('Computing for Number of Modules ...');
    ModulesNumber = NetProps.ModulesNumber;
    if isBinaryGraph
        ModulesNumber = ModulesNumber(:,1:ind2trunc);
        Area.ModulesNumber = mean(ModulesNumber,2);
    else
        Area.ModulesNumber = ModulesNumber;
    end;
    if isMean
        Area.ModulesNumber = mean(Area.Modularity(:));
    end;    
end;
%% -------- Connection between homologous structures -------- %%
if isfield(NetProps,'HomologousStructConnection')
    disp('Computing for Connection between Homologous structures ...');
    if isMean
        Area.HomologousStructConnection = NetProps.HomologousStructConnection;
    else
        Area.HomologousStructConnection = NetProps.HomologousStructConnection;
    end;    
end;

return;