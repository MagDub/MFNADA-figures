function [] = render_score_all_raw()

    data_for_figs_f = '../data_for_figs/';

    %% Data behaviour
    load(strcat(data_for_figs_f,'score_all_LH.mat'))
    load(strcat(data_for_figs_f,'score_all_LH_desc.mat'))
    
    load(strcat(data_for_figs_f,'score_SH.mat'))
    
    % remove 506
    score_SH(6,:) = nan;
    score_all_LH(6,:) = nan(1,6);
    n = size(score_all_LH,1)-1;

    %% Figure
    col(1,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % indiv lines
    col(2,:) = [0.20392157137394 0.301960796117783 0.494117647409439]; % mean

    plot([1:6], score_all_LH, 'Color',[col(1,:) 0.3]); hold on;

    plot([1:6],nanmean(score_all_LH,1),'LineWidth',3, 'Color',[col(2,:) 1]); hold on;

    errorbar([1:6],nanmean(score_all_LH),nanstd(score_all_LH)./sqrt(n),'.','color','k'); hold on;
    
    plot_sh = plot([1:6], nanmean(score_SH)*ones(1,6), 'color','k', 'LineWidth',1.5); hold on;
    
    errorbar(1,nanmean(score_SH),nanstd(score_SH)./sqrt(n),'.','color','k');
    
    legend(plot_sh,{'Short horizon score'}, 'Location','SouthEast','FontSize',11);
    legend boxoff 

    ylim([5.07 6.77])
    set(gca,'YTick',1:0.5:10)
    set(gca,'XTick',1:1:6)
    
    ylabel({'Reward'}','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('Draw')
    
    set(gca,'box','off')

    % Number and title
    text(0-0.2, 1+0.2,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Score','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

