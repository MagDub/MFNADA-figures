function [] = render_score_explore()

   data_for_figs_f = '../data_for_figs/';

    %% Data behaviour
    load(strcat(data_for_figs_f,'score_mat_all_apples.mat'))
    load(strcat(data_for_figs_f,'score_mat_all_apples_desc.mat'))

    n = size(score_mat_all_apples,2);

    %%

    % split in 2 matrices (2 conditions) and average within participants
    mean_exploited = nan(n,6);
    mean_explored = nan(n,6);

    for part=1:n

        if part~=6

            tmp = score_mat_all_apples{part};

            score_exploited = tmp(tmp(:,2)==1,3:9);
            score_explored = tmp(tmp(:,2)==0,3:9);

            cumulative_score_exploited = [score_exploited(:,1) ...
                        score_exploited(:,2) ...
                        score_exploited(:,3)...
                        score_exploited(:,4) ...
                        score_exploited(:,5) ...
                        score_exploited(:,6)];

            diff_score_exploited = cumulative_score_exploited - score_exploited(:,7);

            cumulative_score_explored = [score_explored(:,1) ...
                        score_explored(:,2) ...
                        score_explored(:,3)...
                        score_explored(:,4) ...
                        score_explored(:,5) ...
                        score_explored(:,6)];

            diff_score_explored = cumulative_score_explored - score_explored(:,7);

            mean_exploited(part,:) = mean(diff_score_exploited,1);
            mean_explored(part,:) = mean(diff_score_explored,1);

        end
    end

    %% Figure

    col(1,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; % indiv lines
    col(2,:) = [0.20392157137394 0.301960796117783 0.494117647409439]; % mean

    plot([1:6], mean_explored, 'Color',[col(1,:) 0.3]); hold on;

    plot([1:6],nanmean(mean_explored,1),'LineWidth',3, 'Color',[col(2,:) 1]); hold on;

    errorbar([1:6],[nanmean(mean_explored)],[nanstd(mean_explored)./sqrt(n)],'.','color','k');


    ylim([-1.8 1.8])
    set(gca,'YTick',-3:1:3)
    set(gca,'XTick',1:1:6)
    ylabel({'Increase in reward'}','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('Draw')
    
    set(gca,'box','off')

    % Number and title
    text(0-0.2, 1+0.2,'d','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Started with exploration','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');


end

