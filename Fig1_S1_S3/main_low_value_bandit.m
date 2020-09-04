

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

ybounds = [0 15.5];
increment = 5;

% Tabula-rasa
subplot(2,2,1)
tmp_SH=load('../../data/simulation_data/sim_prob_mod16/changing_xi/Q0_5_eta_0/mat_mean_SEM_tree_low.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod16/changing_xi/Q0_5_eta_2/mat_mean_SEM_tree_low.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_low([2 4],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_low([3 5],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'a', {'Value-free random ','exploration simulation'}, {'Proportion of low-value',' bandit draws [%]'});

% Novelty
subplot(2,2,2)
tmp_SH=load('../../data/simulation_data/sim_prob_mod16/changing_eta/Q0_5_xi_0/mat_mean_SEM_tree_low.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod16/changing_eta/Q0_5_xi_0.2/mat_mean_SEM_tree_low.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_low([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_low([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'b', {'Novelty ','exploration simulation'}, {'Proportion of low-value',' bandit draws [%]'});

% Thompson
subplot(2,2,3)
tmp_SH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_0_Q0_5_xi_0/mat_mean_SEM_tree_low.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod12/changing_sgm0/eta_2_Q0_5_xi_0.2/mat_mean_SEM_tree_low.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_low([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_low([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'c', {'Thompson-sampling','exploration simulation'}, {'Proportion of low-value',' bandit draws [%]'});

% UCB
subplot(2,2,4)
tmp_SH=load('../../data/simulation_data/sim_prob_mod5/changing_gamma/tau_0.2_Q0_5/mat_mean_SEM_tree_low.mat');
tmp_LH=load('../../data/simulation_data/sim_prob_mod5/changing_gamma/tau_0.7_Q0_5/mat_mean_SEM_tree_low.mat'); 
data_SH = tmp_SH.mat_mean_SEM_tree_low([1 3],2:3);
data_LH = tmp_LH.mat_mean_SEM_tree_low([2 4],2:3);
render_sim(ybounds, increment, data_SH, data_LH, 'd', {'UCB ','exploration simulation'}, {'Proportion of low-value',' bandit draws [%]'});

% Export
addpath('../../export_fig')
export_fig(['Fig1S1.tif'],'-nocrop','-r200')

export_fig(['../powerpoints/Fig1S1.tif'],'-nocrop','-r200')