% first store the 5 points in vectors x and y
x = [-pi:2*pi/4:pi];
y = sinh(x);
x = x.';
y = y.';

[a, status] = InterpV(x,y);
g = @(n) a(1) + a(2)*n + a(3) * n.^2 + a(4) * n.^3 + a(5) * n.^4;

xs = [-3/2 * pi:0.01:3/2 * pi];
% ys of g
y1 = g(xs);
% ys of sinh(x)
y2 = sinh(xs);


%next, do the same process with function f
f = @(n) 1./(1 + n.^2);
y = f(x);

[a, status] = InterpV(x,y);
h = @(n) a(1) + a(2)*n + a(3) * n.^2 + a(4) * n.^3 + a(5) * n.^4;

% ys of h
y3 = h(xs);
% ys of f(x)
y4 = f(xs);


% plot of sinh(x) is blue, g is green, h is yellow and f(x) is red
plot(xs, y1, 'g', xs, y2, 'b', xs, y3, 'y', xs, y4, 'r')

% Upon running the program and looking at the graphs it produces, we can
% observe that even though the interpolating polynomial interpolate
% the given function quite closely in the interval we chosen, it does
% not interpolate the data outside of that region at all.
