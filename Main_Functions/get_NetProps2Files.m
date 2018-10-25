function get_NetProps2Files(NetworkPropertiesFiles,OutputFolder)

% This function save results of the Network properties to files.
%
% Input Parameters:
%     NetworkPropertiesFiles : Files with the content of the Network properties.
%     OutputFolder : Output Folder where Network properties files will be saved.
%
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% January 20th, 2009.
% Modified: April 6th, 2009

NetProps_temp = load(deblank(NetworkPropertiesFiles(1,:)));
NetProps = NetProps_temp.NetProps;
NetFilesize = size(NetProps.ConMat);
Nrep = NetFilesize(3); % Checking if we have a Network properties file with repetitions. 
if Nrep==1  % Case when we don't have repetitions in the Network properties file    
    NNets = size(NetworkPropertiesFiles,1);
    NetProps = cell(NNets,1);
    for i=1:NNets
        NetProps_temp = load(deblank(NetworkPropertiesFiles(i,:)));
        NetProps_temp = NetProps_temp.NetProps;
        NetProps{i} = NetProps_temp;
    end;
    for i=1:NNets
        Nkmean(:,i) = NetProps{i}.kmean';
    end;
    for i=1:NNets
        logNnodes = NetProps{i}.logNnodes;
        x = NetProps{i}.thresh;
        ind = find(Nkmean(:,i)<=logNnodes);
        ind2trunc(i) = min(ind);
    end;
    ind = min(ind2trunc)-2;
    x = x(1:ind);
    x = x(:);

    for i=1:NNets
        smallworld = squeeze(NetProps{i}.SmallWorld);
        gamna(:,i) = smallworld(1,:)';
    end;
    gamna = gamna(1:ind,:);

    for i=1:NNets
        smallworld = squeeze(NetProps{i}.SmallWorld);
        lambda(:,i) = smallworld(2,:)';
    end;
    lambda = lambda(1:ind,:);

    for i=1:NNets
        smallworld = squeeze(NetProps{i}.SmallWorld);
        sigmaR(:,i) = smallworld(3,:)';
    end;
    sigmaR = sigmaR(1:ind,:);

    for i=1:NNets
        Elocal(:,i) = squeeze(NetProps{i}.Efficiency(1,:,:))';
        Elocal_ratio(:,i) = squeeze(NetProps{i}.Efficiency(3,:,:))';
    end;
    Elocal = Elocal(1:ind,:);
    Elocal_ratio = Elocal_ratio(1:ind,:);

    for i=1:NNets
        Eglobal(:,i) = squeeze(NetProps{i}.Efficiency(2,:,:))';
        Eglobal_ratio(:,i) = squeeze(NetProps{i}.Efficiency(4,:,:))';
    end;
    Eglobal = Eglobal(1:ind,:);
    Eglobal_ratio = Eglobal_ratio(1:ind,:);

    for i=1:NNets
        Clustering_Index(:,i) = squeeze(NetProps{i}.Clux)';
    end;
    Clustering_Index = Clustering_Index(1:ind,:);

    for i=1:NNets
        CharPathL(:,i) = squeeze(NetProps{i}.CharPathL)';
    end;
    CharPathL = CharPathL(1:ind,:);

    for i=1:NNets
        Out_file =[OutputFolder 'Network_type_' NetProps{i}.Name '.txt'];
        fid = fopen(Out_file,'w');
        for j=1:length(x)
            Text = NetProps{i}.Network_Params(j).NetworkType;
            %indf = findstr(Text,':');
            %if ~isempty(indf)
            %    Text = Text(1:indf-1);
            %end;
            fprintf(fid,'%s \r',Text);
        end;
        fclose(fid);
    end;

    for i=1:NNets
        for j=1:length(x)
            kcrit(j,i) = NetProps{i}.Network_Params(j).c;  %#ok
            alfa(j,i) = 1 - NetProps{i}.Network_Params(j).b; %#ok
        end;
    end;
else
    % Case when we have repetitions in the Network properties file    
    Nkmean = NetProps.kmean'; %#ok
    logNnodes = NetProps.logNnodes;
    x = NetProps.thresh;
    x = x(1,:);    
    for i=1:Nrep
        ind = find(Nkmean(:,i)<=logNnodes);
        ind2trunc(i) = min(ind);
    end;
    ind = min(ind2trunc)-2;
    x = x(1:ind);
    x = x(:);
    
    smallworld = NetProps.SmallWorld;
    gamna = squeeze(smallworld(1,:,:))';

    gamna = gamna(1:ind,:);

    lambda = squeeze(smallworld(2,:,:))';
    lambda = lambda(1:ind,:);

    sigmaR = squeeze(smallworld(3,:,:))';
    sigmaR = sigmaR(1:ind,:);

    Elocal = squeeze(NetProps.Efficiency(1,:,:))';
    Elocal_ratio = squeeze(NetProps.Efficiency(3,:,:))';
    
    Elocal = Elocal(1:ind,:);
    Elocal_ratio = Elocal_ratio(1:ind,:);

    Eglobal = squeeze(NetProps.Efficiency(2,:,:))';
    Eglobal_ratio = squeeze(NetProps.Efficiency(4,:,:))';

    Eglobal = Eglobal(1:ind,:);
    Eglobal_ratio = Eglobal_ratio(1:ind,:);

    Clustering_Index = NetProps.Clux';
    Clustering_Index = Clustering_Index(1:ind,:);

    CharPathL = NetProps.CharPathL';
    CharPathL = CharPathL(1:ind,:);

    for i=1:Nrep
        for j=1:length(x)
            kcrit(j,i) = NetProps.Network_Params(i,j).c;  %#ok
            alfa(j,i) = 1 - NetProps.Network_Params(i,j).b; %#ok
        end;
    end;    
end;

%% Saving to Files.

eval(['save ' OutputFolder 'Nkmean.txt Nkmean -ascii']);
eval(['save ' OutputFolder 'gamma.txt gamna -ascii']);
eval(['save ' OutputFolder 'lambda.txt lambda -ascii']); 
eval(['save ' OutputFolder 'sigma.txt sigmaR -ascii']);
eval(['save ' OutputFolder 'Local_Efficiency.txt Elocal -ascii']);
eval(['save ' OutputFolder 'Global_Efficiency.txt Eglobal -ascii']);
eval(['save ' OutputFolder 'Local_Efficiency_ratio_Local_EfficiencyRandom.txt Elocal_ratio -ascii']);
eval(['save ' OutputFolder 'Global_Efficiency_ratio_Global_EfficiencyRandom.txt Eglobal_ratio -ascii']);
eval(['save ' OutputFolder 'Clustering_Index.txt Clustering_Index -ascii']);
eval(['save ' OutputFolder 'CharPathLength.txt CharPathL -ascii']);
eval(['save ' OutputFolder 'Threshold_list.txt x -ascii']);
eval(['save ' OutputFolder 'Kcrit.txt kcrit -ascii']);
eval(['save ' OutputFolder 'Alfa.txt alfa -ascii']);

return;

