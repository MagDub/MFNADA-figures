
% heuristic model 
eta_mat = 0.1;
Q0_mat = 3.200;

part_num = 200;

xi_1 = 0;
xi_2 = 1;

sim_folder = strcat('../../data/simulation_data/sim_prob_mod16/changing_xi/Q0_',num2str(Q0_mat),'_eta_',num2str(eta_mat),'/');

load(strcat(sim_folder,'mat_mean_SEM_tree_low.mat'));  

ind_1 = find(mat_mean_SEM_tree_low(:,1)==xi_1);
ind_2 = find(mat_mean_SEM_tree_low(:,1)==xi_2);

% picked low

col = [0.803921580314636 0.878431379795074 0.968627452850342];

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 8 8]);
set(gca,'FontName','Arial','FontSize',9)
hold on

bar([0,2],mat_mean_SEM_tree_low([ind_1 ind_2],2),'FaceColor',col, 'FaceAlpha', 1, 'BarWidth',0.8); hold on;
errorbar([0,2],mat_mean_SEM_tree_low([ind_1 ind_2],2),mat_mean_SEM_tree_low([ind_1 ind_2],3)*sqrt(part_num),'.','color','k', 'LineWidth',0.8);

ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',9);
title('Low-value bandit')

ylim([0 7])
xlim([-1.5 3.5])
xticks([0 2])
xticklabels({'Low','High'});
yticks(0:1:10)

addpath('../../export_fig/')
export_fig('Fig_mod_16_low_value.tif','-nocrop','-r200')





