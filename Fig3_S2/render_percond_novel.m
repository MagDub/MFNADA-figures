function [] = render_percond_novel(ybounds, increment)
  
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_AB_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_AB_LH.mat')
    pickednovel_AB_mean = (pickednovel_AB_SH + pickednovel_AB_LH)/2;

    pickednovel_ABD_mean = zeros(60,1);

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_AD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_AD_LH.mat')
    pickednovel_AD_mean = (pickednovel_AD_SH + pickednovel_AD_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_BD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickednovel_BD_LH.mat')
    pickednovel_BD_mean = (pickednovel_BD_SH + pickednovel_BD_LH)/2;

    % Remove ID
    pickednovel_AB_mean(6,:) = nan;
    pickednovel_ABD_mean(6,:) = nan;
    pickednovel_AD_mean(6,:) = nan;
    pickednovel_BD_mean(6,:) = nan;
    numel_n = 60;

    noise_plot = (rand(4,numel_n,1)-0.5)/5;

    % Figure
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

    x_ax = 0:0.4:8;

    % SH
    b1= bar(x_ax(3),nanmean(pickednovel_AB_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;
    b2 = bar(x_ax(6),nanmean(pickednovel_ABD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);
    b3= bar(x_ax(9),nanmean(pickednovel_AD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); 
    b4 = bar(x_ax(12),nanmean(pickednovel_BD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

    % data points
    plot(x_ax(3)*ones(1,numel_n)+noise_plot(1,:)', pickednovel_AB_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(6)*ones(1,numel_n)+noise_plot(2,:)', pickednovel_ABD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 
    plot(x_ax(9)*ones(1,numel_n)+noise_plot(3,:)', pickednovel_AD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(12)*ones(1,numel_n)+noise_plot(4,:)', pickednovel_BD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 

    h = errorbar(x_ax([3 6 9 12]),...
        [nanmean(pickednovel_AB_mean) nanmean(pickednovel_ABD_mean) nanmean(pickednovel_AD_mean) nanmean(pickednovel_BD_mean)], ...
        [nanstd(pickednovel_AB_mean)./sqrt(numel_n-1) nanstd(pickednovel_ABD_mean)./sqrt(numel_n-1) nanstd(pickednovel_AD_mean)./sqrt(numel_n-1) nanstd(pickednovel_BD_mean)./sqrt(numel_n-1)],'.','color','k');

    set(h,'Marker','none')

    xlim([0 2.8*2])   
    set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9) x_ax(12)])

    labels = {'No low-value', 'No novel', 'No standard', 'No certain-standard'};
    xtickangle(45)

    a = gca;
    a.XTickLabel = labels;

    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    
    set(gca,'box','off')

    set(gca,'YTick',0:increment:100)
    ylim(ybounds)
    
    % Number and title
    text(0-0.2, 1+0.2,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Novel bandit','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

