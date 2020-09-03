
%% Data
load('../data_for_figs/model_parameters_Q0uni.mat')
nov_SH = model_parameters_Q0uni(:,6);
nov_LH = model_parameters_Q0uni(:,7);

%% Save
save('../data_for_figs/nov_SH.mat', 'nov_SH');
save('../data_for_figs/nov_LH.mat', 'nov_LH');

%% Drugs
load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
idx_plc = find(drug_code(:,2)==0);
idx_ami = find(drug_code(:,2)==1);
idx_prop = find(drug_code(:,2)==2);

% Remove 506
nov_SH(6,1) = nan;
nov_LH(6,1) = nan;
numel_idx_ami = numel(idx_ami-1);

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245];
col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; 
col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; 

% data points
col.plac(2,:) = [0.380392163991928 0.380392163991928 0.380392163991928];
col.prop(2,:) = [0.784313750267029 0.588235300779343 0.388235300779343];
col.ami(2,:) = [0.584313750267029 0.388235300779343 0.388235300779343];

x_ax = 0.5:0.5:4;

% Short Horizon
b1S= bar(x_ax(1),nanmean(nov_SH(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5); 
b2S = bar(x_ax(4),nanmean(nov_SH(idx_plc)),'FaceColor',col.plac(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
b3S = bar(x_ax(7),nanmean(nov_SH(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);

% Short Horizon data points
plot(x_ax(1)*ones(1,size(nov_SH(idx_prop),1)), nov_SH(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2);
plot(x_ax(4)*ones(1,size(nov_SH(idx_plc),1)), nov_SH(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2);
plot(x_ax(7)*ones(1,size(nov_SH(idx_ami),1)), nov_SH(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2);

% Long Horizon
b1L = bar(x_ax(2),nanmean(nov_LH(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 1, 'BarWidth',.5);
b2L = bar(x_ax(5),nanmean(nov_LH(idx_plc)),'FaceColor',col.plac(1,:),'FaceAlpha', 1, 'BarWidth',.5);
b3L = bar(x_ax(8),nanmean(nov_LH(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 1, 'BarWidth',.5);

% Long Horizon data points
plot(x_ax(2)*ones(1,size(nov_LH(idx_prop),1)), nov_LH(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2);
plot(x_ax(5)*ones(1,size(nov_LH(idx_plc),1)), nov_LH(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2);
plot(x_ax(8)*ones(1,size(nov_LH(idx_ami),1)), nov_LH(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2);


% Line between data points
for n = 1:size(idx_prop,1)
    lin1 = plot(x_ax(1:2),[nov_SH(idx_prop(n)) nov_LH(idx_prop(n))]); hold on;
    lin1.Color = [col.prop(2,:) 0.3]; % transparency
end

for n = 1:size(idx_plc,1)
    lin2 = plot(x_ax(4:5),[nov_SH(idx_plc(n)) nov_LH(idx_plc(n))]); hold on;
    lin2.Color = [col.plac(2,:) 0.3]; % transparency
end

for n = 1:size(idx_ami,1)
    lin3 = plot(x_ax(7:8),[nov_SH(idx_ami(n)) nov_LH(idx_ami(n))]); hold on;
    lin3.Color = [col.ami(2,:) 0.3]; % transparency
end

h = errorbar(x_ax([1 2 4 5 7 8]),...
    [nanmean(nov_SH(idx_prop)) nanmean(nov_LH(idx_prop)) ...
    nanmean(nov_SH(idx_plc)) nanmean(nov_LH(idx_plc)) ...
    nanmean(nov_SH(idx_ami)) nanmean(nov_LH(idx_ami))], ...
    [nanstd(nov_SH(idx_prop))./sqrt(numel(idx_prop)) nanstd(nov_LH(idx_prop))./sqrt(numel(idx_prop))...
    nanstd(nov_SH(idx_plc))./sqrt(numel(idx_plc)) nanstd(nov_LH(idx_plc))./sqrt(numel(idx_plc))...
    nanstd(nov_SH(idx_ami))./sqrt(numel_idx_ami) nanstd(nov_LH(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
set(h,'Marker','none')

legend([b2S b2L],{'Short horizon', 'Long horizon'}, 'Position',[0.168872814262118 0.81087418498448 0.339778999597328 0.121052628441861]);
legend boxoff  

xlim([0 4.5])   
set(gca,'XTick',[0.75 2.25 3.75])
set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})

ylabel('Best-fit parameter value','FontName','Arial','Fontweight','bold','FontSize',12,'Interpreter','tex');
set(gca,'YTick',0:1.5:10)
ylim([0 6.2])


%% Export
addpath('../../export_fig')
export_fig(['Fig_model_parameters_noveltybonus.tif'],'-nocrop','-r200')



