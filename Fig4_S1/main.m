
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 26 12]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,2,1);
render_model_selection_pp_3()

subplot(1,2,2);
render_model_selection_pp()

% Export
addpath('../../export_fig')
export_fig(['Fig4S1.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig4S1.tif'],'-nocrop','-r200')