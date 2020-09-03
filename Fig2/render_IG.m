function [] = render_IG(ybounds, increment, signif, hight_signif);

    %% Data
    load('../data_for_figs/behaviour.mat')
    load('../data_for_figs/behaviour_desc.mat')

    n_trials_SH = 200;
    n_trials_LH = 200;

    pickedA_LH_perc = behaviour(:,2)/n_trials_LH;
    pickedB_LH_perc = behaviour(:,3)/n_trials_LH;
    pickedC_LH_perc = behaviour(:,4)/n_trials_LH;
    pickedD_LH_perc = behaviour(:,5)/n_trials_LH;
    pickedA_SH_perc = behaviour(:,6)/n_trials_SH;
    pickedB_SH_perc = behaviour(:,7)/n_trials_SH;
    pickedC_SH_perc = behaviour(:,8)/n_trials_SH;
    pickedD_SH_perc = behaviour(:,9)/n_trials_SH;

    N_apples_of_selected_tree_SH=(pickedA_SH_perc*3+pickedB_SH_perc*1+pickedC_SH_perc*0+pickedD_SH_perc*1);
    N_apples_of_selected_tree_LH=(pickedA_LH_perc*3+pickedB_LH_perc*1+pickedC_LH_perc*0+pickedD_LH_perc*1);

    IG_SH = N_apples_of_selected_tree_SH;
    IG_LH = N_apples_of_selected_tree_LH;

    save('../data_for_figs/IG_SH.mat', 'IG_SH');
    save('../data_for_figs/IG_LH.mat', 'IG_LH');

    % Remove 506
    N_apples_of_selected_tree_SH(6,1) = nan;
    N_apples_of_selected_tree_LH(6,1) = nan;

    numel_n = size(N_apples_of_selected_tree_SH,1) - 1;

    %% Figure
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

    x_ax = 0:0.4:4;

    % SH
    b1S= bar(x_ax(3),nanmean(N_apples_of_selected_tree_SH),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;

    % data points
    plot(x_ax(3)*ones(1,size(N_apples_of_selected_tree_SH,1)), N_apples_of_selected_tree_SH','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);

    % first LH
    b1Lf = bar(x_ax(6),nanmean(N_apples_of_selected_tree_LH),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

    % data points
    plot(x_ax(6)*ones(1,size(N_apples_of_selected_tree_LH,1)), N_apples_of_selected_tree_LH','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 

    for n = 1:size(N_apples_of_selected_tree_LH,1)
        lin2 = plot(x_ax([3 6]),[N_apples_of_selected_tree_SH(n) N_apples_of_selected_tree_LH(n)]); hold on;
        lin2.Color = [col.all(2,:) 0.3]; % transparency
    end

    h = errorbar(x_ax([3 6]),...
        [nanmean(N_apples_of_selected_tree_SH) nanmean(N_apples_of_selected_tree_LH)], ...
        [nanstd(N_apples_of_selected_tree_SH)./sqrt(numel_n) nanstd(N_apples_of_selected_tree_LH)./sqrt(numel_n)],'.','color','k');


    set(h,'Marker','none')

    labels = {'Short horizon', 'Long horizon'};

    a = gca;
    a.XTickLabel = labels;
    
    % Significance
    plot(x_ax([3 6]),[1;1]*hight_signif,'-k', 'LineWidth',1.5);
    th = text(mean(x_ax([3 6])), hight_signif, signif,'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
    set(th,'visible','on','HorizontalAlignment','center');
    
    % Number and title
    text(0-0.2, 1+0.2,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Information seeking','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

    xlim([0 2.8])   
    set(gca,'XTick',[x_ax(3) x_ax(6)])    
    set(gca,'box','off')

    ylabel({'Number of initial','samples of chosen bandit'}','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)


end

