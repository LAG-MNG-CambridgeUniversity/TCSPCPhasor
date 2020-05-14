function [colourbar,cbarname]=colourbar_saveloc(CLIM_low,CLIM_high,savelocation)


v=[0 0; 0 0.01; 0.5 0.01; 1 0.01; 1 0; 0.5 0];
f = [1 2 3 4 5 6];

col = [0 0 1; % red
    0 0 1;
    0 1 0; % green
    1 0 0;
    1 0 0;
    0 1 0]; % blue
%

colourbar=figure('Visible','off');hold on;
patch('Faces',f,'Vertices',v,'FaceVertexCData',col,'FaceColor','interp');
set(gca,'XTick',[], 'YTick', []);
%set(gca,'xlim',phasor_xlim,'ylim',phasor_ylim,'xtick',phasor_xtick,'ytick',phasor_ytick);
text([0.01,0.9],[0.005 0.005],{sprintf('%g %s',CLIM_low*1E9,"ns"),sprintf('%g %s',CLIM_high*1E9,"ns")},'FontSize',24,'Color','yellow');
set(gcf,'Position',[50 0 1000 50]);
cbarname=fullfile(savelocation,'cbar.tif');
% disp(cbarname);
 saveas(gcf,cbarname);
hold off;
end
