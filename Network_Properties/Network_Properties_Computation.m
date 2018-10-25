function  NetProps = Network_Properties_Computation(FileNamesConnectivityMat,whichNetProps,whichOptions,InThresh,Out_dir)


%% Lester Melie-Garcia
%  LREN, CHUV, Lausanne October 19th 2017

%% Network Properties options ...
if isfield(whichNetProps,'ClusterPos')
    ClusterPos = whichNetProps.ClusterPos; % Cluster index
else
    ClusterPos = false;
end;
if isfield(whichNetProps,'ShortpathPos')
    ShortpathPos = whichNetProps.ShortpathPos; % Short path property
else
    ShortpathPos = false;
end;
if isfield(whichNetProps,'SmallWorldPos')
    SmallWorldPos = whichNetProps.SmallWorldPos; % Small World properties
else
    SmallWorldPos = false;
end;
if isfield(whichNetProps,'EffPos')
    EffPos = whichNetProps.EffPos; % Efficiency
else
    EffPos = false;
end;
if isfield(whichNetProps,'VulPos')
    VulPos = whichNetProps.VulPos; % Vulnerability
else
    VulPos = false;
end;
if isfield(whichNetProps,'WBCPos')
    WBCPos = whichNetProps.WBCPos; % Betweeness centrality.
else
    WBCPos = false;
end;
if isfield(whichNetProps,'DegDPos')
    DegDPos = whichNetProps.DegDPos; % Degree distribution.
else
    DegDPos = false;
end;
if isfield(whichNetProps,'TargetAttackPos')
    TargetAttackPos = whichNetProps.TargetAttackPos; % Target Attack Analysis
else
    TargetAttackPos = false;
end;
if isfield(whichNetProps,'Modularity')
    Modularity = whichNetProps.Modularity;  % Modularity.
else
    Modularity = false;
end;
%% Computation options ...
if isfield(whichOptions,'GlobalThreshold')
    GlobalThreshold = whichOptions.GlobalThreshold;  % Modularity.
else
    GlobalThreshold = false;
end;
if isfield(whichOptions,'AutomaticThresh')
    AutomaticThresh = whichOptions.AutomaticThresh;  % Modularity.
else
    AutomaticThresh = false;
end;
if isfield(whichOptions,'MakeBinary')
    MakeBinary = whichOptions.MakeBinary;  % Modularity.
else
    MakeBinary = false;
end;
if isfield(whichOptions,'isThresholdRange')
    isThresholdRange = whichOptions.isThresholdRange;  % Modularity.
else
    isThresholdRange = false;
end;
if isfield(whichOptions,'BothHemisphereSeparated')
    BothHemisphereSeparated = whichOptions.BothHemisphereSeparated;  % Modularity.
else
    BothHemisphereSeparated = false;
end;
if isfield(whichOptions,'UseOnlyPositiveValues')
    UseOnlyPositiveValues = whichOptions.UseOnlyPositiveValues;  % Modularity.
else
    UseOnlyPositiveValues = false;
end;
if isfield(whichOptions,'UseOnlyNegativeValues')
    UseOnlyNegativeValues = whichOptions.UseOnlyNegativeValues;  % Modularity.
else
    UseOnlyNegativeValues = false;
end;

%%  ======  Main program ====== %%
pvalue = 0.05;
percent = (1-pvalue)*100; %
NFiles = size(FileNamesConnectivityMat,1); % Number of selected datasets.

if isThresholdRange
    ThresBins = 50:2:96;
    Nbins = length(ThresBins);
else
    ThresBins = 1;
    Nbins = 1;
end;

if BothHemisphereSeparated
    Nhemisphere = 2;
    HemiLabel{1} = '1st_Hemisphere';
    HemiLabel{2} = '2nd_Hemisphere';
else
    Nhemisphere = 1;
    HemiLabel{1} = 'Both_Hemispheres';
end;

