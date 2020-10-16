figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,2,1)
simul_beta();

subplot(1,2,2)
simul_xi();

% Export
addpath('../../../export_fig')
export_fig('Fig_sim.tif','-nocrop','-r200')

% export_fig('../powerpoints/Fig3.tif','-nocrop','-r200')