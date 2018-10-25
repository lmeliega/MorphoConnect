function save_result2xls(Structures,ind,OutputName,StructVals)


% Lester Melie-Garcia
% Cuban Neuroscience Center
% Havana, April 18th 2013

Ns = length(ind);

data_xls = cell(Ns + 1,2);
data_xls{1,1} = 'Structure';
data_xls{1,2} = 'Structure Value';
for i=1:Ns
    data_xls{i+1,1} = Structures(ind(i)).Name;
    data_xls{i+1,2} = StructVals(ind(i));
end;

xlswrite(OutputName,data_xls, 'Data');

return;