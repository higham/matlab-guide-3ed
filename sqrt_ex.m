%SQRT_EX
% Script plotting a point on the unit circle and its two square roots,
% with the right half-plane shaded.

z = -1 + 1i; z = z/abs(z);                % Point z on unit circle.
s = sqrt(z);

% Create Axes with specified range.
a = 1.75;
h = axes('XLim',[-a a],'YLim',[-a a]);

fill([0 a a 0],[-a -a a a],[.8 .8 .8]) % Shade right half-plane.
hold on

options1 = {'MarkerSize',8,'MarkerFaceColor','black'};
options2 = {'Color','k','LineWidth',1};
plot(z,'s',options1{:})
line([0 real(z)],[0 imag(z)],options2{:})
plot(s,'d',options1{:})
line([0 real(s)],[0 imag(s)],options2{:})
plot(-s,'d',options1{:})
line([0 -real(s)],[0 -imag(s)],'LineStyle',':',options2{:})

% Unit circle.
rectangle('Position',[-1,-1,2,2],'Curvature',[1,1],'LineStyle','--',...
          'LineWidth',0.75)
axis square tight

% Draw x- and y-axes through origin.
plot([-a a], [0 0], '-k'), plot([0 0], [-a a], '-k')
set(h,'XTick',[],'YTick',[])

options = {'Interpreter','latex'};
xlabel('$\mathrm{Re} \lambda$',options{:})
ylabel('$\mathrm{Im} \lambda$','Rotation',0,'HorizontalAlignment',...
       'right', options{:})

text(real(z)-0.1,imag(z)+0.2,'$\lambda$','HorizontalAlignment','center',...
     options{:})
text(-0.1,0.05,'0','HorizontalAlignment','right','VerticalAlignment','top')
text(real(s),imag(s)+0.2,'$\lambda^{1/2}$',options{:})
text(-real(s),-imag(s)-0.25,'$-\lambda^{1/2}$', ...
     'HorizontalAlignment','right',options{:})
hold off

% Reset FontSize for all text.
g = findall(gca,'type','text'); set(g,'Fontsize',14)
