
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 35 12]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,3,1)
ybounds = [0 26];
increment = 5;
render_percond_high(ybounds, increment);

subplot(1,3,2)
ybounds = [0 26];
increment = 5;
render_percond_novel(ybounds, increment);

subplot(1,3,3)
ybounds = [0 7];
increment = 2;
render_percond_low(ybounds, increment);

% Export
addpath('../../export_fig')
export_fig(['Fig3S2.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig3S2.tif'],'-nocrop','-r200')
