
close all;

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

%% Figure

% xi
plot_corr(para_vals_fitted(:,4),para_vals_generated(:,4), param_bounds_xi(2), [0:0.1:0.5], 'xi_1');
plot_corr(para_vals_fitted(:,5),para_vals_generated(:,5), param_bounds_xi(2), [0:0.1:0.5], 'xi_2');

% eta
plot_corr(para_vals_fitted(:,6),para_vals_generated(:,6), param_bounds_eta(2), [0:2:6], 'eta_1');
plot_corr(para_vals_fitted(:,7),para_vals_generated(:,7), param_bounds_eta(2), [0:2:6], 'eta_2');

% Q0
plot_corr(para_vals_fitted(:,3),para_vals_generated(:,3), param_bounds_Q0(2), [0:2:6], 'Q0');

% sgm0
plot_corr(para_vals_fitted(:,1),para_vals_generated(:,1), param_bounds_sgm0(2), [0:1:4], 'sgm_1');
plot_corr(para_vals_fitted(:,2),para_vals_generated(:,2), param_bounds_sgm0(2), [0:1:4], 'sgm_2');
