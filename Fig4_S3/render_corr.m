function [] = render_corr(fitted, generated, param_bounds_2, ticks_, title_, letter)

col = [0.39215686917305 0.474509805440903 0.635294139385223];

set(gca,'TickLabelInterpreter','tex')

b = plot(0,0,'w*'); hold on;
plot(fitted, generated,'o','MarkerEdgeColor',col); hold on;
plot([-12 12],[-12 12],':k')
r = corr(fitted,generated,'Type','pearson');
l = legend([b],strcat('r =',32, num2str(round(r,2))), 'Location','northwest'); legend boxoff;
set(l,'FontSize',16);

xlim([0-0.1*param_bounds_2 param_bounds_2+0.1*param_bounds_2])
ylim([0-0.1*param_bounds_2 param_bounds_2+0.1*param_bounds_2])
xticks([ticks_])
yticks([ticks_])

ylabel('Original value','FontName','Arial','Fontweight','bold','FontSize',12);
xlabel('Fitted value','FontName','Arial','Fontweight','bold','FontSize',12);

% Number and title
text(0-0.2, 1+0.2,letter,'Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)     
title(title_,'FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

set(gca,'box','off')

end

