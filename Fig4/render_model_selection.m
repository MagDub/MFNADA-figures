
function [] = render_model_selection(ybounds, increment)
    
    %% Data
    load('../../data/data_for_figs/model_selection_heuristics.mat')


    for model = 1:12%size(mod.file_name,2)
       all_models(model,:) = mod.mean_pp{model}';
       legend_all{model} = mod.legend{model};
       % number_par_all(model) = mod.number_par{model};
    end

    % rm 506
    all_models(:,6) = [];

    %% Save
    mean_ = nanmean(all_models,2)*100;
    std_ = nanstd(all_models')*100;
    models_desc = legend_all;

    save('../data_for_figs/models_desc.mat', 'models_desc');
    save('../data_for_figs/models_mean.mat', 'mean_');
    save('../data_for_figs/models_std.mat', 'std_');

    %% Best
    [val_best, ind_best]=sort(mean_, 'descend');

    %% Figure

    legend_all{1}  = 'thompson';
    legend_all{2}  = 'thompson + \epsilon';
    legend_all{3}  = 'thompson + \eta';
    legend_all{4}  = 'thompson + \epsilon + \eta';

    legend_all{5}  = 'UCB';
    legend_all{6}  = 'UCB + \epsilon';
    legend_all{7}  = 'UCB + \eta';
    legend_all{8}  = 'UCB + \epsilon + \eta';

    legend_all{9}  = 'hybrid';
    legend_all{10} = 'hybrid + \epsilon';
    legend_all{11} = 'hybrid + \eta';
    legend_all{12} = 'hybrid + \epsilon + \eta';
    
%     legend_all{13} = 'null value';
%     legend_all{14} = 'null value + \epsilon';
%     legend_all{15} = 'null value + \eta';
%     legend_all{16} = 'null value + \epsilon + \eta';
    
%     legend_all{17} = 'thompson + softmax';
%     legend_all{18} = 'thompson + softmax + \epsilon';
%     legend_all{19} = 'thompson + softmax+ \eta';
%     legend_all{20} = 'thompson + softmax + \epsilon + \eta';
%     
%     legend_all{21} = 'UCB + argmax';
%     legend_all{22} = 'UCB + argmax + \epsilon';
%     legend_all{23} = 'UCB + argmax+ \eta';
%     legend_all{24} = 'UCB + argmax + \epsilon + \eta';

    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 

    x = [1:4 6:9 11:14]; %[1:4 6:9 11:14 16:19 21:24 26:29];

    b = bar(x,mean_,'FaceColor',cols(1,:),'BarWidth',.7);  hold on;
    
    text(x([4])+0.25,mean_([4])+1.2,['1^{st}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12); 
    text(x([8])+0.25,mean_([8])+1.2,['2^{nd}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12);
    text(x([12])+0.25,mean_([12])+1.2,['3^{rd}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12);
    box off

    bw = bar(x(4),mean_(4),'FaceColor',cols(3,:),'BarWidth',.7);   

    h = errorbar(x,mean_,std_/sqrt(59),std_/sqrt(59),'.','color','k');    
    set(h,'Marker','none')
    
    c=plot(0:x(end)+1,1/3*100*ones(size(0:x(end)+1)),'Color',cols(2,:),'LineWidth',1, 'LineStyle', ':');

    legend([bw],{'Winning model'}, 'Position',[0.310453400503778 0.837078651685393 0.153022670025189 0.0692883895131086],'FontSize',12);
    legend boxoff 
    
    ylabel({'Held-out data likelihood [%]'},'FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

    xticks(x)
    xticklabels(legend_all);
    set(gca,'box','off')

    xtickangle(45)

    % Number and title
    text(0-0.15, 1+0.18,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Model selection','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

end


