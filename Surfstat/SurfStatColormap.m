function SurfStatColormap( map );

%Colormap function for SurfStatView.
%
% Usage: SurfStatColormap( map );
%
% Same as for matlab's colormap function - see help colormap.

colormap(map);
a=get(gcf,'Children');
for i=1:length(a)
    get(a(i),'Tag');
    if strcmp(get(a(i),'Tag'),'Colorbar')
        cb=a(i);
        set(cb,'location','South');
        set(cb,'Position',[0.35 0.085 0.3 0.03]);
        set(cb,'XAxisLocation','bottom');
        return
    end
end

return
end
