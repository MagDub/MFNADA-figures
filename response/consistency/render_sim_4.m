
function [] = render_sim_4(ybounds, increment, data, letter, subplot_title, y_axis_, x_axis_, xlab)

    part_num = 200;

    col = [0.39215686917305 0.474509805440903 0.635294139385223];

    h(1) = bar([0],data(1,1),'FaceColor',col, 'FaceAlpha', 0.6, 'BarWidth',0.9); hold on;
    errorbar([0],data(1,1),data(1,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;

    h(2) = bar([1],data(2,1),'FaceColor',col, 'FaceAlpha', 0.6, 'BarWidth',0.9); hold on;
    errorbar([1],data(2,1),data(2,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;
    
    h(3) = bar([2],data(3,1),'FaceColor',col, 'FaceAlpha', 0.6, 'BarWidth',0.9); hold on;
    errorbar([2],data(3,1),data(3,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;
    
    xlabel((x_axis_),'FontName','Arial','Fontweight','bold','FontSize',12);
    ylabel((y_axis_),'FontName','Arial','Fontweight','bold','FontSize',12);
    
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

    xlim([-0.6 2.6])
    xticks([0 1 2])
    xticklabels(xlab);
    set(gca,'box','off')
  
    % Number and title
    text(0-0.2, 1+0.2,letter,'Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    title(subplot_title,'FontSize', 14, 'FontName','Arial', 'Fontweight','normal');
    

end


