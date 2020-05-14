function [fig, figname, LifetimeMat,sub_Mat] = lifetimefigs_celltophasor(subx,suby,fracMol_dIn,binIm_dd,mask_P_dd,dataMatrix_dd,CLIM_low,CLIM_high,filename,type,stage,savelocation)
load('jet_new');
%for k=1:n*datanum
CLIM_d=[CLIM_low,CLIM_high];
LifetimeMat=accumarray([subx,suby],fracMol_dIn,[257-binIm_dd,257-binIm_dd]);
sub_Mat=accumarray([subx,suby],1,[257-binIm_dd,257-binIm_dd]);
binary_image=mask_P_dd(:,:,1);
cutEdge=(binIm_dd-1)/2;
inten_dd=sum(dataMatrix_dd,3);
inten_dd=inten_dd./(max(inten_dd(:)));

fracMol_dIn_color=LifetimeMat;
colorInterval_d=(CLIM_d(2)-CLIM_d(1))/(64-1);
fracMol_dIn_color = (fracMol_dIn_color-CLIM_d(1))./colorInterval_d+2;
fracMol_dIn_color = round(fracMol_dIn_color);

mask_color_d_up=fracMol_dIn_color>65;
mask_color_d_low=fracMol_dIn_color<2;
mask_color_fd_low=LifetimeMat<0;
mask_color_fd_up=LifetimeMat>1;

test_fd_low=mask_color_fd_low+mask_color_d_low;
mask_color_d_low=mask_color_d_low-(test_fd_low>1);

test_fd_up=mask_color_fd_up+mask_color_d_up;
mask_color_d_up=mask_color_d_up-(test_fd_up>1);

fracMol_dIn_color=fracMol_dIn_color.*(1-mask_color_d_up-mask_color_d_low-mask_color_fd_low-mask_color_fd_up)...
    +mask_color_d_up.*65+mask_color_d_low.*2+mask_color_fd_low.*1+mask_color_fd_up.*66;

fracMol_dIn_rgb = ind2rgb(fracMol_dIn_color,jet_new);
fracMol_dIn_rgb=fracMol_dIn_rgb.*(repmat(sub_Mat,[1,1,3]));


fracMol_dIn_rgb_inten=fracMol_dIn_rgb.*repmat(inten_dd(cutEdge+1:256-cutEdge,cutEdge+1:256-cutEdge),[1,1,3]);

fig=fracMol_dIn_rgb_inten.*repmat(binary_image(cutEdge+1:256-cutEdge,cutEdge+1:256-cutEdge),[1,1,3]);
%     colorbar
%     labels1=linspace(CLIM_d(1),CLIM_d(end),3)*1E9;
%     labels=string(labels1);
%       h=colorbar;
%       yTickNumbers = linspace(0,1,3);
%       set(h,'YTick',yTickNumbers,'YTickLabel',labels);

figname=sprintf('%s_%s_%s.tif',filename,type,stage);
figname=fullfile(savelocation,figname);
imwrite(fig,figname);


end


