
load('../data_for_figs/RT_all_LH_desc.mat')
load('../data_for_figs/RT_all_LH.mat')

% remove 506
RT_all_LH(6,:) = nan(1,6);
n = size(RT_all_LH,1)-1;

% Figure

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

col(1,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % indiv lines
col(2,:) = [0.20392157137394 0.301960796117783 0.494117647409439]; % mean

noise_plot = (rand(size(RT_all_LH,1),1)-0.5)/5;

plot([1:6],nanmean(RT_all_LH,1),'LineWidth',1, 'Color',[col(2,:) 1]); hold on;

errorbar([1:6],[nanmean(RT_all_LH)],[nanstd(RT_all_LH)./sqrt(n)],'.','color','k');

plot(1*ones(1,60)+noise_plot, RT_all_LH(:,1),'.','MarkerEdgeColor',col(1,:), 'MarkerSize',3); hold on;
plot(2*ones(1,60)+noise_plot, RT_all_LH(:,2),'.','MarkerEdgeColor',col(2,:), 'MarkerSize',3); hold on;
plot(3*ones(1,60)+noise_plot, RT_all_LH(:,3),'.','MarkerEdgeColor',col(1,:), 'MarkerSize',3); hold on;
plot(4*ones(1,60)+noise_plot, RT_all_LH(:,4),'.','MarkerEdgeColor',col(1,:), 'MarkerSize',3); hold on;
plot(5*ones(1,60)+noise_plot, RT_all_LH(:,5),'.','MarkerEdgeColor',col(1,:), 'MarkerSize',3); hold on;
plot(6*ones(1,60)+noise_plot, RT_all_LH(:,6),'.','MarkerEdgeColor',col(1,:), 'MarkerSize',3);

ylim([0 3100])
xlim([0 7])
set(gca,'YTick',0:750:3000)
set(gca,'XTick',1:6)
ylabel('Reaction time (ms)')
xlabel('Sample')

%% Export
addpath('../../export_fig/')
export_fig(['Fig_RT_LH_all.tif'],'-nocrop','-r200')
