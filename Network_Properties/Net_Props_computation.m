function Net_Props_computation(FileNamesConnectivityMat,whichNetProps,GlobalThreshold,AutomaticThresh, ...
                               MakeBinary,isThresholdRange,Out_dir,Thresh)


% Lester Melie-Garcia
% Neuroimaging Department
% Cuban Neuroscience Center
% Havana, December 21st, 2008

ClusterPos = whichNetProps.ClusterPos; % Cluster index
ShortpathPos = whichNetProps.ShortpathPos; % Short path property
SmallWorldPos = whichNetProps.SmallWorldPos; % Small World properties
EffPos = whichNetProps.EffPos; % Efficiency
VulPos = whichNetProps.VulPos; % Vulnerability
WBCPos = whichNetProps.WBCPos; % Betweeness centrality.
DegDPos = whichNetProps.DegDPos; % Degree distribution.
%SpecDensPos = whichNetProps.SpecDensPos; % Spectral_Density

%%
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

for i=1:NFiles
    XX = load(deblank(FileNamesConnectivityMat(i,:)));
    Vars = fieldnames(XX);
    eval(['ConMat=XX.' Vars{1} ';']); clear XX;
    ConMat = abs(ConMat.ConMat);
    [Ne,Ne,Nwins] = size(ConMat); % Ne : number of nodes in the Connectivity Matrix
    ConMat = repmat(ConMat,[1,1,1,Nbins]);
    if (GlobalThreshold)&&(~isThresholdRange)
        if AutomaticThresh
            ind = ConMat>0;
            Thresh  = myprctile(ConMat(ind),percent);
        end;
        if MakeBinary
            ind = ConMat>Thresh;
            ConMat = double(ind); % Binary Connectivity Matrix in double data format.
        else
            ind = ConMat<Thresh;
            ConMat(ind) = 0;
        end;
        NetProps.thresh = Thresh;
    else
        NetProps.thresh = zeros(Nwins,Nbins);
    end;

    if isThresholdRange
        NetProps.thresh = zeros(Nwins,Nbins);
    end;
    NetProps.ThresBins = ThresBins;
    NetProps.logNnodes = log(Ne);
    %NetProps = ConMat; % Creating the Network properties struct.

    if ClusterPos
        NetProps.Clux= zeros(Nwins,Nbins);
    end;
    if ShortpathPos
        NetProps.CharPathL= zeros(Nwins,Nbins);
    end;
    if SmallWorldPos
        NetProps.SmallWorld= zeros(3,Nwins,Nbins);
    end;
    if EffPos
        NetProps.Efficiency= zeros(4,Nwins,Nbins);
    end;
    if VulPos
        NetProps.Vulnmaxnode= zeros(Nwins,Nbins,2);
        NetProps.VulnerabilityMat= zeros(Ne,Nwins,Nbins);
    end;
    if WBCPos
        NetProps.CentrBet= zeros(Ne,Nwins,Nbins);
    end;
    if DegDPos
        NetProps.DegDistr= zeros(Ne-1,3,Nwins,Nbins);
        Network_Params.NetworkType = 'Unknown';
        Network_Params.a = 0;
        Network_Params.b = 0;
        Network_Params.c = 0;
        NetProps.Network_Params(1:Nwins,1:Nbins) = Network_Params;
        NetProps.kmean = zeros(Nwins,Nbins);
    end;
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
    for t=1:Nwins
        disp(['Dataset ' num2str(i) '/' num2str(NFiles) ' : window ' num2str(t) '/' num2str(Nwins) ' finished']);
        if ~GlobalThreshold
            tempConMat = ConMat(:,:,t,1);
            %if AutomaticThresh
            ind = tempConMat>0;
            Thresh  = myprctile(tempConMat(ind),percent);
            %end;
            if MakeBinary
                ind = tempConMat>Thresh;
                tempConMat = double(ind); % Binary Connectivity Matrix in double data format.
            else
                ind = tempConMat<Thresh;
                tempConMat(ind) = 0;
            end;
            ConMat(:,:,t,1) = tempConMat;
            NetProps.thresh(t) = Thresh;
        end;
        for rt=1:Nbins
            disp([num2str(rt) ' of ' num2str(Nbins) ' , ' num2str(ThresBins(rt))]);
            if isThresholdRange
                percent = ThresBins(rt);
                tempConMat = ConMat(:,:,t,rt);
                ind = tempConMat>0;
                Thresh  = myprctile(tempConMat(ind),percent);
                ConMat(:,:,t,rt) = double(tempConMat>Thresh);
                NetProps.thresh(t,rt) = Thresh;
            end;
            if ClusterPos==1
                Clux = clustering(ConMat(:,:,t,rt));
                %disp(['Cluster Index... ' num2str(Clux)]);
                NetProps.Clux(t,rt) = Clux;
            end
            if ShortpathPos==1
                [charPathL, D, Dist] = shortpath(ConMat(:,:,t,rt));
                CharPathLength = charPathL(1,1);
                %disp(['Average Distance... ' num2str(charPathL(1,1))]);
                NetProps.CharPathL(t,rt) = CharPathLength;
            end
            if SmallWorldPos==1
                if SmallWorldPos==1 && ClusterPos==0 && ShortpathPos==0
                    Clux = clustering(ConMat(:,:,t,rt));
                    [charPathL, D, Dist]=shortpath(ConMat(:,:,t,rt));
                elseif SmallWorldPos==1 && ClusterPos==0
                    Clux = clustering(ConMat(:,:,t,rt));
                elseif SmallWorldPos==1 && ShortpathPos==0
                    [charPathL, D, Dist]=shortpath(ConMat(:,:,t,rt));
                end
                [gamna, lambda, sigma, Mat_rand, D_rand]=smallworld(ConMat(:,:,t,rt), Clux, charPathL);

                %disp(['gamna... ' num2str(gamna)]); % clusterindex
                %disp(['lambda... ' num2str(lambda(1,1))]); % pathlength
                %disp(['sigma... ' num2str(sigma)]); % small world

                gamna=gamna(1);lambda=lambda(1); sigma=sigma(1);
                NetProps.SmallWorld(:,t,rt) = [gamna;lambda;sigma];
            end
            if EffPos==1
                if EffPos==1 && ShortpathPos==0 && SmallWorldPos==0
                    %Calculate D; Mat_rand, D_rand
                    Dist = squeeze(ConMat(:,:,t,rt).^(-1)); ind = isinf(Dist);   Dist(ind)=0;
                    D = dijk(Dist);   %%Dijkstra’s algorithm to find shortest path
                    ind = find(D==Inf);
                    D(ind)=0;

                    Mat_rand= randmiou(ConMat(:,:,t,rt), 100);
                    Dist_rand = Mat_rand.^(-1); ind = isinf(Dist_rand);   Dist_rand(ind)=0;
                    D_rand = dijk(Dist_rand);
                    ind = find(D_rand==Inf);
                    D_rand(ind)=0;
                elseif EffPos==1 && ShortpathPos==0
                    %Calculate D
                    Dist = squeeze(ConMat(:,:,t,rt).^(-1)); ind = isinf(Dist);   Dist(ind)=0;
                    D = dijk(Dist);   %%Dijkstra’s algorithm to find shortest path
                    ind = find(D==Inf);
                    D(ind)=0;
                elseif EffPos==1 && SmallWorldPos==0
                    %Calculate Mat_rand, D_rand
                    Mat_rand= randmiou(ConMat(:,:,t,rt), 100);
                    Dist_rand = Mat_rand.^(-1); ind = isinf(Dist_rand);   Dist_rand(ind)=0;
                    D_rand = dijk(Dist_rand);
                    ind = find(D_rand==Inf);
                    D_rand(ind)=0;
                end
                [Eglob, Eloc] = Efficiency(ConMat(:,:,t,rt), D);
                Eglobal=Eglob(1,1);
                %disp(['Global efficiency... ' num2str(Eglob(1,1))])
                %disp(['Local efficiency... ' num2str(Eloc)])
                [Eglob_rand, Eloc_rand] = Efficiency(Mat_rand,D_rand);
                rEglob = Eglob/Eglob_rand; rEloc = Eloc/Eloc_rand;
                rEglobal=rEglob(1,1);
                %disp(['relative Global efficiency... ' num2str(rEglob(1,1))])
                %disp(['relative Local efficiency... ' num2str(rEloc)])
                NetProps.Efficiency(:,t,rt)=[Eloc;Eglobal;rEloc;rEglobal];
            end
            if VulPos==1
                if VulPos==1 && EffPos==0
                    if ShortpathPos==0 && SmallWorldPos==0
                        %Calculate D; Mat_rand, D_rand
                        Dist = squeeze(ConMat(:,:,t,rt).^(-1)); ind = isinf(Dist);   Dist(ind)=0;
                        D = dijk(Dist);   %%Dijkstra’s algorithm to find shortest path
                        ind = find(D==Inf);
                        D(ind)=0;
                        Mat_rand = randmiou(ConMat(:,:,t,rt), 100);
                        Dist_rand = Mat_rand.^(-1); ind = isinf(Dist_rand);   Dist_rand(ind)=0;
                        D_rand = dijk(Dist_rand);
                        ind = find(D_rand==Inf);
                        D_rand(ind)=0;
                    elseif ShortpathPos==0
                        Dist = squeeze(ConMat(:,:,t,rt).^(-1)); ind = isinf(Dist);   Dist(ind)=0;
                        D = dijk(Dist);   %%Dijkstra’s algorithm to find shortest path
                        ind = find(D==Inf);
                        D(ind)=0;
                    elseif SmallWorldPos==0
                        Mat_rand = randmiou(ConMat(:,:,t,rt), 100);
                        Dist_rand = Mat_rand.^(-1); ind = isinf(Dist_rand);   Dist_rand(ind)=0;
                        D_rand = dijk(Dist_rand);
                        ind = find(D_rand==Inf);
                        D_rand(ind)=0;
                    end
                    [Eglob, Eloc] = Efficiency(ConMat(:,:,t,rt), D);
                    Eglobal = Eglob(1,1);
                    [Eglob_rand, Eloc_rand] = Efficiency(Mat_rand,D_rand);
                    rEglob = Eglob/Eglob_rand; rEloc = Eloc/Eloc_rand;
                    rEglobal=rEglob(1,1);
                end
                E = Eglob(1,1);
                V = Vulnerability(ConMat(:,:,t,rt), E);
                [Vuln_m,Vuln_node_m] = max(V);
                %disp(['Vulnerability ' num2str(Vuln_m) ', node ' num2str(Vuln_node_m)])
                NetProps.Vulnmaxnode(t,rt,:)= [Vuln_node_m,Vuln_m];
                NetProps.VulnerabilityMat(:,t,rt)= V';
            end
            if WBCPos==1
                %         if WBCPos==1 && ShortpathPos==0
                %             Dist = Mat.^(-1); ind = isinf(Dist);   Dist(ind)=0;
                %         end
                %=============
                % Yasser's function:
                % bw = WBC(Dist);
                %============
                BC=betweenness_bin(ConMat(:,:,t,rt));
                bw=BC/max(BC);
                NetProps.CentrBet(:,t,rt)= bw';
            end
            if DegDPos ==1
                if DegDPos==1 && SmallWorldPos==0
                    Mat_rand = randmiou(ConMat(:,:,t,rt), 100);
                end
                [x, y, cy, Network_Params]=degreedist01(ConMat(:,:,t,rt), Mat_rand);
                NetProps.DegDistr(:,1,t,rt)= x;
                NetProps.DegDistr(:,2,t,rt)= y;
                NetProps.DegDistr(:,3,t,rt)= cy;
                NetProps.Network_Params(t,rt) = Network_Params;
                Ctemp = squeeze(ConMat(:,:,t,rt));
                Ctemp = Ctemp>0; knodes = sum(Ctemp,1);
                NetProps.kmean(t,rt) = mean(knodes);
            end

            %         if SpecDensPos ==1
            %             if SpecDensPos==1 && SmallWorldPos==0
            %                 Mat_rand = randmiou(Mat(:,:,t), 100);
            %             end
            %             [landfMat, rofMat] = spectral_density(Mat(:,:,t));
            %             [landfMat_rand, rofMat_rand] = spectral_density(Mat_rand);
            %
            %             SpecDensVectorData(:,1,t)=rofMat;
            %             SpecDensVectorData(:,2,t)=landfMat';
            %
            %             SpecDensVectorRand(:,1,t)=rofMat_rand;
            %             SpecDensVectorRand(:,2,t)=landfMat_rand';
            %
            %         end
        end; % end for rt=1:Nbins

    end;  % end for j=1:Nwins

    if MakeBinary
        NetProps.ConMat = logical(ConMat);  % variable 'ind' holds the logical thresholded network.
    else
        NetProps = rmfield(NetProps,'ConMat');
    end;
    %     NetProps.SpecDensData=SpecDensVectorData;
    %     NetProps.SpecDensRand= SpecDensVectorRand;
    save([Out_dirt filesep 'NetworkProperties' filesep nm '_NetProps' xt], 'NetProps'); % saving results.
end

return;




