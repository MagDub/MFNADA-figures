
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(2,2,1)
render_score_all_raw();

subplot(2,2,2)
render_score_LH_RT();

subplot(2,2,3)
render_score_exploit();

subplot(2,2,4)
render_score_explore();


% % Export
% addpath('../../export_fig')
% export_fig(['Fig2S1.tif'],'-nocrop','-r200')
% 
% export_fig(['../powerpoints/Fig2S1.tif'],'-nocrop','-r200')