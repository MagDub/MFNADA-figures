function [] = render_model_selection_pp_3()
   
    % Data
    load('../data_for_figs/model_selection_mat_q0.mat')

    for model = 1:size(mod.file_name,2)
       all_models(model,:) = mod.mean_pp{model}';
       mean_all(model) = mod.mean_all{model}*100;
       stderror_all(model) = mod.stderror_all{model}*100;
       legend_all{model} = mod.legend{model};
       number_par_all(model) = mod.number_par{model};
    end

    % rm 506
    all_models(:,6) = [];

    mean_per_model = nanmean(all_models');

    [~,index_best_models] = sort(mean_per_model, 'descend');

    n_mod = 3;

    best_models = index_best_models(1:n_mod);
    models = sort(best_models);

    %% Figure

    legend_all{1} = 'thompson';
    legend_all{2} = 'thompson + \epsilon';
    legend_all{3} = 'thompson + \eta';
    legend_all{4} = 'thompson + \epsilon + \eta';

    legend_all{5} = 'UCB';
    legend_all{6} = 'UCB + \epsilon';
    legend_all{7} = 'UCB + \eta';
    legend_all{8} = 'UCB + \epsilon + \eta';

    legend_all{9} =  'hybrid';
    legend_all{10} = 'hybrid + \epsilon';
    legend_all{11} = 'hybrid + \eta';
    legend_all{12} = 'hybrid + \epsilon + \eta';

    col_(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342];

    x = 1:n_mod;

    [clos,best_model_ind_pp] = max(all_models(models,:),[],1);

    [val]=hist(best_model_ind_pp,1:1:n_mod);

    b = bar(x,val,'FaceColor',col_(1,:),'BarWidth',.7);  hold on;

    txt_val = val';
    ind_notnul = find(val~=0);

    text(x(ind_notnul),val(ind_notnul),num2str(txt_val(ind_notnul)),'vert','bottom','horiz','center'); 
    box off

    ylabel('Number of subjects','FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:15:100)
    ylim([0 40])

    models = sort(best_models);

    xticks(1:0.5:size(models,2));
    xticklabels([legend_all(models(1)),{''}, legend_all(models(2)),{''}, legend_all(models(3))]);
    xlim([0,size(models,2)+1])

    xtickangle(45)
    
    set(gca,'box','off')

    % Number and title
    text(0-0.2, 1+0.17,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Best fitting model','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

