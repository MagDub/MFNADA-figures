
% Data
load('../data_for_figs/mean_all_high_desc.mat')
load('../data_for_figs/mean_all_high_SH.mat')
load('../data_for_figs/mean_all_high_LH.mat')

mean_all = (mean_all_high_SH+mean_all_high_LH)/2;

mean_all_high  = mean_all(:,1);
mean_all_novel = mean_all(:,3);
mean_all_low   = mean_all(:,4);

% Remove 506
mean_all_high(6,1) = nan;
mean_all_novel(6,1) = nan;
mean_all_low(6,1) = nan;

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

x_ax = 0:0.4:4;

% SH
b1S= bar(x_ax(3),nanmean(mean_all_high),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); 

% data points
plot(x_ax(3)*ones(1,size(mean_all_high,1)), mean_all_high','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);

% first LH
b1Lf = bar(x_ax(6),nanmean(mean_all_novel),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

% data points
plot(x_ax(6)*ones(1,size(mean_all_novel,1)), mean_all_novel','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);

% LH
b1L = bar(x_ax(9),nanmean(mean_all_low),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

% data points
plot(x_ax(9)*ones(1,size(mean_all_low,1)), mean_all_low','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3)


h = errorbar(x_ax([3 6 9]),...
    [nanmean(mean_all_high) nanmean(mean_all_novel) nanmean(mean_all_low)], ...
    [nanstd(mean_all_high)./sqrt(numel_n) nanstd(mean_all_novel)./sqrt(numel_n) nanstd(mean_all_low)./sqrt(numel_n)],'.','color','k');

set(h,'Marker','none')

xlim([0.15 3.85])   
set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9)])

labels = {strcat('High-value \newline',32,32,32,'bandit'),strcat(' Novel \newline',' bandit'),strcat(32,'Low-value \newline',32,32,32,'bandit')};
a = gca;
a.XTickLabel = labels;

ylabel('Reaction times [ms]','FontName','Arial','Fontweight','bold','FontSize',12);
set(gca,'YTick',0:1500:7000)
ylim([0 6200])

%% Export
addpath('../../export_fig')
export_fig(['Fig_RT_3_bandits.tif'],'-nocrop','-r200')


