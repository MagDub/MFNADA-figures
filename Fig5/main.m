
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(2,2,1)
ybounds = [0 0.63];
increment = 0.2;
signif = {'','**', '**', '**'};
hight_signif = [0.44, 0.32, 0.37, 0.44];
render_epsilon(ybounds, increment, signif, hight_signif);

subplot(2,2,2)
ybounds = [0 6.7];
increment = 1.5;
signif = {'', '', '', ''};
hight_signif = [5.2, 4, 4, 4];
render_eta(ybounds, increment, signif, hight_signif);
 
subplot(2,2,3)
ybounds = [0 6.3];
increment = 1.5;
render_Q0(ybounds, increment);
 
subplot(2,2,4)
ybounds = [0 3.8];
increment = 0.8;
signif = {'', '', '', ''};
hight_signif = [2.6, 3, 3, 3];
render_sgm0(ybounds, increment, signif, hight_signif);

% Export
addpath('../../export_fig')
export_fig(['Fig5.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig5.tif'],'-nocrop','-r200')
