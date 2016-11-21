%WFREQ

% Cell array z stores the data:
z = {492, 'matrix'
     475, 'that'
     456, 'function'
     420, 'with'
     280, 'this'
     273, 'figure'
     261, 'example'
     226, 'which'
     201, 'functions'
     169, 'plot'
     158, 'using'
     154, 'file'
     150, 'command'
     140, 'from'
     135, 'vector'};
% Draw bar graph of first column of z.  cat converts to column vector.
h = barh(cat(1,z{:,1}));
n = length(z);
h.FaceColor = [.5 .25 .5]; % RGB values giving a purple.
set(gca,'YTickLabel',z(:,2))
set(gca,'YDir','reverse')  % Reverse order of y-values.
ylim([0 n+1])
grid
