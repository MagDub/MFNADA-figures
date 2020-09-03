figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 26 12]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,2,1)
ybounds = [38 60.5];
increment = 5;
render_model_selection(ybounds, increment);

subplot(1,2,2)
render_param_recovery();

% Export
addpath('../../export_fig')
export_fig(['Fig4.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig4.tif'],'-nocrop','-r200')