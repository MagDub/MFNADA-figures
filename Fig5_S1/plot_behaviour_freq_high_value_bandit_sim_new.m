
%% Data

load('../data_for_figs/sim_prob_choosing_exploit_trees_new_data.mat')
load('../data_for_figs/sim_prob_choosing_exploit_trees_new_data_desc.mat')

exploit_SH_perc = sim_prob_choosing_exploit_trees_new_data(:,1)*100;
exploit_LH_perc = sim_prob_choosing_exploit_trees_new_data(:,5)*100;

%% Drugs
load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
idx_plc = find(drug_code(:,2)==0);
idx_ami = find(drug_code(:,2)==1);
idx_prop = find(drug_code(:,2)==2);

% Remove 506
exploit_SH_perc(6,1) = nan;
exploit_LH_perc(6,1) = nan;
exploit_SH_perc_nosim(6,1) = nan;
exploit_LH_perc_nosim(6,1) = nan;
numel_idx_ami = numel(idx_ami-1);

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245];
col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; 
col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 

% sim
col_sim = [0.39215686917305 0.474509805440903 0.635294139385223];  %[0 0.447058826684952 0.74117648601532] %[0.39215686917305 0.474509805440903 0.635294139385223]; 
col_sim_inside = [0.729411780834198 0.831372559070587 0.95686274766922];

x_ax = 0.5:0.5:4;

% Short horizon
b1S= bar(x_ax(1),nanmean(exploit_SH_perc(idx_prop)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5); 
b2S = bar(x_ax(4),nanmean(exploit_SH_perc(idx_plc)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5);
b3S = bar(x_ax(7),nanmean(exploit_SH_perc(idx_ami)),'FaceColor',col_sim, 'FaceAlpha', 0.05, 'BarWidth',.5);

% Short horizon data points
plot(x_ax(1)*ones(1,size(exploit_SH_perc(idx_prop),1)), exploit_SH_perc(idx_prop)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
plot(x_ax(4)*ones(1,size(exploit_SH_perc(idx_plc),1)), exploit_SH_perc(idx_plc)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
plot(x_ax(7)*ones(1,size(exploit_SH_perc(idx_ami),1)), exploit_SH_perc(idx_ami)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 

% Long horizon
b1L = bar(x_ax(2),nanmean(exploit_LH_perc(idx_prop)),'FaceColor',col_sim, 'FaceAlpha', 0.35, 'BarWidth',.5);
b2L = bar(x_ax(5),nanmean(exploit_LH_perc(idx_plc)),'FaceColor',col_sim,'FaceAlpha', 0.35, 'BarWidth',.5);
b3L = bar(x_ax(8),nanmean(exploit_LH_perc(idx_ami)),'FaceColor',col_sim, 'FaceAlpha', 0.35, 'BarWidth',.5);

% Long horizon data points
plot(x_ax(2)*ones(1,size(exploit_LH_perc(idx_prop),1)), exploit_LH_perc(idx_prop)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
plot(x_ax(5)*ones(1,size(exploit_LH_perc(idx_plc),1)), exploit_LH_perc(idx_plc)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 
plot(x_ax(8)*ones(1,size(exploit_LH_perc(idx_ami),1)), exploit_LH_perc(idx_ami)','.','MarkerEdgeColor',col_sim_inside, 'MarkerSize',2); 

% Line between data points
for n = 1:size(idx_prop,1)
    lin1 = plot(x_ax(1:2),[exploit_SH_perc(idx_prop(n)) exploit_LH_perc(idx_prop(n))]); hold on;
    lin1.Color = [col_sim 0.3]; % transparency
end

for n = 1:size(idx_plc,1)
    lin2 = plot(x_ax(4:5),[exploit_SH_perc(idx_plc(n)) exploit_LH_perc(idx_plc(n))]); hold on;
    lin2.Color = [col_sim 0.3]; % transparency
end

for n = 1:size(idx_ami,1)
    lin3 = plot(x_ax(7:8),[exploit_SH_perc(idx_ami(n)) exploit_LH_perc(idx_ami(n))]); hold on;
    lin3.Color = [col_sim 0.3]; % transparency
end

h = errorbar(x_ax([1 2 4 5 7 8]),...
    [nanmean(exploit_SH_perc(idx_prop)) nanmean(exploit_LH_perc(idx_prop)) ...
    nanmean(exploit_SH_perc(idx_plc)) nanmean(exploit_LH_perc(idx_plc)) ...
    nanmean(exploit_SH_perc(idx_ami)) nanmean(exploit_LH_perc(idx_ami))], ...
    [nanstd(exploit_SH_perc(idx_prop))./sqrt(numel(idx_prop)) nanstd(exploit_LH_perc(idx_prop))./sqrt(numel(idx_prop))...
    nanstd(exploit_SH_perc(idx_plc))./sqrt(numel(idx_plc)) nanstd(exploit_LH_perc(idx_plc))./sqrt(numel(idx_plc))...
    nanstd(exploit_SH_perc(idx_ami))./sqrt(numel_idx_ami) nanstd(exploit_LH_perc(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
set(h,'Marker','none')

legend([b2S b2L],{'Short horizon', 'Long horizon'}, 'Position',[0.155060659565985 0.810874177821108 0.339778999597328 0.121052628441861]);
legend boxoff   

xlim([0 4.5])   
set(gca,'XTick',[0.75 2.25 3.75])
set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})

ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
set(gca,'YTick',0:20:100)
ylim([0 93])


%% Export
addpath('../../export_fig')
export_fig(['Fig_sim_high_value_bandit.tif'],'-nocrop','-r200')


