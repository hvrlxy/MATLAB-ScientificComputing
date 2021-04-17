function I = gaussQuad(f, a, b, n)
% Method to estimate the integral of f over [a,b]
% using an n-th order Gaussian Quadrature rule.
% INPUT:
% f - function handle in form f(x)
% a, b = endpts of interval for integration
% n = order of Gaussian Method
% OUPUT
% I - estimate of integral
I = 0;
[x w] = gl_weight(n);
for i = 1:n
    x(i) = (b - a)/2 * x(i) + (b + a)/2;
    I = I + w(i)*f(x(i)) * (b - a)/2;
end
