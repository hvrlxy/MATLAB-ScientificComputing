function[tvec y] = rk2(f, t0, tn, y0, n)
delta_t = (tn-t0)/n;
tvec = t0:delta_t:tn;
yi = y0;
y = [yi];
k1 = delta_t * f(t0, y0);
k2 = delta_t * f(t0 + delta_t/2, y0 + k1/2);
k3 = delta_t * f(t0 + delta_t/2, y0 + k2/2);
k4 = delta_t * f(t0 + delta_t/2, y0 + k3);

for i = 1:n
    yi = yi + (k1 + 2*k2 + 2*k3 + k4)/6;
    k1 = delta_t * f(tvec(i+1), yi);
    k2 = delta_t * f(tvec(i+1) + delta_t/2, yi + k1/2);
    k3 = delta_t * f(tvec(i+1) + delta_t/2, yi + k2/2);
    k4 = delta_t * f(tvec(i+1) + delta_t/2, yi + k3);
    y = [y yi];
end