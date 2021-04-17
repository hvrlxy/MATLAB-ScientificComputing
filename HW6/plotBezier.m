function [xs ys] = plotBezier(p1, p2, p3, p4)
xs =[];
ys = [];
for t = 0:0.01:1
    p = bezier(t, p1, p2, p3, p4);
    xs = [xs p(1)];
    ys = [ys p(2)];
end
plot(xs, ys);


