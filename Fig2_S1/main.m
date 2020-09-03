
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 33 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,3,1)
render_score_exploit();

subplot(1,3,2)
render_score_explore();

subplot(1,3,3)
render_score_LH_RT();

% Export
addpath('../../export_fig')
export_fig(['Fig2S1.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig2S1.tif'],'-nocrop','-r200')