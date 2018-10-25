function Morpho_save2pajek(ConMat, StructCodes, NodesCoord, PajekOutputFile)

% Input Parameters
%    ConMat         : Connectivity Matrix
%    StructCodes    : Codes of the Cortical structures
%    NodesCoord     : Matrix of the nodes coordinates
%   PajekOutputFile : Output File Name to be save in Pajek format.
%
% Lester Melie Garcia
% Cuban Neuroscience Center
% February 13th, 2010


N = size(ConMat,1); % Number of nodes. 

fid = fopen(PajekOutputFile,'w');
fprintf(fid, '*vertices %6i \r', N);

for i=1:N
    NodeValList=[num2str(i), ' "',StructCodes(i).Name,'" ', num2str(NodesCoord(i,:))];
    %NodeValList=[num2str(i), ' "',num2str(i),'" '];%, num2str(NodesCoord(i,:))];
    fprintf(fid,'%s  \r',NodeValList);    
end;
% for i = 1:N
%     fprintf(fid, '%6i "%6i" \r', [i i]);
% end

fprintf(fid, '*edges \r');
for i = 1:N
    for j = 1:N
        if ConMat(i,j) ~= 0
            fprintf(fid, '%6i %6i %6f \r', [i j ConMat(i,j)]);
        end
    end
end

fclose(fid);



return;