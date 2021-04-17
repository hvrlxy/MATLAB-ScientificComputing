function I = compGaussQuad(f, a, b, n, numSubIntervals)
% Method to estimate the integral of f over [a,b]
% using an n-th order composite Gaussian Quadrature rule.
% INPUT:
% f - function handle in form f(x)
% a, b = endpts of interval for integration
% n = order of Gaussian Method used on each sub-interval
% OUPUT
% I - estimate of integral
I = 0;
as = [a:(b - a)/numSubIntervals:b];
for i=1:numSubIntervals
    I = I + gaussQuad(f,as(i),as(i+1),n);
end