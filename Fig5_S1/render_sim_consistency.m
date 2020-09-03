
function [] = render_sim_consistency(ybounds, increment)

    
    load('../data_for_figs/consistency_freq_simulation_1Norm.mat') % from run_make_consistency_from_sim
    consist_SH = consistency_freq_simulation_1Norm(:,2)*100;
    consist_LH = consistency_freq_simulation_1Norm(:,1)*100;

    %% Drugs
    load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
    idx_plc = find(drug_code(:,2)==0);
    idx_ami = find(drug_code(:,2)==1);
    idx_prop = find(drug_code(:,2)==2);

    % Remove 506
    consist_SH(6,1) = nan;
    consist_LH(6,1) = nan;
    consist_SH_nosim(6,1) = nan;
    consist_LH_nosim(6,1) = nan;
    numel_idx_ami = numel(idx_ami-1);

    %% Figure
    col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245];
    col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; 
    col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 

    % data points
    col.plac(2,:) = [0.380392163991928 0.380392163991928 0.380392163991928];
    col.prop(2,:) = [0.784313750267029 0.588235300779343 0.388235300779343];
    col.ami(2,:) = [0.584313750267029 0.388235300779343 0.388235300779343];

    % sim
    col_sim = [0.39215686917305 0.474509805440903 0.635294139385223];  %[0 0.447058826684952 0.74117648601532] %[0.39215686917305 0.474509805440903 0.635294139385223]; 
    col_sim_inside = [0.729411780834198 0.831372559070587 0.95686274766922];

    x_ax = 0.5:0.5:4;

    % Short horizon
    b1S= bar(x_ax(1),nanmean(consist_SH(idx_prop)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5); hold on;
    b2S = bar(x_ax(4),nanmean(consist_SH(idx_plc)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5);
    b3S = bar(x_ax(7),nanmean(consist_SH(idx_ami)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5);

    % Short horizon data points
    plot(x_ax(1)*ones(1,size(consist_SH(idx_prop),1)), consist_SH(idx_prop)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
    plot(x_ax(4)*ones(1,size(consist_SH(idx_plc),1)), consist_SH(idx_plc)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
    plot(x_ax(7)*ones(1,size(consist_SH(idx_ami),1)), consist_SH(idx_ami)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 

    % Long horizon
    b1L = bar(x_ax(2),nanmean(consist_LH(idx_prop)),'FaceColor',col_sim, 'FaceAlpha', 0.35, 'BarWidth',.5);
    b2L = bar(x_ax(5),nanmean(consist_LH(idx_plc)),'FaceColor',col_sim,'FaceAlpha', 0.35, 'BarWidth',.5);
    b3L = bar(x_ax(8),nanmean(consist_LH(idx_ami)),'FaceColor',col_sim, 'FaceAlpha', 0.35, 'BarWidth',.5);

    % Long horizon data points
    plot(x_ax(2)*ones(1,size(consist_LH(idx_prop),1)), consist_LH(idx_prop)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
    plot(x_ax(5)*ones(1,size(consist_LH(idx_plc),1)), consist_LH(idx_plc)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
    plot(x_ax(8)*ones(1,size(consist_LH(idx_ami),1)), consist_LH(idx_ami)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 

    % Line between data points
    for n = 1:size(idx_prop,1)
        lin1 = plot(x_ax(1:2),[consist_SH(idx_prop(n)) consist_LH(idx_prop(n))]); hold on;
        lin1.Color = [col_sim 0.3]; % transparency
    end

    for n = 1:size(idx_plc,1)
        lin2 = plot(x_ax(4:5),[consist_SH(idx_plc(n)) consist_LH(idx_plc(n))]); hold on;
        lin2.Color = [col_sim 0.3]; % transparency
    end

    for n = 1:size(idx_ami,1)
        lin3 = plot(x_ax(7:8),[consist_SH(idx_ami(n)) consist_LH(idx_ami(n))]); hold on;
        lin3.Color = [col_sim 0.3]; % transparency
    end

    h = errorbar(x_ax([1 2 4 5 7 8]),...
        [nanmean(consist_SH(idx_prop)) nanmean(consist_LH(idx_prop)) ...
        nanmean(consist_SH(idx_plc)) nanmean(consist_LH(idx_plc)) ...
        nanmean(consist_SH(idx_ami)) nanmean(consist_LH(idx_ami))], ...
        [nanstd(consist_SH(idx_prop))./sqrt(numel(idx_prop)) nanstd(consist_LH(idx_prop))./sqrt(numel(idx_prop))...
        nanstd(consist_SH(idx_plc))./sqrt(numel(idx_plc)) nanstd(consist_LH(idx_plc))./sqrt(numel(idx_plc))...
        nanstd(consist_SH(idx_ami))./sqrt(numel_idx_ami) nanstd(consist_LH(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
    set(h,'Marker','none')

    legend([b2S b2L],{'Short horizon', 'Long horizon'}, 'Location','NorthEast');
    legend boxoff  
    
    % Number and title
    text(0-0.2, 1+0.2,'d','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)     
    t=title('Consistency','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

    xlim([0 4.5])   
    set(gca,'XTick',[0.75 2.25 3.75])
    set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})
    set(gca,'box','off')

    ylabel({'Proportion of','same choices [%]'}','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

end


