
sgm0_mat = 1.312;
xi_mat = 0.1;
Q0_mat = 3.200;

part_num = 200;

eta_range = 0:1:2;

sim_folder = strcat('../../data/simulation_data/sim_prob_mod12/changing_eta/sgm0_',num2str(sgm0_mat),'_Q0_',num2str(Q0_mat),'_xi_',num2str(xi_mat),'/');
                                               
load(strcat(sim_folder,'mat_mean_SEM_tree_novel.mat'));  

% picked novel

col = [0.803921580314636 0.878431379795074 0.968627452850342];

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 8 8]);
set(gca,'FontName','Arial','FontSize',9)
hold on

bar(mat_mean_SEM_tree_novel([1 3],1),mat_mean_SEM_tree_novel([1 3],2),'FaceColor',col, 'FaceAlpha', 1, 'BarWidth',0.8); hold on;
errorbar(mat_mean_SEM_tree_novel([1 3],1),mat_mean_SEM_tree_novel([1 3],2),mat_mean_SEM_tree_novel([1 3],3),'.','color','k', 'LineWidth',0.8);

ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',9);
xlabel('Novelty exploration')          
title('Novel bandit')

ylim([0 70.5])
xlim([-1.5 3.5])
xticks([0 2])
xticklabels({'Low','High'});
yticks(0:15:75)

addpath('../../export_fig/')
export_fig('Fig_novel_bin.tif','-nocrop','-r200')





