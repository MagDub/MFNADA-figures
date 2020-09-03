
%% Data
load('../data_for_figs/model_parameters_Q0uni.mat')
Q0 = model_parameters_Q0uni(:,3);

%% Drugs
load('../data_for_figs/drug_code.mat') %0: placebo, 1:amisulpride, 2:propranolol
idx_plc = find(drug_code(:,2)==0);
idx_ami = find(drug_code(:,2)==1);
idx_prop = find(drug_code(:,2)==2);

% Remove 506
Q0(6,1) = nan;
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

x_ax = 0:0.4:4;

% Short Horizon
b1S = bar(x_ax(3),nanmean(Q0(idx_prop)),'FaceColor',col.prop(1,:),'BarWidth',1);
b2S = bar(x_ax(6),nanmean(Q0(idx_plc)),'FaceColor',col.plac(1,:),'BarWidth',1);
b3S = bar(x_ax(9),nanmean(Q0(idx_ami)),'FaceColor',col.ami(1,:),'BarWidth',1);

% data points
plot(x_ax(3)*ones(1,size(Q0(idx_prop),1)), Q0(idx_prop)','.','MarkerEdgeColor',col.prop(2,:),'MarkerSize',4); 
plot(x_ax(6)*ones(1,size(Q0(idx_plc),1)), Q0(idx_plc)','.','MarkerEdgeColor',col.plac(2,:),'MarkerSize',4);
plot(x_ax(9)*ones(1,size(Q0(idx_ami),1)), Q0(idx_ami)','.','MarkerEdgeColor',col.ami(2,:),'MarkerSize',4);

h = errorbar(x_ax([3 6 9]),...
    [nanmean(Q0(idx_prop)) nanmean(Q0(idx_plc)) nanmean(Q0(idx_ami))], ...
    [nanstd(Q0(idx_prop))./sqrt(numel(idx_prop)) nanstd(Q0(idx_plc))./sqrt(numel(idx_plc)) nanstd(Q0(idx_ami))./sqrt(numel_idx_ami)],'.','color','k');
set(h,'Marker','none')

xlim([0 4])   
set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9)])
set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})

ylabel('Best-fit parameter value','FontName','Arial','Fontweight','bold','FontSize',12,'Interpreter','tex');
set(gca,'YTick',0:1.5:6)
ylim([0 6.1])


%% Export
addpath('../../export_fig')
export_fig(['Fig_model_parameters_Q0.tif'],'-nocrop','-r200')


