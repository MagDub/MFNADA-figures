
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 33 11]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,3,1)
render_corr_xi_low();

subplot(1,3,2)
render_corr_xi_consist();

subplot(1,3,3)
render_corr_eta_novel();

% Export
addpath('../../export_fig')
export_fig('Fig4S2.tif','-nocrop','-r200')

export_fig('../powerpoints/Fig4S2.tif','-nocrop','-r200')