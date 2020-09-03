
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(2,2,1)
ybounds = [0 105];
increment = 25;
render_sim_high_value(ybounds, increment);

subplot(2,2,2)
ybounds = [0 105];
increment = 25;
render_sim_novel(ybounds, increment);

subplot(2,2,3)
ybounds = [0 15.5];
increment = 5;
render_sim_low_value(ybounds, increment)

subplot(2,2,4)
ybounds = [34 115];
increment = 20;
render_sim_consistency(ybounds, increment);

% Export
addpath('../../export_fig')
export_fig(['Fig5S1.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig5S1.tif'],'-nocrop','-r200')