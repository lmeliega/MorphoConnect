function ConnectList = MakeConnectionsList_twoConnectMatrices(ConMat1, ConMat2, Z, ConMatMask, StructCodes,OutputFile) 
 
% Input Parameters:
%
%    ConMat1, ConMat2  : Connectivity Matrices.
%    StructCodes : Codes of the Cortical structures
%     Z    :  z-score matrix resulting from comparing ConMat1 and ConMat2.
%   ConMatMask : Matrix containing where the connections will be listed.
%    OutputFile : Output File Name.
%  
% Output Parameters:
%
%  ConnectList : List of the connected node pairs in the input connectivity matrices modulated by ConMatMask.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% Havana, December 28th, 2010.

Nelem = numel(unique(ConMat1(:)));
ConMat1 = mean(ConMat1,3);
ConMat2 = mean(ConMat2,3);

Nc = size(ConMat1,1);

[IsSymmetric,sind] = Issymetric(ConMat1);

if Nelem==1
    ConnectList = [];
    disp('Only one value in the Connectivity Matrix ...');
    return;
end;

zval = Z.*ConMatMask.*sind;
ind = find(zval);
[zvals,indsort] = sort(zval(ind),'descend');
[indi,indj] = ind2sub([Nc,Nc],ind(indsort));
 
N = length(indi); % Asigning the new value for N (number of connections).
Conn1 = ConMat1(ind(indsort));
Conn2 = ConMat2(ind(indsort));

ConnectList = cell(N,1);
for i=1:N
    ConnectList{i}=[num2str(i) ' -- ' StructCodes(indi(i)).Name,' <--> ',StructCodes(indj(i)).Name,'  : ', ...
                    num2str(zvals(i)),'  ',num2str(Conn1(i)),'  ',num2str(Conn2(i))];
end;

if ~isempty(OutputFile)
    fid = fopen(OutputFile,'w');
    for i=1:N
        fprintf(fid,'%s  \r',ConnectList{i});
    end;
    fclose(fid);
end;

return;