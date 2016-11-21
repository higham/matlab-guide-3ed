%BEZIER_PLOT    Plot bezier curve and control polygon.

P = [0.1 0.3 0.7 0.8;
     0.3 0.8 0.6 0.1];
axis([0 1 0 1])
hold on

u = 0:.01:1;
umat = [(1-u).^3; 3.*u.*(1-u).^2; 3.*u.^2.*(1-u); u.^3];
Curve = P*umat;
fill(P(1,:),P(2,:),[.8 .8 .8])                 % Shaded control polygon.
plot(Curve(1,:),Curve(2,:),'k-','linewidth',2) % Bezier curve.

plot(P(1,:),P(2,:),'o','MarkerFaceColor','k')  % Control points.

text(0.35,0.35,'control polygon')
text(0.05,0.3,'P_1')
text(0.25,0.8,'P_2')
text(0.72,0.6,'P_3')
text(0.82,0.1,'P_4')
hold off
