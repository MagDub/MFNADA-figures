function [] = render_per_gender_sgm0(ybounds, increment, signif, hight_signif, signif_1, hight_signif_1, signif_2, hight_signif_2)
     
    % Data
    load('../data_for_figs/model_parameters_Q0uni.mat')
    sgm0_SH = model_parameters_Q0uni(:,1);
    sgm0_LH = model_parameters_Q0uni(:,2);

    %% Remove 506
    sgm0_SH(6,1) = nan;
    sgm0_LH(6,1) = nan;

    %% Compute mean
    sgm0_mean = (sgm0_SH + sgm0_LH)/2;

    %% Drugs and Gender
    load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol

    idx_plc_female = find(drug_code(1:30,2)==0);
    idx_ami_female = find(drug_code(1:30,2)==1);
    idx_prop_female = find(drug_code(1:30,2)==2);

    idx_plc = find(drug_code(:,2)==0);
    idx_ami = find(drug_code(:,2)==1);
    idx_prop = find(drug_code(:,2)==2);

    n_idx_plc_male = find(idx_plc>30);
    n_idx_ami_male = find(idx_ami>30);
    n_idx_prop_male = find(idx_prop>30);

    idx_plc_male = idx_plc(n_idx_plc_male(1):end);
    idx_ami_male = idx_ami(n_idx_ami_male(1):end);
    idx_prop_male = idx_prop(n_idx_prop_male(1):end);



    %% Figure
    figure('Color','w');
    set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
    set(gca,'FontName','Arial','FontSize',10)
    hold on

    n = size(sgm0_mean(idx_prop_female));
    noise_plot = (rand(n)-0.5)/5;

    col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245];
    col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; 
    col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 

    % data points
    col.plac(2,:) = [0.380392163991928 0.380392163991928 0.380392163991928];
    col.prop(2,:) = [0.784313750267029 0.588235300779343 0.388235300779343];
    col.ami(2,:) = [0.584313750267029 0.388235300779343 0.388235300779343];

    x_ax = 0.5:0.5:4;

    % x_ax([2,5,8])=x_ax([2,5,8])+0.15;

    % Female
    b1S= bar(x_ax(1),nanmean(sgm0_mean(idx_prop_female)),'FaceColor',col.prop(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5); 
    b2S = bar(x_ax(4),nanmean(sgm0_mean(idx_plc_female)),'FaceColor',col.plac(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
    b3S = bar(x_ax(7),nanmean(sgm0_mean(idx_ami_female)),'FaceColor',col.ami(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);

    % Female data points
    plot(x_ax(1)*ones(1,size(sgm0_mean(idx_prop_female),1))+noise_plot', sgm0_mean(idx_prop_female)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',6);
    plot(x_ax(4)*ones(1,size(sgm0_mean(idx_plc_female),1))+noise_plot', sgm0_mean(idx_plc_female)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',6);
    plot(x_ax(7)*ones(1,size(sgm0_mean(idx_ami_female),1))+noise_plot', sgm0_mean(idx_ami_female)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',6);

    % Male
    b1L = bar(x_ax(2),nanmean(sgm0_mean(idx_prop_male)),'FaceColor',col.prop(1,:), 'FaceAlpha', 1, 'BarWidth',.5);
    b2L = bar(x_ax(5),nanmean(sgm0_mean(idx_plc_male)),'FaceColor',col.plac(1,:),'FaceAlpha', 1, 'BarWidth',.5);
    b3L = bar(x_ax(8),nanmean(sgm0_mean(idx_ami_male)),'FaceColor',col.ami(1,:), 'FaceAlpha', 1, 'BarWidth',.5);

    % Male data points
    plot(x_ax(2)*ones(1,size(sgm0_mean(idx_prop_male),1))+noise_plot', sgm0_mean(idx_prop_male)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',6);
    plot(x_ax(5)*ones(1,size(sgm0_mean(idx_plc_male),1))+noise_plot', sgm0_mean(idx_plc_male)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',6);
    plot(x_ax(8)*ones(1,size(sgm0_mean(idx_ami_male),1))+noise_plot', sgm0_mean(idx_ami_male)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',6);

    h = errorbar(x_ax([1 2 4 5 7 8]),...
        [nanmean(sgm0_mean(idx_prop_female)) nanmean(sgm0_mean(idx_prop_male)) ...
        nanmean(sgm0_mean(idx_plc_female)) nanmean(sgm0_mean(idx_plc_male)) ...
        nanmean(sgm0_mean(idx_ami_female)) nanmean(sgm0_mean(idx_ami_male))], ...
        [nanstd(sgm0_mean(idx_prop_female))./sqrt(numel(idx_prop_female)) nanstd(sgm0_mean(idx_prop_male))./sqrt(numel(idx_prop_male))...
        nanstd(sgm0_mean(idx_plc_female))./sqrt(numel(idx_plc_female)) nanstd(sgm0_mean(idx_plc_male))./sqrt(numel(idx_plc_male))...
        nanstd(sgm0_mean(idx_ami_female))./sqrt(numel(idx_ami_female)-1) nanstd(sgm0_mean(idx_ami_male))./sqrt(numel(idx_ami_male))],'.','color','k');
    set(h,'Marker','none')

    legend([b2S b2L],{'Female', 'Male'},'Location','northwest')

    xlim([0 x_ax(8)+0.5])   
    set(gca,'XTick',[0.75 2.25 3.75])
    set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})
    
    set(gca,'box','off')
    
    % Significance
    mid_2 = (x_ax(4)+x_ax(5))/2;
    mid_3 = (x_ax(7)+x_ax(8))/2;
    plot([mid_2 mid_3],[1;1]*hight_signif+[-0.3; +0.1],'-k', 'LineWidth',1.5);
    plot([mid_2 mid_3],[1;1]*hight_signif+[+0.1; -0.3],'-k', 'LineWidth',1.5);
    th = text(mean([mid_2 mid_3]), hight_signif, signif,'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
    set(th,'visible','on','HorizontalAlignment','center');
    th_2 = text(mid_2, hight_signif_1, signif_1,'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
    th_3 = text(mid_3, hight_signif_2, signif_2,'FontSize', 17, 'FontName','Arial', 'Fontweight','normal');
    set(th_2,'visible','on','HorizontalAlignment','center');
    set(th_3,'visible','on','HorizontalAlignment','center');

    % Number and title
    title(['\fontsize{18} Prior variance{\fontsize{22} \sigma}_0'],'interpreter','tex','Fontweight','normal','FontName','Arial');

    xlim([0 4.5])   
    set(gca,'XTick',[0.75 2.25 3.75])
    set(gca,'XTickLabel',{'Propranolol','Placebo', 'Amisulpride'})
    set(gca,'box','off')

    ylabel('Best-fit parameter value','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)


end

