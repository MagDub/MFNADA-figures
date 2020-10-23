
function [] = render_high_value(ybounds, increment, signif, hight_signif)

    
    col=[];

    %% Data
    load('../data_for_figs/chosenOption.mat')

    exploit_SH_perc = (chosenOption.ABD.freq(:,1)+chosenOption.AB.freq(:,1)+chosenOption.BD.freq(:,1)+chosenOption.AD.freq(:,1))/4*100;
    exploit_LH_perc = (chosenOption.ABD.freq(:,4)+chosenOption.AB.freq(:,4)+chosenOption.BD.freq(:,4)+chosenOption.AD.freq(:,4))/4*100;

    %% Save
    high_value_SH = exploit_SH_perc;
    high_value_LH = exploit_LH_perc;

    save('../data_for_figs/high_value_SH.mat', 'high_value_SH');
    save('../data_for_figs/high_value_LH.mat', 'high_value_LH');

    %% Drugs
    load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
    idx_plc = find(drug_code(:,2)==0);
    idx_ami = find(drug_code(:,2)==1);
    idx_prop = find(drug_code(:,2)==2);

    % Remove 506
    exploit_SH_perc(6,1) = nan;
    exploit_LH_perc(6,1) = nan;
    exploit_SH_perc_sim(6,1) = nan;
    exploit_LH_perc_sim(6,1) = nan;
    numel_idx_ami = numel(idx_ami-1);

    %% Figure
    col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245];
    col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; 
    col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342];

    % data points
    col.plac(2,:) = [0.380392163991928 0.380392163991928 0.380392163991928];
    col.prop(2,:) = [0.784313750267029 0.588235300779343 0.388235300779343];
    col.ami(2,:) = [0.584313750267029 0.388235300779343 0.388235300779343];
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223];
    

    x_ax = 0.5:0.5:10;

    % Short horizon
    b0S= bar(x_ax(1),nanmean(exploit_SH_perc),'FaceColor',col.all(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5); hold on;
    b1S= bar(x_ax(4),nanmean(exploit_SH_perc(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5); 
    b2S = bar(x_ax(7),nanmean(exploit_SH_perc(idx_plc)),'FaceColor',col.plac(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
    b3S = bar(x_ax(10),nanmean(exploit_SH_perc(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
   

    % Short horizon data points
    plot(x_ax(1)*ones(1,size(exploit_SH_perc,1)), exploit_SH_perc','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',2); 
    plot(x_ax(4)*ones(1,size(exploit_SH_perc(idx_prop),1)), exploit_SH_perc(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2); 
    plot(x_ax(7)*ones(1,size(exploit_SH_perc(idx_plc),1)), exploit_SH_perc(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2); 
    plot(x_ax(10)*ones(1,size(exploit_SH_perc(idx_ami),1)), exploit_SH_perc(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2); 

    % Long horizon
    b0L= bar(x_ax(2),nanmean(exploit_LH_perc),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',.5); hold on;
    b1L = bar(x_ax(5),nanmean(exploit_LH_perc(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 1, 'BarWidth',.5);
    b2L = bar(x_ax(8),nanmean(exploit_LH_perc(idx_plc)),'FaceColor',col.plac(1,:),'FaceAlpha', 1, 'BarWidth',.5);
    b3L = bar(x_ax(11),nanmean(exploit_LH_perc(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 1, 'BarWidth',.5);

    % Long horizon data points
    plot(x_ax(2)*ones(1,size(exploit_LH_perc,1)), exploit_LH_perc','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',2); 
    plot(x_ax(5)*ones(1,size(exploit_LH_perc(idx_prop),1)), exploit_LH_perc(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2); 
    plot(x_ax(8)*ones(1,size(exploit_LH_perc(idx_plc),1)), exploit_LH_perc(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2); 
    plot(x_ax(11)*ones(1,size(exploit_LH_perc(idx_ami),1)), exploit_LH_perc(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2); 
    
    % Dashed line
    y_dashed = 0:10:100;
    plot(x_ax(3)*ones(size(y_dashed)),y_dashed,'k--', 'MarkerSize',2);

    % Line between data points
    for n = 1:size(exploit_SH_perc,1)
        lin1 = plot(x_ax(1:2),[exploit_SH_perc(n) exploit_LH_perc(n)]); hold on;
        lin1.Color = [col.all(2,:) 0.3]; % transparency
    end
    
    % Line between data points
    for n = 1:size(idx_prop,1)
        lin1 = plot(x_ax(4:5),[exploit_SH_perc(idx_prop(n)) exploit_LH_perc(idx_prop(n))]); hold on;
        lin1.Color = [col.prop(2,:) 0.3]; % transparency
    end

    for n = 1:size(idx_plc,1)
        lin2 = plot(x_ax(7:8),[exploit_SH_perc(idx_plc(n)) exploit_LH_perc(idx_plc(n))]); hold on;
        lin2.Color = [col.plac(2,:) 0.3]; % transparency
    end

    for n = 1:size(idx_ami,1)
        lin3 = plot(x_ax(10:11),[exploit_SH_perc(idx_ami(n)) exploit_LH_perc(idx_ami(n))]); hold on;
        lin3.Color = [col.ami(2,:) 0.3]; % transparency
    end

    h = errorbar(x_ax([1 2 4 5 7 8 10 11]),...
        [nanmean(exploit_SH_perc) nanmean(exploit_LH_perc) ...
        nanmean(exploit_SH_perc(idx_prop)) nanmean(exploit_LH_perc(idx_prop)) ...
        nanmean(exploit_SH_perc(idx_plc)) nanmean(exploit_LH_perc(idx_plc)) ...
        nanmean(exploit_SH_perc(idx_ami)) nanmean(exploit_LH_perc(idx_ami))], ...
        [nanstd(exploit_SH_perc)./sqrt(59) nanstd(exploit_LH_perc)./sqrt(59)...
        nanstd(exploit_SH_perc(idx_prop))./sqrt(numel(idx_prop)) nanstd(exploit_LH_perc(idx_prop))./sqrt(numel(idx_prop))...
        nanstd(exploit_SH_perc(idx_plc))./sqrt(numel(idx_plc)) nanstd(exploit_LH_perc(idx_plc))./sqrt(numel(idx_plc))...
        nanstd(exploit_SH_perc(idx_ami))./sqrt(numel_idx_ami) nanstd(exploit_LH_perc(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
    set(h,'Marker','none')

    legend([b2S b2L],{'Short horizon', 'Long horizon'}, 'Location','NorthEast');
    legend boxoff  
    
    signif_loc_hor = (x_ax([1])+x_ax([2]))/2;
    signif_loc(1,:) = (x_ax([4 7])+x_ax([5 8]))/2;
    signif_loc(2,:) = (x_ax([4 10])+x_ax([5 11]))/2;
    signif_loc(3,:) = (x_ax([4 10])+x_ax([5 11]))/2;
    
    plot(x_ax([1,2]),[1;1]*hight_signif(1),'-k', 'LineWidth',3);
    th = text(mean(x_ax([1,2])), hight_signif(1)+4, signif{1},'FontSize', 19, 'FontName','Arial', 'Fontweight','normal');
    set(th,'visible','on','HorizontalAlignment','center');
  
        
%     % Significance
%     for i_ = 1:2
%         plot(signif_loc(i_,:),[1;1]*hight_signif(i_+1),'-k', 'LineWidth',1.5);
%         th = text(mean(signif_loc(i_,:)), hight_signif(i_+1), signif{i_+1},'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
%         set(th,'visible','on','HorizontalAlignment','center');
%     end
%     
%     plot(signif_loc(3,:),[1;1]*hight_signif(4),'-k', 'LineWidth',3);
%     th = text(mean(signif_loc(3,:)), hight_signif(4), signif{4},'FontSize', 20, 'FontName','Arial', 'Fontweight','normal');
%     set(th,'visible','on','HorizontalAlignment','center');
    
    % Number and title
    text(0-0.2, 1+0.2,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)     
    t=title('High-value bandit','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

    xlim([0 6])   
    set(gca,'XTick',[0.75 2.25 3.75 5.25])
    set(gca,'XTickLabel',{'All', 'Propranolol','Placebo', 'Amisulpride'})
    set(gca,'box','off')

    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

end


