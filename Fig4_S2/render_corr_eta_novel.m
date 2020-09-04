function [] = render_corr_eta_novel()
  
  %% Data
    load('../data_for_figs/model_parameters_Q0uni.mat')
    
    % eta
    eta_SH = model_parameters_Q0uni(:,6);
    eta_SH(6,1) = nan;
    eta_LH = model_parameters_Q0uni(:,7);
    eta_LH(6,1) = nan;
 
    % picked novel
    load('../data_for_figs/behaviour.mat')
    n_trials_SH = 200;
    n_trials_LH = 200;
    pickedC_SH_perc = behaviour(:,8)/n_trials_SH*100;
    pickedC_SH_perc(6,1) = nan;
    pickedC_LH_perc = behaviour(:,4)/n_trials_LH*100;
    pickedC_LH_perc(6,1) = nan;
    
    %% Plot

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 
               
    plot([eta_SH; eta_LH],[pickedC_SH_perc; pickedC_LH_perc], 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
    ylabel('Proportion of draws [%]','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('Novelty bonus \eta','FontName','Arial','Fontweight','bold','FontSize',12);

    xlimmax = 5;
    ylimmax = 71;
    distancelinestop = 0.05;
    
    xlim([0 xlimmax])
    ylim([0 ylimmax])
    yticks((0:15:ylimmax))
    plot([0,xlimmax],[0,ylimmax],'Color','k', 'Linewidth', 0.4,'LineStyle','--');

    rho = corr([eta_SH; eta_LH],[pickedC_SH_perc; pickedC_LH_perc], 'rows','complete', 'Type','Pearson');
    
    dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
    legend([dummyh],{['r=' num2str(rho)]}, 'Location','SouthEast','FontSize',15)
    legend boxoff;
    
    set(gca,'box','off')
    
    % Number and title
    text(0-0.2, 1+0.27,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    text(0+0.1, 1+0.22,'Novelty exploration','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 18,'FontName','Arial', 'Fontweight','normal')
    t=title({'\color{white}.','\color{white}.'},'FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

