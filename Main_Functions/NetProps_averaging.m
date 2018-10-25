function NetProps_out = NetProps_averaging(NetProps)

% Lester Melie Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% July 27th, 2011.

%% -------- threshold  --------- %%
if isfield(NetProps,'thresh')
    NetProps_out.thresh = NetProps.thresh;
end;

%% -------- threshold bins --------- %%
if isfield(NetProps,'ThresBins')
    NetProps_out.ThresBins = NetProps.ThresBins;
end;

%% -------- logNnodes --------- %%
if isfield(NetProps,'logNnodes')
    NetProps_out.logNnodes = NetProps.logNnodes;
end;
%% -------- WhichHemifield --------- %%
if isfield(NetProps,'WhichHemifield')
    NetProps_out.WhichHemifield = NetProps.WhichHemifield;
end;

%% -------- Cluster index --------- %%
if isfield(NetProps,'Clux')
    NetProps_out = mean(NetProps.Clux,1);
end;

%% --------  Nodal Clustering index  --------- %%
if isfield(NetProps,'NodalClux')
    NetProps_out.NodalClux = mean(NetProps.NodalClux,2);
end;

%% -------- Characteristic Path length  --------- %%
if isfield(NetProps,'CharPathL')
    NetProps_out.CharPathL = mean(NetProps.CharPathL,1);
end;

%% -------- Efficiency  --------- %%
if isfield(NetProps,'Efficiency')
    NetProps_out.Efficiency = mean(NetProps.Efficiency,2);
end;

%% -------- Nodal Efficiency  --------- %%
if isfield(NetProps,'NodalEfficiency')
    NetProps_out.NodalEfficiency = mean(NetProps.NodalEfficiency,2);
end;

%% -------- Vulnmaxnode --------- %%
if isfield(NetProps,'Vulnmaxnode')
    NetProps_out.Vulnmaxnode = mean(NetProps.Vulnmaxnode,1);
end;

%% -------- VulnerabilityMat --------- %%
if isfield(NetProps,'VulnerabilityMat')
    NetProps_out.VulnerabilityMat = mean(NetProps.VulnerabilityMat,2);
end;

%% -------- CentrBet --------- %%
if isfield(NetProps,'CentrBet')
   NetProps_out.CentrBet = mean(NetProps.CentrBet,2);
end;

%% -------- CentrBetNorm --------- %%
if isfield(NetProps,'CentrBetNorm')
   NetProps_out.CentrBetNorm = mean(NetProps.CentrBetNorm,2);
end;

%% -------- isBinaryGraph --------- %%
if isfield(NetProps,'isBinaryGraph')
    NetProps_out.isBinaryGraph = NetProps.isBinaryGraph;
end;

%% -------- ConMat --------- %%
if isfield(NetProps,'ConMat')
    NetProps_out.ConMat = mean(NetProps.ConMat,3); 
end;
%% ------ Structures Field ----- %%
if isfield(NetProps,'Structures')
    NetProps_out.Structures = NetProps.Structures; 
end;

return;