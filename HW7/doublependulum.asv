g = 9.8; m1 = 2; m2 = 1.5; L1 = 0.6; L2 = 0.8;
M = m1 + m2;;
% y1 = o'1, y2 = o''1, y3 = o'2, y4 = o''2
y1 = L1 * (cos(O)^2 * m2 - M);
y2 = L2 * (cos(O)^2 * m2 - M);
y0 = [0;0;pi/4;0;-pi/4];
t0 = 0; tn = 5; n = 1000;
% run the algorithm
f = @(t,y) [y(2); 1/y1 * (m2 * (sin(y(5))*L1*y(2)^2 - sin(y(3))*g) * cos(y(5)) + m2 * y(4)^2*L2*sin(y(5)) + g*M*sin(y(1))); y(4); 1/y2*(-cos(y(5))*sin(y(5))*L2*m2 * y(4)^2 - M*L1*sin(y(5))*y(2)^2 - M*sin(y(1))*cos(y(5))*g + M*sin(y(3))*g); y(1)-y(3)];
[tvec y] = rk4(f, t0, tn, y0, n);
plot(tvec,y(1, :), 'b', tvec, y(3,:), 'r');