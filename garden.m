%GARDEN

months = {'June','July','August','September','October'}; % Rows.
vegetables = {'Lettuce','Green Beans','Potatoes',...
               'Swiss Chard','Pumpkins'}; % Columns.
Y = [0.4 0.3 0.0 0.0 0.0
     0.6 0.4 0.0 0.0 0.0
     0.7 0.8 0.3 0.2 0.0
     0.6 0.5 0.9 0.4 1.1
     0.4 0.4 0.7 0.6 1.6];

t = [19.5 21 24 21 18]; % Temperature.

% Make sure y-axes are black; by default they use axes color order.
fig = figure;
set(fig,'defaultAxesColorOrder',[0 0 0; 0 0 0]);

yyaxis left
b = bar(Y,'stacked');
ylabel('Yield (kg)'), ylim([0 4])

%                 RGB values
b(1).FaceColor = [0.5  1.0 0.25]; % Light green (tuned for printing).
b(2).FaceColor = [0    0.6 0];    % Mid green.
b(3).FaceColor = [0.9  0.9 0];    % Mid yellow.
b(4).FaceColor = [0.75 0   0];    % Mid red.
b(5).FaceColor = [1    0.5 0];    % Orange.

set(gca,'XTickLabel',months)

% Create a second axis at same location as first and plot to it.
yyaxis right
p = plot(t,'Marker','square','MarkerSize',10,'LineStyle','-',...
           'LineWidth',2,'MarkerFaceColor',[.6 .6 .6]);

ylabel('Degrees (Celsius)')
t = title('Fran''s vegetable garden','FontSize',14);
% Raise title slightly to avoid clash with marker.
t.Position = t.Position + [0 0.05 0];

% Make second y-axis tick marks line up with those of first.
h2 = gca;
ylimits = h2.YLim;
yinc = (ylimits(2)-ylimits(1))/4;
h2.YTick = [ylimits(1):yinc:ylimits(2)];

% Give legend the Axes handles and place top left.
legend([b,p],vegetables{:},'Temperature','Location','NW')
