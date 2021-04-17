%% Test of first version of Bisection
f = @(x) x^3-3*x^2+1; % Define f as an anonymous function
a=0; b=2; esp = 0.001; delta = 0.001; maxitr = 100;
[x, fx, M, s] = Bisection_1(f,a,b,esp,delta,maxitr);
fprintf("Solution: x=%f, f(x)=%f, numIters = %d, status = %d\n",[x;fx;M;s]); 