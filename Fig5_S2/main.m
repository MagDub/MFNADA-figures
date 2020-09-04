
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

ybounds = [0 3.5];
increment = 0.8;
signif = '**';
hight_signif = 2.6;
signif_1 = '*';
hight_signif_1 = 1.7;
signif_2 = '*';
hight_signif_2 = 1.7;
render_per_gender_sgm0(ybounds, increment, signif, hight_signif, signif_1, hight_signif_1, signif_2, hight_signif_2);

% Export
addpath('../../export_fig')
export_fig(['Fig5S2.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig5S2.tif'],'-nocrop','-r200')