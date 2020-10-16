

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 20 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

ybounds = [14 31];
increment = 5;

% Softmax
subplot(1,2,1)
tmp=load('../../../data/simulation_data/sim_prob_softmax/changing_tau_2/Q0_5/mat_mean_SEM_tree_novel.mat');
data = tmp.mat_mean_SEM_tree_novel([3 13],2:3);
render_sim(ybounds, increment, data, 'a', {'Simulation of value-based','random exploration'}, {'Proportion of novel',' bandit draws [%]'});

% Egreedy
subplot(1,2,2)
tmp=load('../../../data/simulation_data/sim_prob_egreedy/changing_xi/Q0_5/mat_mean_SEM_tree_novel.mat');
data = tmp.mat_mean_SEM_tree_novel([2 4],2:3);
render_sim(ybounds, increment, data, 'b', {'Simulation of value-free','random exploration'}, {'Proportion of novel',' bandit draws [%]'});

% Export
addpath('../../../export_fig')
export_fig('Fig_sim_novel.tif','-nocrop','-r200')

