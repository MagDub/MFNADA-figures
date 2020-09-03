
function [] = render_sim(ybounds, increment, data_SH, data_LH, letter, subplot_title)

    part_num = 200;

    col = [0.803921580314636 0.878431379795074 0.968627452850342];

    h(1) = bar([0],data_SH(1,1),'FaceColor',col, 'FaceAlpha', 0.2, 'BarWidth',0.9); hold on;
    errorbar([0],data_SH(1,1),data_SH(1,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;

    h(2) = bar([1],data_LH(1,1),'FaceColor',col, 'FaceAlpha', 1, 'BarWidth',0.9); hold on;
    errorbar([1],data_LH(1,1),data_LH(1,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;

    h(3) = bar([3],data_SH(2,1),'FaceColor',col, 'FaceAlpha', 0.2, 'BarWidth',0.9); hold on;
    errorbar([3],data_SH(2,1),data_SH(2,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;

    h(4) = bar([4],data_LH(2,1),'FaceColor',col, 'FaceAlpha', 1, 'BarWidth',0.9); hold on;
    errorbar([4],data_LH(2,1),data_LH(2,2)*sqrt(part_num),'.','color','k', 'LineWidth',0.8); hold on;

    leg1 = legend(h(1:2), 'Short horizon', 'Long horizon');
    set(leg1,'Location','NorthEast');
    legend boxoff;
    
    if strcmp(subplot_title, 'Consistency')
        ylabel({'Proportion of','same choices [%]'}','FontName','Arial','Fontweight','bold','FontSize',12);
    else
        ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    end
    
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

    xlim([-1 5])
    xticks([0.5 3.5])
    xticklabels({'Low exploration','High exploration'});
    set(gca,'box','off')
  
    % Number and title
    text(0-0.2, 1+0.2,letter,'Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    title(subplot_title,'FontSize', 18, 'FontName','Arial', 'Fontweight','normal');
    

end


