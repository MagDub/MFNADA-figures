
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

ybounds = [0 70];
increment = 20;

% Softmax
subplot(1,2,1)
load('../../../data/simulation_data/sim_prob_softmax_ABD/changing_tau/Q0_5/mat_mean_SEM_tree_high.mat');
load('../../../data/simulation_data/sim_prob_softmax_ABD/changing_tau/Q0_5/mat_mean_SEM_tree_medium.mat');
load('../../../data/simulation_data/sim_prob_softmax_ABD/changing_tau/Q0_5/mat_mean_SEM_tree_low.mat');
data_1(1,:) = mat_mean_SEM_tree_high([2],2:3);
data_1(2,:) = mat_mean_SEM_tree_medium([2],2:3);
data_1(3,:) = mat_mean_SEM_tree_low([2],2:3);
xlab = {'High','Medium','Low'};
x_axis_ = {'Value of bandit'};
y_axis_ = {'Proportion of',' bandit draws [%]'};
subplot_title = {'Simulation of value-based','random exploration'};
render_sim_4(ybounds, increment, data_1, '', subplot_title, y_axis_, x_axis_, xlab);

% Egreedy
subplot(1,2,2)
load('../../../data/simulation_data/sim_prob_egreedy_ABD/changing_xi/Q0_5/mat_mean_SEM_tree_medium.mat');
load('../../../data/simulation_data/sim_prob_egreedy_ABD/changing_xi/Q0_5/mat_mean_SEM_tree_high.mat');
load('../../../data/simulation_data/sim_prob_egreedy_ABD/changing_xi/Q0_5/mat_mean_SEM_tree_low.mat');
data_2(1,:) = mat_mean_SEM_tree_high([3],2:3);
data_2(2,:) = mat_mean_SEM_tree_medium([3],2:3);
data_2(3,:) = mat_mean_SEM_tree_low([3],2:3);
subplot_title = {'Simulation of value-free','random exploration'};
render_sim_4(ybounds, increment, data_2, '', subplot_title, y_axis_, x_axis_, xlab);


% Export
addpath('../../../export_fig')
export_fig('Fig_sim_ABD.tif','-nocrop','-r200')

