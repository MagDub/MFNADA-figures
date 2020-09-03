
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(2,2,1)
ybounds = [0 105];
increment = 25;
render_high_value(ybounds, increment);

subplot(2,2,2)
ybounds = [0 105];
increment = 25;
render_novel_value(ybounds, increment);

subplot(2,2,3)
ybounds = [0 15.5];
increment = 5;
signif = {'**', '*', '**'};
hight_signif = [7, 8.3, 10];
render_low_value(ybounds, increment, signif, hight_signif)

subplot(2,2,4)
ybounds = [34 115];
increment = 20;
signif = {'**', '*', '**'};
hight_signif = [78, 85, 92];
render_consistency(ybounds, increment, signif, hight_signif);

% Export
addpath('../../../export_fig')
export_fig(['Fig3.tif'],'-nocrop','-r200')

export_fig(['../../powerpoints/Fig3.tif'],'-nocrop','-r200')