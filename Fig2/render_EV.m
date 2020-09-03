function [] = render_EV(ybounds, increment, signif, hight_signif)

    load('../data_for_figs/EV_SH_mat_all.mat')
    load('../data_for_figs/EV_LH_mat_all.mat')

    numel_n = 59;

    %% Figure
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

    x_ax = 0:0.4:4;

    % SH
    b1S= bar(x_ax(3),nanmean(EV_SH_mat_all),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;

    % data points
    plot(x_ax(3)*ones(1,size(EV_SH_mat_all,1)), EV_SH_mat_all','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); hold on;

    % first LH
    b1Lf = bar(x_ax(6),nanmean(EV_LH_mat_all),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;

    % data points
    plot(x_ax(6)*ones(1,size(EV_LH_mat_all,1)), EV_LH_mat_all','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); hold on;

    for n = 1:size(EV_LH_mat_all,2)
        lin2 = plot(x_ax([3 6]),[EV_SH_mat_all(n) EV_LH_mat_all(n)]); hold on;
        lin2.Color = [col.all(2,:) 0.3]; % transparency
    end

    h = errorbar(x_ax([3 6]),...
        [nanmean(EV_SH_mat_all) nanmean(EV_LH_mat_all)], ...
        [nanstd(EV_SH_mat_all)./sqrt(numel_n) nanstd(EV_LH_mat_all)./sqrt(numel_n)],'.','color','k'); hold on;
    
    set(h,'Marker','none')

    labels = {'Short horizon', 'Long horizon'};

    a = gca;
    a.XTickLabel = labels;
    
    % Significance
    plot(x_ax([3 6]),[1;1]*hight_signif,'-k', 'LineWidth',1.5);
    th = text(mean(x_ax([3 6])), hight_signif, signif,'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
    set(th,'visible','on','HorizontalAlignment','center');
    
    % Number and title
    text(0-0.2, 1+0.2,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Exploitation','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

    xlim([0 2.8])   
    set(gca,'XTick',[x_ax(3) x_ax(6)])    
    set(gca,'box','off')

    ylabel({'Expected value','of chosen bandit'}','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)


end

