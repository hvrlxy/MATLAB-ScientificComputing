syms x;
f= @(x)x.^3-2*x-5;
g1 = diff(f(x));
g1 = diff(f(x),2);
f1 = @(y) subs(g1,y);
f2 = @(y) subs(g2,y);
a=0;   b=200000;                           
eps=0.000001;  
maxIters= 50; 
[xm, fm, s, iter] = hybrid(f, f1, f2, a, b, eps, maxIters)
%[xm, fm, s, iter] = goldenOptimizer(f, a, b, eps, maxIters)
if s == 0
    x=0:0.01:2;
    plot(x,f(x),xm, fm, 'o');
end