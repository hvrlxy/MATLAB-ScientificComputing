u = 8; g = 9.81; m = 68.1; L = 30; c = 0.25; k = 40;
y0 = [0;0];
t0 = 0; tn = 30; n = 1500; eps = 40; min_del_t=10e-2;
% y(1) is theta'(t), y(2) is u'(t)
f = @(t,y) [y(2); g-sign(y(2))*(c*y(2)^2)/m-(k/m)*(y(1) - L)-u/m *y(2)];
[tvec1 y1] = eulerAdaptive2(f, t0, tn, y0, n, eps, min_del_t);
[tvec2 y2] = rk4(f, t0, tn, y0, n);
plot(tvec1,y1(1, :), 'b', tvec1,y1(2,:),'b--',tvec2,y2(1,:),'r', tvec2,y2(2,:),'r--');