
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 40 20]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

load('../../data/simulation_data/thompson/4perdim_newbounds/inp_params_thompson.mat')
load('../../data/data_for_figs/out_sim_thompson.mat')

%{'sgm0', 'sgm0', 'Q0','xi', '', 'eta', ''};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
param_bounds_sgm0 = [0.01,3];
param_bounds_Q0 = [1,6]; 
param_bounds_xi = [10^-8,0.5];  
param_bounds_eta = [0,6];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

para_vals_generated = out.org;
para_vals_fitted = out.fitted;

rand_ = rand(size(para_vals_fitted(:,4)))-0.5;

%%% Figure 

subplot(2,4,1)
title_ = '\fontsize{22} \epsilon{\fontsize{18}-greedy parameter 1}';
render_corr(para_vals_fitted(:,4),para_vals_generated(:,4), param_bounds_xi(2), [0:0.1:0.5], title_, 'a');

subplot(2,4,2)
title_ = '\fontsize{22} \epsilon{\fontsize{18}-greedy parameter 2}';
render_corr(para_vals_fitted(:,5),para_vals_generated(:,5), param_bounds_xi(2), [0:0.1:0.5], title_, 'b');

subplot(2,4,3)
title_ = '\fontsize{18} Novelty bonus{\fontsize{22} \eta 1}';
render_corr(para_vals_fitted(:,6),para_vals_generated(:,6), param_bounds_eta(2), [0:2:6], title_, 'c');

subplot(2,4,4)
title_ = '\fontsize{18} Novelty bonus{\fontsize{22} \eta 2}';
render_corr(para_vals_fitted(:,7),para_vals_generated(:,7), param_bounds_eta(2), [0:2:6], title_, 'd');

subplot(2,4,5)
title_ = '\fontsize{18} Prior mean Q_0';
render_corr(para_vals_fitted(:,3),para_vals_generated(:,3), param_bounds_Q0(2), [0:2:6], title_, 'e');

subplot(2,4,6)
title_ = '\fontsize{18} Prior variance{\fontsize{22} \sigma}_0 1';
render_corr(para_vals_fitted(:,1),para_vals_generated(:,1), param_bounds_sgm0(2), [0:1:4], title_, 'f');

subplot(2,4,7)
title_ = '\fontsize{18} Prior variance{\fontsize{22} \sigma}_0 2';
render_corr(para_vals_fitted(:,2),para_vals_generated(:,2), param_bounds_sgm0(2), [0:1:4], title_, 'g');


% Export
addpath('../../export_fig')
export_fig('Fig4S3.tif','-nocrop','-r200')

export_fig('../powerpoints/Fig4S3.tif','-nocrop','-r200')