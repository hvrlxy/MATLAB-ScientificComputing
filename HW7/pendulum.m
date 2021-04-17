u = 0.1; g = 9.8; m = 10; L = 1.1;
y0 = [pi/2;0];
t0 = 0; tn = 5; n = 1000;
% y(1) is theta'(t), y(2) is u'(t)
f = @(t,y) [y(2); -u*y(2)/m - g*y(1)/L];
f(1,y0)
[tvec y] = rk4(f, t0, tn, y0, n);
g = @(t,y) [y(2); -u*y(2)/m - g * sin(y(1))/L];
[tvec y2] = rk4(g, t0, tn, y0, n);
plot(tvec,y(1, :), 'b', tvec, y2(1,:), 'r');