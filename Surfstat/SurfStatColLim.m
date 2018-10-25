function cb = SurfStatColLim( clim );

%Sets the colour limits for SurfStatView.
%
% Usage: cb = SurfStatColLim( clim );
%
% clim = [min, max] values of data for colour limits.
%
% cb   = handle to new colorbar.

a=get(gcf,'Children');
for i=1:length(a)
    tag=get(a(i),'Tag');
    if strcmp(tag,'Colorbar')
        title=get(get(a(i),'Title'),'String');
        delete(a(i));
    end
    if length(tag)>12 & strcmp(tag(1:12),'SurfStatView')
        set(a(i),'CLim',clim);
    end
end

cb=colorbar('location','South');
set(cb,'Position',[0.35 0.085 0.3 0.03]);
set(cb,'XAxisLocation','bottom');
h=get(cb,'Title');
set(h,'String',title);

return
end