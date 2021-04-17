f=@(t,y) (t+y); % IVP with t0=0, tn=1, y0=3
t0=0; tn=10; y0=3; n=10;
[t,y]=euler(f, t0, tn, y0, n); % Euler forward
[t,yrk2] = rk2(f, t0, tn, y0, n, [1/3 2/3 3/4 3/4]) % rk2
[t,yrk4] = rk4(f, t0, tn, y0, n) % rk4  
clf
hold on
plot(t,y,'g'); % Euler Forward  Solution
plot(t,yrk2,'r'); % RK2 Ralston  Solution
plot(t,yrk4,'o'); % RK4 Solution
g=@(t) (4*exp(t)-t-1); % Actual solution to IVP
y=arrayfun(g,t);
plot(t,y,'k') % Actual solution plot in black
hold off