tic;
for i=1:NFiles 
    XX = load(deblank(FileNamesConnectivityMat(i,:)));
    Vars = {'ConnectMatrix'}; %fieldnames(XX);
    eval(['ConMat_all=XX.' Vars{1} ';']); clear XX;
    cxx=0;
    ConMatFields={}; ConMatFields_Label={}; ConMat_Label={};
    if isfield(ConMat_all,'ConMat')
        cxx = cxx+1;
        ConMatFields{cxx}='ConMat';
        ConMatFields_Label{cxx}='non_bootstrapped_ConMat';
        ConMat_Label{cxx}='Non bootstrapped Network Properties';
    end;
    if isfield(ConMat_all,'ConMatboot')
        cxx = cxx+1;
        ConMatFields{cxx}='ConMatboot';
        ConMatFields_Label{cxx}='boostrapped_ConMat';
        ConMat_Label{cxx}='Bootstrapped Network Properties';
    end;
    if isfield(ConMat_all,'ConMatjack')
        cxx = cxx+1;
        ConMatFields{cxx}='ConMatjack';
        ConMatFields_Label{cxx}='jackknifed_ConMat';
        ConMat_Label{cxx}='Jackknifed Network Properties';
    end;    
    if isfield(ConMat_all,'Structures')
        Structures = ConMat_all.Structures;
        %isStructures = true;
    else
        %isStructures = false;
        if isfield(ConMat_all,'montage')
            Structures = ConMat_all.montage;
        end;
    end;    
    if isfield(ConMat_all,'GLMModel')
        GLMModel = ConMat_all.GLMModel;
    else
        GLMModel = 'Unknown';
    end;
    if isfield(ConMat_all,'Nboot')
        Nboot = ConMat_all.Nboot;
    else
        Nboot = 0;
    end;
    NNConMats= length(ConMatFields);
    for qi=1:NNConMats
        eval(['ConMat_orig=ConMat_all.' ConMatFields{qi} ';']);
        %ConMat_orig = ConMat.ConMat;  % Saving Original Connectivity Matrix in ConMat_orig.
        [Ne0,Ne0,Nwins] = size(ConMat_orig); % Ne : number of nodes in the Connectivity Matrix
        ind_half1 = 1:floor(Ne0/2); ind_half2 = floor(Ne0/2)+1:Ne0;
        indhe{1} = 1:floor(Ne0/Nhemisphere);
        indhe{2} = floor(Ne0/Nhemisphere)+1:Ne0;
        for he=1:Nhemisphere
            ConMat = ConMat_orig(indhe{he},indhe{he},:);
            if UseOnlyPositiveValues
                indyyy = ConMat<0;
                ConMat(indyyy) = 0;
                NetProps.ConMatTypeValues = 'OnlyPositiveValues';
            else
                if UseOnlyNegativeValues
                    indyyy = ConMat>0;
                    ConMat(indyyy) = 0;
                    ConMat = abs(ConMat);
                    NetProps.ConMatTypeValues = 'OnlyNegativeValues';
                else
                    ConMat = abs(ConMat);
                    NetProps.ConMatTypeValues = 'AbsoluteValues';
                end;
            end;
            [Ne,Ne,Nwins] = size(ConMat); % Ne : number of nodes in the Connectivity Matrix
            lowerhalf = (tril(ones(Ne),-1)>0);
            upperhalf = (triu(ones(Ne), 1)>0);
            ind = lowerhalf | upperhalf;
            %ConMat = repmat(ConMat,[1,1,1,Nbins]);
            if (GlobalThreshold)&&(~isThresholdRange)
