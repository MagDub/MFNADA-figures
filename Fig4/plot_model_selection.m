
%% Data
load('../data_for_figs/model_selection_mat_q0.mat')

for model = 1:size(mod.file_name,2)
   all_models(model,:) = mod.mean_pp{model}';
   mean_all(model) = mod.mean_all{model}*100;
   stderror_all(model) = mod.stderror_all{model}*100;
   legend_all{model} = mod.legend{model};
   number_par_all(model) = mod.number_par{model};
end

%% Figure

legend_all{1} = 'thompson';
legend_all{2} = 'thompson + \epsilon';
legend_all{3} = 'thompson + \eta';
legend_all{4} = 'thompson + \epsilon + \eta';

legend_all{5} = 'UCB';
legend_all{6} = 'UCB + \epsilon';
legend_all{7} = 'UCB + \eta';
legend_all{8} = 'UCB + \epsilon + \eta';

legend_all{9} = 'hybrid';
legend_all{10} = 'hybrid + \epsilon';
legend_all{11} = 'hybrid + \eta';
legend_all{12} = 'hybrid + \epsilon + \eta';

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on

cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
cols(2,:) = [0 57 94]/255; % Color chance level 
cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 

x = 1:size(mean_all,2)+2;
x =[x(1:1+3), x(6:6+3), x(11:11+3)];

b = bar(x,mean_all,'FaceColor',cols(1,:),'BarWidth',.7);  hold on;

bw = bar(x(4),mean_all(4),'FaceColor',cols(3,:),'BarWidth',.7);   

h = errorbar(x,mean_all,stderror_all/sqrt(59),stderror_all/sqrt(59),'.','color','k');    
set(h,'Marker','none')

ylabel('Held-out data likelihood [%]','FontName','Arial','Fontweight','bold','FontSize',11);
yrange = [0.495 0.56]*100;
set(gca,'YTick',50:2:100)
ylim(yrange)

xticks(1:numel(mean_all)+2);
xticklabels([legend_all(1:1+3),{''}, legend_all(5:5+3),{''},legend_all(9:9+3)]);

xtickangle(45)

c=plot(0:x(end)+1,1/3*100*ones(size(0:x(end)+1)),'Color',cols(2,:),'LineWidth',1, 'LineStyle', ':');


legend([bw c],{'Winning model'}, 'Position',[0.510570545087122 0.877599978724319 0.361878446452526 0.0666666650981234]);
legend boxoff  

hold off

%% Export
addpath('../../export_fig')
export_fig(['Fig_model_comparaison.tif'],'-nocrop','-r200')


