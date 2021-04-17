% draw letter S
[x1 y1] = plotBezier([1,1], [0,1], [0,0], [1,0]);
[x2 y2] = plotBezier([1,0], [2,0], [2,-1], [0,-1]);
plot(x1, y1, 'r', x2, y2,'r')

