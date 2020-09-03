
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(2,2,1)
ybounds = [0 0.65];
increment = 0.2;
signif = {'**', '**', '**'};
hight_signif = [0.32, 0.37, 0.44];
render_epsilon(ybounds, increment, signif, hight_signif);

subplot(2,2,2)
ybounds = [0 6.6];
increment = 1.5;
render_eta(ybounds, increment);

subplot(2,2,3)
ybounds = [0 6.3];
increment = 1.5;
render_Q0(ybounds, increment);

subplot(2,2,4)
ybounds = [0 3.5];
increment = 0.8;
render_sgm0(ybounds, increment);

% Export
addpath('../../../export_fig')
export_fig(['Fig5.tif'],'-nocrop','-r200')

export_fig(['../../powerpoints/Fig5.tif'],'-nocrop','-r200')