%                 ind = squeeze(repmat(ind,[1,1,Nwins]));
%                 if AutomaticThresh
%                     %ind = abs(ConMat)>0;
%                     Thresh  = myprctile(ConMat(ind),percent);
%                 end;
%                 if MakeBinary
%                     %ind = abs(ConMat)>0;
%                     Thresh  = myprctile(ConMat(ind),InThresh);
%                     indp = abs(ConMat)>Thresh;  % AQUI
%                     ConMat = double(indp); % Binary Connectivity Matrix in double data format.
%                 else
%                     %ind = abs(ConMat)>0;
%                     Thresh  = myprctile(ConMat(ind),InThresh);
%                     indp = abs(ConMat)<Thresh;
%                     ConMat(indp) = 0;
%                 end;
%                 NetProps.thresh = Thresh;
            else
                NetProps.thresh = zeros(Nwins,Nbins);
            end;
            
            if isThresholdRange
                NetProps.thresh = zeros(Nwins,Nbins);
            end;
            NetProps.ThresBins = ThresBins;
            NetProps.logNnodes = log(Ne);
            NetProps.WhichHemifield = HemiLabel{he};
            %NetProps = ConMat; % Creating the Network properties struct.
            
            if ClusterPos
                NetProps.Clux= zeros(Nwins,Nbins);
                NetProps.NodalClux = zeros(Ne,Nwins,Nbins);
            end;
            if ShortpathPos
                NetProps.CharPathL = zeros(Nwins,Nbins);
                NetProps.Eccentricity = zeros(Ne,Nwins,Nbins);
            end;
            if SmallWorldPos
                NetProps.SmallWorld= zeros(3,Nwins,Nbins);
            end;
            if EffPos
                NetProps.Efficiency= zeros(4,Nwins,Nbins);
                NetProps.NodalEfficiency= zeros(Ne,Nwins,Nbins);
            end;
            if VulPos
                NetProps.Vulnmaxnode= zeros(Nwins,Nbins,2);
                NetProps.VulnerabilityMat= zeros(Ne,Nwins,Nbins);
            end;
            if WBCPos
                NetProps.CentrBet= zeros(Ne,Nwins,Nbins);
                NetProps.CentrBetNorm= zeros(Ne,Nwins,Nbins);
            end;
            if DegDPos
                NetProps.DegDistr= zeros(Ne-1,3,Nwins,Nbins);
                Network_Params.NetworkType = 'Unknown';
                Network_Params.a = 0;
                Network_Params.b = 0;
                Network_Params.c = 0;
                NetProps.Network_Params(1:Nwins,1:Nbins) = Network_Params;
                %NetProps.kmean = zeros(Nwins,Nbins);
            end;
            if TargetAttackPos
                [Nc,thresbins] = Target_attack_analysis(ConMat(:,:,1),50); % This step is just for taking the length of thresbins variable.
                NetProps.TargetAttack = zeros(length(thresbins),Nwins,Nbins);
            end;
            if Modularity
                NetProps.Modularity = zeros(Nwins,Nbins);
                NetProps.NodeModules = zeros(Ne,Nwins,Nbins);
                NetProps.ModulesNumber = zeros(Nwins,Nbins);
            end;
            NetProps.NodeConnection = zeros(Ne,Nwins);
            NetProps.GlobalConnectivity = zeros(Nwins,1);
            NetProps.HomologousStructConnection = zeros(Nwins,1);
            % Preparing Folder to save Network properties.
            [pth, nm, xt] = fileparts(FileNamesConnectivityMat(i,:));
            if (~exist('Out_dir','var'))||(isempty(Out_dir))
                Out_dirt = deblank(pth);
            else
                Out_dirt = deblank(Out_dir(i,:));
            end
            mkdir(Out_dirt,'NetworkProperties');
            % Defining struct fields to save the Network properties.
            NetProps.isBinaryGraph = MakeBinary;
            NetProps.Name=nm;
            NetProps.GlobalThreshold = GlobalThreshold;
            tic;
            for t=1:Nwins
                disp(['Dataset ' num2str(i) '/' num2str(NFiles) ' : window ' num2str(t) '/' num2str(Nwins) ' finished']);
                if ~GlobalThreshold
                    tempConMat = ConMat(:,:,t);
                    %if AutomaticThresh
                    %ind = abs(tempConMat)>0;
                    Thresh  = myprctile(tempConMat(ind),percent);
                    %end;
                    if MakeBinary
                        indp = abs(tempConMat)>Thresh;
                        tempConMat = double(indp); % Binary Connectivity Matrix in double data format.
                    else
                        indp = abs(tempConMat)<=Thresh;
                        tempConMat(indp) = 0;
                    end;
                    ConMat(:,:,t) = tempConMat;
                    NetProps.thresh(t) = Thresh;
                else
                    if ~isThresholdRange
                        tempConMat = ConMat(:,:,t);
                        Thresh  = myprctile(tempConMat(ind),InThresh);
                        if MakeBinary
                            indp = abs(tempConMat)>Thresh;
                            tempConMat = double(indp); % Binary Connectivity Matrix in double data format.
                        else
                            indp = abs(tempConMat)<=Thresh;
                            tempConMat(indp) = 0;
                        end;
                        ConMat(:,:,t) = tempConMat;
                        NetProps.thresh(t) = Thresh;
                    end;
                end;
                for rt=1:Nbins
                    disp([num2str(rt) ' of ' num2str(Nbins) ' , ' num2str(ThresBins(rt))]);
                    ConMatP = ConMat(:,:,t);
                    if isThresholdRange
                        percent = ThresBins(rt);
                        tempConMat = ConMatP;
                        %tempConMat = abs(ConMat(:,:,t,rt));
                        %ind = abs(tempConMat)>0;
                        Thresh  = myprctile(tempConMat(ind),percent);
                        ConMatP = double(abs(tempConMat)>Thresh);
                        NetProps.thresh(t,rt) = Thresh;
                    end;
                    if ClusterPos==1
                        if MakeBinary
                            CluxNodal = clustering_coef_bu(double(ConMatP));
                        else
                            CluxNodal = clustering(ConMatP);
                        end;
                        Clux = mean(CluxNodal);
                        NetProps.Clux(t,rt) = Clux;
                        NetProps.NodalClux(:,t,rt) = CluxNodal(:);
                        disp('Clustering Index ... Done');
                    end
                    if ShortpathPos==1
                        if MakeBinary
                            [charPathL, D] = shortpath_bin(double(ConMatP));
                        else
                            [charPathL, D] = shortpath(ConMatP);
                        end;
                        NetProps.CharPathL(t,rt) = charPathL;
                        disp('Characteristic path length ... Done');
                        [~,~,ecc] = charpath(D);
                        NetProps.Eccentricity(:,t,rt) = ecc(:);
                        disp('Nodal Eccentricity ... Done');
                    end
                    if SmallWorldPos==1
                        if SmallWorldPos==1 && ClusterPos==0 && ShortpathPos==0
                            if MakeBinary
                                Clux = mean(clustering_coef_bu(double(ConMatP)));
                                [charPathL, D] = shortpath_bin(double(ConMatP));
                            else
                                Clux = mean(clustering(ConMatP));
                                [charPathL, D] = shortpath(double(ConMatP));
                            end;
                        elseif SmallWorldPos==1 && ClusterPos==0
                            if MakeBinary
                                Clux = mean(clustering_coef_bu(double(ConMatP)));
                            else
                                Clux = mean(clustering_coef_wu(ConMatP));
                            end;
                        elseif SmallWorldPos==1 && ShortpathPos==0
                            if MakeBinary
                                [charPathL, D] = shortpath_bin(double(ConMatP));
                            else
                                [charPathL, D] = shortpath(double(ConMatP));
                            end;
                        end
                        if MakeBinary
                            [gamna, lambda, sigma, Mat_rand, D_rand] = smallworld_bin(double(ConMatP), Clux, charPathL);
                        else
                            [gamna, lambda, sigma, Mat_rand, D_rand] = smallworld(ConMatP, Clux, charPathL);
                        end;
                        gamna=gamna(1);lambda=lambda(1); sigma=sigma(1);
                        NetProps.SmallWorld(:,t,rt) = [gamna;lambda;sigma];
                        disp('small world parameters ... Done');
                    end;
                    if EffPos==1
                        if EffPos==1 && ShortpathPos==0 && SmallWorldPos==0
                            if MakeBinary
                                D = distance_bin(double(ConMatP));
                            else
                                D = distance_wu(ConMatP);
                            end;
                            ind = (D==Inf);
                            D(ind)=0;
                            %Mat_rand= randmiou(ConMat(:,:,t,rt), 100); % Note: In this case we wont compare the network efficiency with its random counterpart
                            %D_rand = distance_bin(Mat_rand);
                            %ind = (D_rand==Inf);
                            %D_rand(ind)=0;
                        elseif EffPos==1 && ShortpathPos==0
                            %Calculate D
                            if MakeBinary
                                D = distance_bin(double(ConMatP));
                            else
                                D = distance_wu(ConMatP);
                            end;
                            ind = (D==Inf);
                            D(ind)=0;
                        elseif EffPos==1 && SmallWorldPos==0
                            %Calculate Mat_rand, D_rand
                            %Mat_rand= randmiou(ConMat(:,:,t,rt), 100); % Note: In this case we wont compare the network efficiency with its random counterpart
                            %D_rand = distance_bin(Mat_rand);
                            %ind = (D_rand==Inf);
                            %D_rand(ind)=0;
                        end
                        % Note: In this case we wont compare the network efficiency with its random counterpart
                        %[Eglob_rand, Eloc_rand] = Efficiency(Mat_rand,D_rand);
                        %rEglob = Eglob/Eglob_rand; rEloc = Eloc/Eloc_rand;
                        %rEglobal=rEglob(1,1);
                        %NetProps.Efficiency(:,t,rt)=[Eloc;Eglobal;rEloc;rEglobal];
                        if MakeBinary
                            [Eglobal, Enod, Eloc] = Efficiency_bin(double(ConMatP), 0, D);
                        else
                            [Eglobal, Enod, Eloc] = Efficiency(ConMatP, full(D));
                        end;
                        rEloc = 1; rEglobal = 1;
                        NetProps.Efficiency(:,t,rt)=[Eloc;Eglobal;rEloc;rEglobal];
                        NetProps.NodalEfficiency(:,t,rt) = Enod;
                        disp('Global and local efficiency ... Done');
                    end
                    if VulPos==1
                        if VulPos==1 && EffPos==0
                            if ShortpathPos==0 && SmallWorldPos==0
                                %Calculate D; Mat_rand, D_rand
                                if MakeBinary
                                    D = distance_bin(double(ConMatP));
                                else
                                    D = distance_wu(ConMatP);
                                end;
                                ind = (D==Inf);
                                D(ind)=0;
                                %Mat_rand= randmiou(ConMat(:,:,t,rt), 100); % Note: In this case we wont compare the network efficiency with its random counterpart
                                %D_rand = distance_bin(Mat_rand);
                                %ind = (D_rand==Inf);
                                %D_rand(ind)=0;
                            elseif ShortpathPos==0
                                %Calculate D; Mat_rand, D_rand
                                if MakeBinary
                                    D = distance_bin(double(ConMatP));
                                else
                                    D = distance_wu(ConMatP);
                                end;
                                ind = (D==Inf);
                                D(ind)=0;
                            elseif SmallWorldPos==0
                                %Mat_rand= randmiou(ConMat(:,:,t,rt), 100); % Note: In this case we wont compare the network efficiency with its random counterpart
                                %D_rand = distance_bin(Mat_rand);
                                %ind = (D_rand==Inf);
                                %D_rand(ind)=0;
                            end;
                            if MakeBinary
                                [Eglobal, Enod, Eloc] = Efficiency_bin(double(ConMatP), 0, D); %#ok
                            else
                                [Eglobal, Enod, Eloc] = Efficiency(ConMatP, full(D)); %#ok
                            end;
                            %[Eglob_rand, Eloc_rand] = Efficiency_bin(Mat_rand, 0, D_rand);
                            %rEglobal = Eglob/Eglob_rand; rEloc = Eloc/Eloc_rand;
                        end;
                        if MakeBinary
                            [Vi, Vmax, Vindex] = Vulnerability_bin(double(ConMatP), 0, Eglobal);
                        else
                            [Vi, Vmax, Vindex] = Vulnerability_wu(ConMatP, 0, Eglobal);
                        end;
                        NetProps.Vulnmaxnode(t,rt,:)= [Vindex,Vmax];
                        NetProps.VulnerabilityMat(:,t,rt)= Vi;
                        disp('Vulnerability ... Done');
                    end
                    if WBCPos==1
                        if MakeBinary
                            BC = betweenness_bin(double(ConMatP));
                        else
                            if ~exist('D','var')
                                D = distance_wu(ConMatP);
                            end;
                            BC = betweenness_wu(D);
                        end;
                        bw = BC(:)/max(BC); % Normalized Betweennes centrality across the maximum.
                        bwnorm = BC(:)/mean(BC);% Normalized Betweennes centrality across the mean.
                        NetProps.CentrBet(:,t,rt)= bw;
                        NetProps.CentrBetNorm(:,t,rt) = bwnorm;
                        disp('Betweennes centrality ... Done');
                    end
                    if DegDPos ==1
                        if DegDPos==1 && SmallWorldPos==0
                            Mat_rand = randmiou(ConMatP, 100);
                        end
                        [x, y, cy, Network_Params]=degreedist01(double(ConMatP), Mat_rand);
                        NetProps.DegDistr(:,1,t,rt)= x;
                        NetProps.DegDistr(:,2,t,rt)= y;
                        NetProps.DegDistr(:,3,t,rt)= cy;
                        NetProps.Network_Params(t,rt) = Network_Params;
                        %Ctemp = squeeze(ConMat(:,:,t,rt));
                        %Ctemp = Ctemp>0; knodes = sum(Ctemp,1);
                        %NetProps.kmean(t,rt) = mean(knodes);
                    end
                    if TargetAttackPos==1
                        [T,Tthresbins] = Make_Target_attack_analysis_upgrade(ConMatP,percent,false);
                        NetProps.TargetAttack(:,t,rt) = T;
                    end;
                    if TargetAttackPos
                        NetProps.TargetAttackthresbins = Tthresbins;
                    end;
                    if Modularity==1
                        if MakeBinary
                            [NodeModules,NetModularity] = modularity_und(double(ConMatP));
                        else
                            [NodeModules,NetModularity] = modularity_und(ConMatP);
                        end;
                        NetProps.Modularity(t,rt) = NetModularity;
                        NetProps.NodeModules(:,t,rt) = NodeModules;
                        NetProps.ModulesNumber(t,rt) = length(unique(NodeModules));
                        disp('Modularity ... Done');
                    end;
                    %Ctemp = squeeze(ConMat(:,:,t,rt)); % Esto esta comentado para ser arreglado despues.
                    %Ctemp = Ctemp>0; knodes = sum(Ctemp,1);
                    %NetProps.kmean(t,rt) = mean(knodes);
                end; % end for rt=1:Nbins
                                
                %NodeConnection = squeeze(mean(abs(ConMat_orig(indhe{he},indhe{he},t)),2));
                NodeConnection = squeeze(mean(abs(ConMat(indhe{he},indhe{he},t)),2));
                NetProps.NodeConnection(:,t) = NodeConnection; %(:);
                NetProps.GlobalConnectivity(t) = mean(NodeConnection(:));
                %ConMat_inter = abs(ConMat_orig(ind_half1,ind_half2,t)); % Inter-hemispheric part of the Connectivity Matrix.
                ConMat_inter = abs(ConMat(ind_half1,ind_half2,t)); % Inter-hemispheric part of the Connectivity Matrix.
                NetProps.HomologousStructConnection(t) = mean(diag(ConMat_inter));              
            end;  % end for j=1:Nwins
            % Largest component assesment ...
            [NcC,thresCC,thresSC,thresAveC,thresbinsC,thresS_course] = Netlargest_comp(ConMat_orig(indhe{he},indhe{he},:));
            NetProps.LargestComponent.thresS_course = thresS_course;
            NetProps.LargestComponent.Nc = NcC;
            NetProps.LargestComponent.thresbins = thresbinsC;
            NetProps.LargestComponent.thresC = thresCC;
            NetProps.LargestComponent.thresS = thresSC;
            NetProps.LargestComponent.thresAve = thresAveC;           
            toc;        
            if TargetAttackPos
                NetProps.TargetAttackthresbins = Tthresbins;
            end;
            NetProps.ConMat = ConMat_orig(indhe{he},indhe{he},:);
            % Calculating most connected nodes ..
            %NodeConnection = mean(mean(abs(ConMat_orig(indhe{he},indhe{he},:)),3),2);
            if ~strcmpi(ConMatFields_Label{qi},'original_ConMat');
                NetProps.Nboot = Nboot; % Saving the number of bootstraps.
            end;
            NetProps.Nwins = Nwins; % Saving the number of windows.
            NetProps.Type = ConMat_Label{qi};
            if Nhemisphere==1
                NetProps.Structures = Structures;
                NetProps.GLMModel = GLMModel;
                NetProps.NHemispheres = 2;                
                NetProps.date = datestr(clock, 'yyyy-mm-dd HH:MM:SS');
                save([Out_dirt filesep 'NetworkProperties' filesep nm '_' ConMatFields_Label{qi} '_NetProps'  xt], 'NetProps'); % saving results.
            else
                NetProps.Structures = Structures(indhe{he});
                NetProps.GLMModel = GLMModel;
                NetProps.NHemispheres = 1;
                NetProps.date = date;
                save([Out_dirt filesep 'NetworkProperties' filesep nm '_' ConMatFields_Label{qi} '_NetProps_' HemiLabel{he} xt], 'NetProps'); % saving results.
            end;
        end; % end for he=1:Nhemisphere
    end;
end;
toc;

return;