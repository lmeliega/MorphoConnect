Files = spm_select([1,Inf],'mat','Connectivity Matrices Permutations Files ...','',cd);

NFiles = size(Files,1);
Nboot = 1000;
for i=1:NFiles
    disp(['File --->',num2str(i),' of ',num2str(NFiles)]);
    T = load(deblank(Files(i,:)));
    ConnectMatrix = T.ConnectMatrix;
    [FilePath,FileName,FileExt] = fileparts(Files(i,:));
    ConnectMatrix.ConMat = ConnectMatrix.ConMat(:,:,1:Nboot);
    ConnectMatrix.Nboot = Nboot;
    eval(['save ',FilePath,filesep,FileName,'_1000boot.mat ConnectMatrix']);
    clear ConnectMatrix;
end;
