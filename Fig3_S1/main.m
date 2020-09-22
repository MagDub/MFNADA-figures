
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

render_RT_4_bandits();

% Export
addpath('../../export_fig')
export_fig(['Fig3S1.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig3S1.tif'],'-nocrop','-r200')
