a=4; b=4; c=3; d=2;
% y(1) =x represents prey, y(2)=y represents pedators
f = @(t,y) [a*y(1)-b*y(1)*y(2); -c*y(2) + d*y(1)*y(2)];      
y0=[2;1];
[t,y]=euler(f, 0, 10, y0, 800);
plot(t, y(1,:), 'b', t, y(2,:), 'r');
