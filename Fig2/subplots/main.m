
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 33 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,3,1)
ybounds = [4.8 7.2];
increment = 1;
signif = '***';
hight_signif = 6.9;
render_EV(ybounds, increment, signif, hight_signif);

subplot(1,3,2)
ybounds = [0 2.2];
increment = 1;
signif = '***';
hight_signif = 1.7;
render_IG(ybounds, increment, signif, hight_signif);

subplot(1,3,3)
ybounds = [5.3 6.7];
increment = 0.5;
signif = {'***', '***', '***'};
hight_signif = [6.1, 6.3, 6.5];
render_score(ybounds, increment, signif, hight_signif);

% Export
addpath('../../../export_fig')
export_fig(['Fig2.tif'],'-nocrop','-r200')

export_fig(['../../powerpoints/Fig2.tif'],'-nocrop','-r200')