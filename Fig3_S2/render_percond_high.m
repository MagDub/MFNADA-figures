function [] = render_percond_high(ybounds, increment)
  
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_AB_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_AB_LH.mat')
    pickedhigh_AB_mean = (pickedhigh_AB_SH + pickedhigh_AB_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_ABD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_ABD_LH.mat')
    pickedhigh_ABD_mean = (pickedhigh_ABD_SH + pickedhigh_ABD_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_AD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_AD_LH.mat')
    pickedhigh_AD_mean = (pickedhigh_AD_SH + pickedhigh_AD_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_BD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedhigh_BD_LH.mat')
    pickedhigh_BD_mean = (pickedhigh_BD_SH + pickedhigh_BD_LH)/2;

    % Remove ID
    pickedhigh_AB_mean(6,:) = nan;
    pickedhigh_ABD_mean(6,:) = nan;
    pickedhigh_AD_mean(6,:) = nan;
    pickedhigh_BD_mean(6,:) = nan;
    numel_n = 60;

    noise_plot = (rand(4,numel_n,1)-0.5)/5;

    % Figure
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

    x_ax = 0:0.4:8;

    % SH
    b1= bar(x_ax(3),nanmean(pickedhigh_AB_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;
    b2 = bar(x_ax(6),nanmean(pickedhigh_ABD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);
    b3= bar(x_ax(9),nanmean(pickedhigh_AD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); 
    b4 = bar(x_ax(12),nanmean(pickedhigh_BD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

    % data points
    plot(x_ax(3)*ones(1,size(pickedhigh_AB_mean,1))+noise_plot(1,:)', pickedhigh_AB_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(6)*ones(1,size(pickedhigh_ABD_mean,1))+noise_plot(2,:)', pickedhigh_ABD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 
    plot(x_ax(9)*ones(1,size(pickedhigh_AD_mean,1))+noise_plot(3,:)', pickedhigh_AD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(12)*ones(1,size(pickedhigh_BD_mean,1))+noise_plot(4,:)', pickedhigh_BD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 

    h = errorbar(x_ax([3 6 9 12]),...
        [nanmean(pickedhigh_AB_mean) nanmean(pickedhigh_ABD_mean) nanmean(pickedhigh_AD_mean) nanmean(pickedhigh_BD_mean)], ...
        [nanstd(pickedhigh_AB_mean)./sqrt(numel_n-1) nanstd(pickedhigh_ABD_mean)./sqrt(numel_n-1) nanstd(pickedhigh_AD_mean)./sqrt(numel_n-1) nanstd(pickedhigh_BD_mean)./sqrt(numel_n-1)],'.','color','k');

    set(h,'Marker','none')

    xlim([0 2.8*2])   
    set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9) x_ax(12)])

    labels = {strcat('[certain-standard, \newline',32,32,'standard, novel]'), strcat('[certain-standard, \newline',32,32,32,32,32,32, 'standard, low]'), strcat('[certain-standard, \newline',32,32,32,32,32,32,32,32,32,32,32,32,'novel, low]'), strcat('[standard, \newline','novel, low]')};
    xtickangle(45)
    
    a = gca;
    a.XTickLabel = labels;

    
    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)
    
    set(gca,'box','off')
    
%     % Significance
%     th = text(mean(x_ax([6])), hight_signif(1), signif{1},'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
%     set(th,'visible','on','HorizontalAlignment','center');
%     
%     th = text(mean(x_ax([12])), hight_signif(2), signif{2},'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
%     set(th,'visible','on','HorizontalAlignment','center');

    % Number and title
    text(0-0.2, 1+0.2,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('High-value bandit','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

