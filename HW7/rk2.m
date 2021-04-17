function[tvec y] = rk2(f, t0, tn, y0, n, rk2const)
b1 = rk2const(1);
b2 = rk2const(2);
a2 = rk2const(3);
c2 = rk2const(4);
delta_t = (tn-t0)/n;
tvec = t0:delta_t:tn;
yi = y0;
y = [yi];
k1 = delta_t * f(t0, y0);
k2 = delta_t * f(c2*delta_t + t0, y0 + a2 * k1);
for i = 1:n
    yi = yi + b1*k1 + b2*k2;
    k1 = delta_t * f(tvec(i + 1), yi);
    k2 = delta_t * f(c2 * delta_t + tvec(i + 1), yi + a2 * k1);
    y = [y yi];
end