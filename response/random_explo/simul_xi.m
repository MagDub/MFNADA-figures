function [] = simul_xi()

    col = [0.39215686917305 0.474509805440903 0.635294139385223];

    epsmat = linspace(0,0.5,7);
    VAmat = 0:0.1:10;
    VB = 5;
    tau = 0.7;

    transp = linspace(1,0.1,size(epsmat,2));

    for j=1:size(epsmat,2)

        eps = epsmat(j);

        for i=1:size(VAmat,2)

            VA = VAmat(i);

            tmp = 1; 

            if VA>VB
                tmp = 1;
            else
                tmp=0;
            end

            p(i) = tmp * (1-eps) + eps/2;

        end

        ax_p(j) = plot(VAmat-VB, p, 'Color',[col transp(j)], 'LineWidth',2); hold on;

    end
    
    text(0-0.2, 1+0.2,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title({'Simulation of value-free','random exploration'},'FontSize', 14, 'FontName','Arial', 'Fontweight','normal');

    xlabel('V(A) - V(B)','FontName','Arial','Fontweight','bold','FontSize',12);
    ylabel('P(choice = B)','FontName','Arial','Fontweight','bold','FontSize',12);
    xlim([-4.5,4.5])
    ylim([0,1.05])

    legend([ax_p(1), ax_p(5)], {'Small \epsilon', 'Large \epsilon'}, 'Location', 'SouthEast', 'FontSize',10)
    legend boxoff 
    
    set(gca,'box','off')
    
end

