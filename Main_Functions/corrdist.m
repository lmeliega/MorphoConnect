function d = corrdist(pos)
[rows,cols] = size(pos);
d = zeros(cols,cols);
for i=1:cols
  for j=1:(i-1)
    d(i,j) = calc_distance(pos(:,i),pos(:,j));
  end
end

d = d + d';function d = calc_distance(v1,v2)
v1bar = mean(v1);
v2bar = mean(v2);
v1diff = (v1 - v1bar);
v2diff = (v2 - v2bar);
v1difftr = v1diff';
v2difftr = v2diff';
d = 1 - ((v1diff*v2difftr)/(sqrt(v1diff*v1difftr)*sqrt(v2diff*v2difftr)));
