%PNORM_PLOT    Plot p-norms of a vector.

n = 10; m = 100;
x = 1:n;
y = zeros(m,1);

pvals = linspace(1,10,m);
for i = 1:m
    y(i) = norm(x,pvals(i));
end

plot(pvals,y,'LineWidth',2)
ylim([0 inf])
options = {'Interpreter','latex','FontSize',14};
ylabel('$\|x\|_p$',options{:},'Rotation',0,'HorizontalAlignment','right')
xlabel('$p$',options{:})
title(['\slshape Vector $p$-norm, for $x =' ...
       '[1,2,\dots,' int2str(n) ']^T$'], options{:})

s = '$$\|x\|_p = \biggl(\sum_{i=1}^n|x_i|^p\biggr)^{1/p}$$';
text(options{:},'String',s,'Position',[3 40])
