function [] = render_percond_low(ybounds, increment)
  
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_AB_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_AB_LH.mat')
    pickedlow_AB_mean = (pickedlow_AB_SH + pickedlow_AB_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_ABD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_ABD_LH.mat')
    pickedlow_ABD_mean = (pickedlow_ABD_SH + pickedlow_ABD_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_AD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_AD_LH.mat')
    pickedlow_AD_mean = (pickedlow_AD_SH + pickedlow_AD_LH)/2;

    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_BD_SH.mat')
    load('../../MFNADA-Modeling/percondition/6_makeBehavFig/frequencies/pickedlow_BD_LH.mat')
    pickedlow_BD_mean = (pickedlow_BD_SH + pickedlow_BD_LH)/2;

    % Remove ID
    pickedlow_AB_mean(6,:) = nan;
    pickedlow_ABD_mean(6,:) = nan;
    pickedlow_AD_mean(6,:) = nan;
    pickedlow_BD_mean(6,:) = nan;
    numel_n = 60;

    noise_plot = (rand(4,numel_n,1)-0.5)/5;

    % Figure
    col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

    x_ax = 0:0.4:8;

    % SH
    b1= bar(x_ax(3),nanmean(pickedlow_AB_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); hold on;
    b2 = bar(x_ax(6),nanmean(pickedlow_ABD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);
    b3= bar(x_ax(9),nanmean(pickedlow_AD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); 
    b4 = bar(x_ax(12),nanmean(pickedlow_BD_mean),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

    % data points
    plot(x_ax(3)*ones(1,numel_n)+noise_plot(1,:)', pickedlow_AB_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(6)*ones(1,numel_n)+noise_plot(2,:)', pickedlow_ABD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 
    plot(x_ax(9)*ones(1,numel_n)+noise_plot(3,:)', pickedlow_AD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);
    plot(x_ax(12)*ones(1,numel_n)+noise_plot(4,:)', pickedlow_BD_mean','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3); 

    h = errorbar(x_ax([3 6 9 12]),...
        [nanmean(pickedlow_AB_mean) nanmean(pickedlow_ABD_mean) nanmean(pickedlow_AD_mean) nanmean(pickedlow_BD_mean)], ...
        [nanstd(pickedlow_AB_mean)./sqrt(numel_n-1) nanstd(pickedlow_ABD_mean)./sqrt(numel_n-1) nanstd(pickedlow_AD_mean)./sqrt(numel_n-1) nanstd(pickedlow_BD_mean)./sqrt(numel_n-1)],'.','color','k');

    set(h,'Marker','none')

    xlim([0 2.8*2])   
    set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9) x_ax(12)])

    labels = {strcat(''), strcat('[certain-standard, \newline',32,32,32,32,32,32, 'standard, low]'), strcat('[certain-standard, \newline',32,32,32,32,32,32,32,32,32,32,32,32,'novel, low]'), strcat('[standard, \newline','novel, low]')};
    xtickangle(45)

    a = gca;
    a.XTickLabel = labels;

    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:2:100)
    ylim([0 6.2])
    
    set(gca,'box','off')

    set(gca,'YTick',0:increment:100)
    ylim(ybounds)
    
    % Number and title
    text(0-0.2, 1+0.2,'c','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Low-value bandit','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

