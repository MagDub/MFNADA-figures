
function [] = render_param_recovery()
    
    
    %% Data
    load('../../data_for_figs/out_sim_thompson.mat')
    load('../../data_for_figs/4pd_param_bounds.mat')

    %% Parameter and parameter names

    n_per_dim = 5;
    n_param = 7;

    param_legends{1} = '\sigma_0_,_1';
    param_legends{2} = '\sigma_0_,_2';
    param_legends{3} = 'Q_0';
    param_legends{4} = '\epsilon_1';
    param_legends{5} = '\epsilon_2';
    param_legends{6} = '\eta_1';
    param_legends{7} = '\eta_2';


    %% Figure
    set(gca,'FontName','Arial','FontSize',10)
    set(gca,'TickLabelInterpreter','tex')
    hold on

        for j = 1:n_param 
            for i = 1:n_param 
                rho = corr(out.fitted(:,i),out.org(:,j), 'rows','complete', 'Type','Pearson');
                parameter_recov_mat(j,i) = rho;
            end
        end

    imagesc(abs(parameter_recov_mat))
    xticks([1 2 3 4 5 6 7])
    xlim([0.5 7.5])
    xticklabels({param_legends{1}, param_legends{2}, param_legends{3}, param_legends{4}, param_legends{5}, param_legends{6}, param_legends{7}})
    yticks([1 2 3 4 5 6 7])
    ylim([0.5 7.5])
    yticklabels({param_legends{1}, param_legends{2}, param_legends{3}, param_legends{4}, param_legends{5}, param_legends{6}, param_legends{7}})

    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',10, 'YDir', 'reverse')

    inter = 100;

    firstcol =[0.87058824300766 0.921568632125854 0.980392158031464];
    secondcol = [0.39215686917305 0.474509805440903 0.635294139385223];

    linspace_b_y_1 = [linspace(firstcol(1),secondcol(1),inter)]; 
    linspace_b_y_2 = [linspace(firstcol(2),secondcol(2),inter)]; 
    linspace_b_y_3 = [linspace(firstcol(3),secondcol(3),inter)]; 

    mycolors = ([[linspace_b_y_1]', [linspace_b_y_2]', [linspace_b_y_3]']);

    colormap(mycolors);

    h = colorbar('Ticks',0:0.2:1); 
    caxis([0 1])

    title(h,'r','Interpreter','tex')

    textStrings = num2str(parameter_recov_mat(:), '%0.2f');       % Create strings from the matrix values
    textStrings = strtrim(cellstr(textStrings));  % Remove any space padding
    [x, y] = meshgrid(1:n_param);  % Create x and y coordinates for the strings

    % Upper diag
    for i_=1:size(x,1)-1
        x(i_,i_+1:size(x,1)) = nan;
    end

    % Lower diag
    for i_=1:size(x,1)-1
        x(i_+1,1:i_) = nan;
    end

    hStrings = text(x(:), y(:), textStrings(:),'HorizontalAlignment', 'center');
    midValue = mean(get(gca, 'CLim'));  % Get the middle value of the color range
    
    % Number and title
    text(0-0.15, 1+0.18,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Parameter recovery','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

end


