function [] = render_corr_xi_low()
  
    %% Data
    load('../data_for_figs/model_parameters_Q0uni.mat')
    
    % xi
    xi_LH = model_parameters_Q0uni(:,5);
    xi_LH(6,1) = nan;
    xi_SH = model_parameters_Q0uni(:,4);
    xi_SH(6,1) = nan;
    
    % picked D
    load('../data_for_figs/behaviour.mat')
    n_trials_LH = 200;
    n_trials_SH = 200;
    pickedD_LH_perc = behaviour(:,5)/n_trials_LH*100;
    pickedD_LH_perc(6,1) = nan;
    pickedD_SH_perc = behaviour(:,9)/n_trials_SH*100;
    pickedD_SH_perc(6,1) = nan;
    
    %% Plot

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 

    
    plot([xi_LH; xi_SH],[pickedD_LH_perc; pickedD_SH_perc], 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
    ylabel({'Proportion of low-value',' bandit draws [%]'}','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('\epsilon-greedy parameter','FontName','Arial','Fontweight','bold','FontSize',12);

    xlimmax = 0.58;
    ylimmax = 16;
    distancelinestop = 0.05;
    
    xlim([0 xlimmax])
    ylim([0 ylimmax])
    yticks((0:3:ylimmax))
    xticks([0 0.1 0.2 0.3 0.4 0.5])
    plot([0,xlimmax],[0,ylimmax],'Color','k', 'Linewidth', 0.4,'LineStyle','--');

    rho = corr([xi_LH; xi_SH],[pickedD_LH_perc; pickedD_SH_perc], 'rows','complete', 'Type','Pearson');
    dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
    legend([dummyh],{['r=' num2str(rho)]},'Location','SouthEast','FontSize',15)
    legend boxoff;
    
    set(gca,'box','off')
    
    % Number and title
    text(0-0.2, 1+0.27,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    text(0, 1+0.22,'Value-free random exploration','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 18,'FontName','Arial', 'Fontweight','normal')
    t=title({'\color{white}.','\color{white}.'},'FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

