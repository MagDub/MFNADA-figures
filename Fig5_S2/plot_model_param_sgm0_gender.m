
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

xlim([0 4.5])   
set(gca,'XTick',[0.75 2.25 3.75])
set(gca,'XTickLabel',{'Noradrenaline','Placebo', 'Dopamine'})

ylabel('Best-fit parameter value','FontName','Arial','Fontweight','bold','FontSize',12,'Interpreter','tex');
set(gca,'YTick',0:0.5:2.6)
ylim([0 2.6])


%% Export
addpath('../../export_fig')
export_fig(['Fig_model_parameters_sgm0_gender.tif'],'-nocrop','-r200')


