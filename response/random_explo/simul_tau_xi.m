clear
close all;

figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',9)
hold on
col = [0.39215686917305 0.474509805440903 0.635294139385223];

epsmat = linspace(0,0.5,9);
VAmat = 0:0.1:10;
VB = 5;
tau = 0.7;

transp = linspace(1,0.1,size(epsmat,2));

for j=1:size(epsmat,2)
    
    eps = epsmat(j);

    for i=1:size(VAmat,2)

        VA = VAmat(i);

        tmp = exp(VA./tau) / (exp(VA./tau)+exp(VB./tau));
        

        p(i) = tmp * (1-eps) + eps/2;

    end

    ax_p(j) = plot(VAmat-VB, p, 'Color',[col transp(j)], 'LineWidth',2); hold on;

end

% t=title('Epsilon simulation','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

xlabel('V(A) - V(B)','FontName','Arial','Fontweight','bold','FontSize',12);
ylabel('P(choice = B)','FontName','Arial','Fontweight','bold','FontSize',12);
xlim([-4.5,4.5])

legend([ax_p(1), ax_p(7)], {'Small \epsilon', 'Large \epsilon'}, 'Location', 'SouthEast', 'FontSize',10)
legend boxoff 

addpath('../../../export_fig/')
export_fig('Fig_simul_tau_xi.tif','-nocrop','-r200')