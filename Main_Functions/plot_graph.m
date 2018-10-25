function plot_graph(Mat,Zones,consider_weights)
% Usage : plot_graph(Mat,Zones,consider_weights)
%
% Description: This function illustrate on a graph the white matter connections
%              between anatomical areas 
%
% Input Parameters:
%         Mat: Zone-zone connectivity matrix.
%       Zones: A struct file containing information about the considered anatomical
%       areas.
% 
%--------------------------------------------------------------------------
% Author: Yasser Iturria Medina
% Neuroimaging Department
% Cuban Neuroscience Center
% April 16th 2007
% Version $1.0

figure; hold on; colordef black
N = size(Mat,1);
K = length(find(Mat));

% Eliminating empty zones:
ind = find(sum(Mat) == 0);
Mat(ind,:) = []; Mat(:,ind) = []; Zones(ind) = []; N = length(Mat);

for zone = 1:N
   zone_points = Zones(zone).voxels;
   centers(zone,:) = mean(zone_points,1);
   colorvec(zone,:) = centers(zone,:)/norm(centers(zone,:));
end
posc_min = [min(centers(:,1)) min(centers(:,2)) min(centers(:,3))];
posc_max = [max(centers(:,1)) max(centers(:,2)) max(centers(:,3))];
colorvec = (centers-repmat(posc_min,N,1))./repmat(posc_max-posc_min,N,1);
% colorvec = rand(N,3);

h = waitbar(0,'Area ...');
for zone = 1:N-1
    waitbar(zone/(N-1), h);
    plot3(centers(zone,1),centers(zone,2),centers(zone,3),'.','Markersize',10,'Color',colorvec(zone,:))
    for zone2 = zone+1:N
        if Mat(zone,zone2) > eps
            color1 = mean([colorvec(zone,:); colorvec(zone2,:)],1);
            line([centers(zone,1) centers(zone2,1)],[centers(zone,2)...
                centers(zone2,2)],[centers(zone,3) centers(zone2,3)],'Color',color1,...
                'LineWidth',exp(Mat(zone,zone2))-1);
        end
    end
end
close(h)
% axis equal; 
