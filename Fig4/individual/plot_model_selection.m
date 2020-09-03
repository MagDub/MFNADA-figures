
clear;

%% Data
load('../../data/data_for_figs/model_selection_heuristics.mat')


for model = 1:size(mod.file_name,2)
   all_models(model,:) = mod.mean_pp{model}';
   legend_all{model} = mod.legend{model};
   % number_par_all(model) = mod.number_par{model};
end

% rm 506
all_models(:,6) = [];

%% Save
mean_ = nanmean(all_models,2)*100;
std_ = nanstd(all_models')*100;
models_desc = legend_all;

save('../data_for_figs/models_desc.mat', 'models_desc');
save('../data_for_figs/models_mean.mat', 'mean_');
save('../data_for_figs/models_std.mat', 'std_');

%% Best
[val_best, ind_best]=sort(mean_, 'descend');

%% Figure

legend_all{1}  = 'thompson';
legend_all{2}  = 'thompson + \epsilon';
legend_all{3}  = 'thompson + \eta';
legend_all{4}  = 'thompson + \epsilon + \eta';

legend_all{5}  = 'UCB';
legend_all{6}  = 'UCB + \epsilon';
legend_all{7}  = 'UCB + \eta';
legend_all{8}  = 'UCB + \epsilon + \eta';

legend_all{9}  = 'hybrid';
legend_all{10} = 'hybrid + \epsilon';
legend_all{11} = 'hybrid + \eta';
legend_all{12} = 'hybrid + \epsilon + \eta';

legend_all{13} = 'argmax';
legend_all{14} = 'argmax + \epsilon';
legend_all{15} = 'argmax + \eta';
legend_all{16} = 'argmax + \epsilon + \eta';

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 12 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
cols(2,:) = [0 57 94]/255; % Color chance level 
cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 

x = 1:size(mean_,1)+4;
x =[x(1:4), x(6:9), x(11:14), x(16:19)];

b = bar(x,mean_,'FaceColor',cols(1,:),'BarWidth',.7);  hold on;

bw = bar(x(4),mean_(4),'FaceColor',cols(3,:),'BarWidth',.7);   

h = errorbar(x,mean_,std_/sqrt(59),std_/sqrt(59),'.','color','k');    
set(h,'Marker','none')

ylabel('Held-out data likelihood [%]','FontName','Arial','Fontweight','bold','FontSize',11);
yrange = [0.45 0.58]*100;set(gca,'YTick',44:4:100)
ylim(yrange)

xticks(1:numel(mean_)+4);
xticklabels([legend_all(1:4),{''}, legend_all(5:8),{''},legend_all(9:12),{''},legend_all(13:16)]);


xtickangle(45)

c=plot(0:x(end)+1,1/3*100*ones(size(0:x(end)+1)),'Color',cols(2,:),'LineWidth',1, 'LineStyle', ':');

legend([bw c],{'Winning model'}, 'Position',[0.510570545087122 0.877599978724319 0.361878446452526 0.0666666650981234]);
legend boxoff  

hold off

%% Export
addpath('../../export_fig')
export_fig(['Fig_model_comparaison.tif'],'-nocrop','-r200')


