
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

ybounds = [0 3.5];
increment = 0.8;
render_per_gender_sgm0(ybounds, increment);

% Export
addpath('../../export_fig')
export_fig(['Fig5S2.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig5S2.tif'],'-nocrop','-r200')