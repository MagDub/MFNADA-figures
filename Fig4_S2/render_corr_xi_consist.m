function [] = render_corr_xi_consist()
  
   %% Data
    load('../data_for_figs/model_parameters_Q0uni.mat')
    
    % xi
    xi_LH = model_parameters_Q0uni(:,5);
    xi_LH(6,1) = nan;
    xi_SH = model_parameters_Q0uni(:,4);
    xi_SH(6,1) = nan;
    
    % consist
    load('../data_for_figs/consistency_freq.mat')
    consist_SH = consistency_freq(:,2);
    consist_LH = consistency_freq(:,1);
    consist_SH(6,1) = nan;
    consist_LH(6,1) = nan;
    
    %% Plot

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 
       
    plot([xi_LH; xi_SH],[consist_LH; consist_SH], 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(3,:),'MarkerSize',3.3, 'LineWidth', 0.7); hold on;
    ylabel({'Proportion of',' same choices [%]'}','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('\epsilon-greedy parameter','FontName','Arial','Fontweight','bold','FontSize',12);

    xlimmax = 0.6;
    ylimmin = 34;
    ylimmax = 90;
    
    xlim([0 xlimmax])
    ylim([ylimmin ylimmax])
    plot([0,xlimmax],[ylimmax,ylimmin],'Color','k', 'Linewidth', 0.4,'LineStyle','--');
    
    yticks((0:15:ylimmax))

    rho = corr([xi_LH; xi_SH],[consist_LH; consist_SH], 'rows','complete', 'Type','Pearson');
    dummyh = line(nan, nan, 'Linestyle', 'none', 'Marker', 'none', 'Color', 'none');
    legend([dummyh],{['r=' num2str(rho)]}, 'Location','NorthEast','FontSize',15)
    legend boxoff;
    
    set(gca,'box','off')
    
    % Number and title
    t=title({'\color{white}.','\color{white}.'},'FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

