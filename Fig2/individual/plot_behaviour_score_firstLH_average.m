
%% Databehaviour
load('../data_for_figs/behaviour.mat')
load('../data_for_figs/firstapples.mat')

n_trials_SH = 200;
n_trials_LH = 200;

first_LH = firstapples(:,10)/n_trials_LH;
score_SH = behaviour(:,11)/n_trials_SH;
score_LH = behaviour(:,10)/(6*n_trials_LH);

%% Save
save('../data_for_figs/first_LH.mat', 'first_LH');
save('../data_for_figs/score_SH.mat', 'score_SH');
save('../data_for_figs/score_LH.mat', 'score_LH');

%%

% Remove 506
score_SH(6,1) = nan;
score_LH(6,1) = nan;
firsy_LH(6,1) = nan;
numel_n =  numel(behaviour(:,1)-1);

%% Figure
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on


col.all(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
col.all(2,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % data points

x_ax = 0:0.4:4;

% SH
b1S= bar(x_ax(3),nanmean(score_SH),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1); 

% data points
plot(x_ax(3)*ones(1,size(score_SH,1)), score_SH','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);

% first LH
b1Lf = bar(x_ax(6),nanmean(first_LH),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

% data points
plot(x_ax(6)*ones(1,size(first_LH,1)), first_LH','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3);

% LH
b1L = bar(x_ax(9),nanmean(score_LH),'FaceColor',col.all(1,:), 'FaceAlpha', 1, 'BarWidth',1);

% data points
plot(x_ax(9)*ones(1,size(score_LH,1)), score_LH','.','MarkerEdgeColor',col.all(2,:), 'MarkerSize',3)


h = errorbar(x_ax([3 6 9]),...
    [nanmean(score_SH) nanmean(first_LH) nanmean(score_LH)], ...
    [nanstd(score_SH)./sqrt(numel_n) nanstd(first_LH)./sqrt(numel_n) nanstd(score_LH)./sqrt(numel_n)],'.','color','k');

set(h,'Marker','none')

xlim([0.15 3.85])   
set(gca,'XTick',[x_ax(3) x_ax(6) x_ax(9)])

labels = {strcat('Short horizon \newline',32,32,'1st sample'),strcat(' Long horizon \newline',32,32,' 1st sample'),strcat(32,32,32,32,'Long horizon \newline',32,32,'average sample')};
a = gca;
a.XTickLabel = labels;

ylabel('Reward','FontName','Arial','Fontweight','bold','FontSize',12);
set(gca,'YTick',4.9:0.3:7)
ylim([5.4 6.6])


%% Export
addpath('../../export_fig')
export_fig(['Fig_behaviour_score.tif'],'-nocrop','-r200')


