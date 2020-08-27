function [] = plot_corr(fitted, generated, param_bounds_2, ticks_, title_)

col = [0.39215686917305 0.474509805440903 0.635294139385223];

corr_mat = figure('Color','w'); hold on;
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
set(gca,'TickLabelInterpreter','tex')

b = plot(0,0,'w*'); hold on;
plot(fitted, generated,'o','MarkerEdgeColor',col); hold on;
plot([-12 12],[-12 12],':k')
r = corr(fitted,generated,'Type','pearson');
l = legend([b],strcat('r =',32, num2str(round(r,4))), 'Location','northwest'); legend boxoff;
set(l,'FontSize',12);

xlim([0-0.1*param_bounds_2 param_bounds_2+0.1*param_bounds_2])
ylim([0-0.1*param_bounds_2 param_bounds_2+0.1*param_bounds_2])
xticks([ticks_])
yticks([ticks_])

ylabel('Original value','FontName','Arial','Fontweight','bold','FontSize',11);
xlabel('Fitted value','FontName','Arial','Fontweight','bold','FontSize',11);

addpath('../../export_fig')
export_fig(strcat('Fig_param_', title_ ,'.tif'),'-nocrop','-r200');

end

