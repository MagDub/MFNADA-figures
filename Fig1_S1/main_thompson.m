
%%%%%%% Tabula-rasa %%%%%%% 

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;


% consistency
subplot(2,2,1)
ybounds = [50 115];
increment = 20;
tmp_SH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_0_Q0_5_xi_0/mat_mean_SEM_consistency.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_2_Q0_5_xi_0.2/mat_mean_SEM_consistency.mat'); 
data_SH = tmp_SH.mat_mean_SEM_consistency([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_consistency([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'a', 'Consistency');

% high-value
subplot(2,2,2)
ybounds = [0 105];
increment = 25;
tmp_SH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_0_Q0_5_xi_0/mat_mean_SEM_tree_high.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_2_Q0_5_xi_0.2/mat_mean_SEM_tree_high.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_high([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_high([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'b', 'High-value bandit');

% low value
subplot(2,2,3)
ybounds = [0 15.5];
increment = 5;
tmp_SH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_0_Q0_5_xi_0/mat_mean_SEM_tree_low.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_2_Q0_5_xi_0.2/mat_mean_SEM_tree_low.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_low([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_low([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'c', 'Low-value bandit');

% novel
subplot(2,2,4)
ybounds = [0 105];
increment = 25;
tmp_SH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_0_Q0_5_xi_0/mat_mean_SEM_tree_novel.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_2_Q0_5_xi_0.2/mat_mean_SEM_tree_novel.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_novel([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_novel([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'd', 'Novel bandit');

% Export
addpath('../../export_fig')
export_fig(['Fig1S3.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig1S3.tif'],'-nocrop','-r200')
