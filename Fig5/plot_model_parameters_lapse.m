
%% Data
load('../data_for_figs/model_parameters_Q0uni.mat')
xi_SH = model_parameters_Q0uni(:,4);
xi_LH = model_parameters_Q0uni(:,5);

%% Drugs
load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
idx_plc = find(drug_code(:,2)==0);
idx_ami = find(drug_code(:,2)==1);
idx_prop = find(drug_code(:,2)==2);

% Remove 506
xi_SH(6,1) = nan;
xi_LH(6,1) = nan;
numel_idx_ami = numel(idx_ami-1);

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

col.plac(1,:) = [0.862745106220245 0.862745106220245 0.862745106220245]; % SH
col.prop(1,:) = [0.952941179275513 0.87058824300766 0.733333349227905]; % SH
col.ami(1,:) = [0.925490200519562 0.839215695858002 0.839215695858002]; % SH

% data points
col.plac(2,:) = [0.380392163991928 0.380392163991928 0.380392163991928];
col.prop(2,:) = [0.784313750267029 0.588235300779343 0.388235300779343];
col.ami(2,:) = [0.584313750267029 0.388235300779343 0.388235300779343];

x_ax = 0.5:0.5:4;

% Short horizon
b1S = bar(x_ax(1),nanmean(xi_SH(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
b2S = bar(x_ax(4),nanmean(xi_SH(idx_plc)),'FaceColor',col.plac(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);
b3S = bar(x_ax(7),nanmean(xi_SH(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 0.25, 'BarWidth',.5);

% Short horizon data points
plot(x_ax(1)*ones(1,size(xi_SH(idx_prop),1)), xi_SH(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2);
plot(x_ax(4)*ones(1,size(xi_SH(idx_plc),1)), xi_SH(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2);
plot(x_ax(7)*ones(1,size(xi_SH(idx_ami),1)), xi_SH(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2);

% Long horizon
b1L = bar(x_ax(2),nanmean(xi_LH(idx_prop)),'FaceColor',col.prop(1,:), 'FaceAlpha', 1, 'BarWidth',.5);
b2L = bar(x_ax(5),nanmean(xi_LH(idx_plc)),'FaceColor',col.plac(1,:),'FaceAlpha', 1, 'BarWidth',.5);
b3L = bar(x_ax(8),nanmean(xi_LH(idx_ami)),'FaceColor',col.ami(1,:), 'FaceAlpha', 1, 'BarWidth',.5);

% Long horizon data points
plot(x_ax(2)*ones(1,size(xi_LH(idx_prop),1)), xi_LH(idx_prop)','.','MarkerEdgeColor',col.prop(2,:), 'MarkerSize',2);
plot(x_ax(5)*ones(1,size(xi_LH(idx_plc),1)), xi_LH(idx_plc)','.','MarkerEdgeColor',col.plac(2,:), 'MarkerSize',2);
plot(x_ax(8)*ones(1,size(xi_LH(idx_ami),1)), xi_LH(idx_ami)','.','MarkerEdgeColor',col.ami(2,:), 'MarkerSize',2);

% Line between data points
for n = 1:size(idx_prop,1)
    lin1 = plot(x_ax(1:2),[xi_SH(idx_prop(n)) xi_LH(idx_prop(n))]); hold on;
    lin1.Color = [col.prop(2,:) 0.3]; % transparency
end

for n = 1:size(idx_plc,1)
    lin2 = plot(x_ax(4:5),[xi_SH(idx_plc(n)) xi_LH(idx_plc(n))]); hold on;
    lin2.Color = [col.plac(2,:) 0.3]; % transparency
end

for n = 1:size(idx_ami,1)
    lin3 = plot(x_ax(7:8),[xi_SH(idx_ami(n)) xi_LH(idx_ami(n))]); hold on;
    lin3.Color = [col.ami(2,:) 0.3]; % transparency
end

h = errorbar(x_ax([1 2 4 5 7 8]),...
    [nanmean(xi_SH(idx_prop)) nanmean(xi_LH(idx_prop)) ...
    nanmean(xi_SH(idx_plc)) nanmean(xi_LH(idx_plc)) ...
    nanmean(xi_SH(idx_ami)) nanmean(xi_LH(idx_ami))], ...
    [nanstd(xi_SH(idx_prop))./sqrt(numel(idx_prop)) nanstd(xi_LH(idx_prop))./sqrt(numel(idx_prop))...
    nanstd(xi_SH(idx_plc))./sqrt(numel(idx_plc)) nanstd(xi_LH(idx_prop))./sqrt(numel(idx_plc))...
    nanstd(xi_SH(idx_ami))./sqrt(numel_idx_ami) nanstd(xi_LH(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
set(h,'Marker','none')

legend([b2S b2L],{'Short horizon', 'Long horizon'}, 'Position',[0.168872814262118 0.81087418498448 0.339778999597328 0.121052628441861]);
legend boxoff  

xlim([0 4.5])   
set(gca,'XTick',[0.75 2.25 3.75])
set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})

ylabel('Best-fit parameter value','FontName','Arial','Fontweight','bold','FontSize',12,'Interpreter','tex');
set(gca,'YTick',0:0.1:0.5)
ylim([0 0.52])


%% Export
addpath('../../export_fig')
export_fig(['Fig_model_parameters_lapse.tif'],'-nocrop','-r200')


