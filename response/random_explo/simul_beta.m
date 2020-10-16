function [] = simul_beta()

    col = [0.39215686917305 0.474509805440903 0.635294139385223];

    betamat = 1./linspace(0.1,2.5,7);
    VAmat = 0:0.1:10;
    VB = 5;

    transp = linspace(1,0.1,size(betamat,2));

    for j=1:size(betamat,2)
        
        beta = betamat(j);

        for i=1:size(VAmat,2)

            VA = VAmat(i);

            p(i) = exp(VA*beta) / (exp(VA*beta)+exp(VB*beta));

        end

        ax_p(j) = plot(VAmat-VB, p, 'Color',[col transp(j)], 'LineWidth',2); hold on;

    end

    text(0-0.2, 1+0.2,'a','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title({'Simulation of value-based','random exploration'},'FontSize', 14, 'FontName','Arial', 'Fontweight','normal');

    xlabel('V(A) - V(B)','FontName','Arial','Fontweight','bold','FontSize',12);
    ylabel('P(choice = B)','FontName','Arial','Fontweight','bold','FontSize',12);
    xlim([-4.5,4.5])
    ylim([0,1.05])

    legend([ax_p(7), ax_p(1)], {'Small \beta', 'Large \beta'}, 'Location', 'SouthEast', 'FontSize',10)
    legend boxoff 
    
    set(gca,'box','off')

end