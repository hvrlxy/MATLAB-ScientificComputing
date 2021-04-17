function [fInt] = trap_comp(f, a, b, n)
% Trapezoidal method to find the integral of f from a to b 
%    using a partition wiuth n sub-intervals
% INPUT:  
%   f - function handle in form f(x)
%   a, b = endpts of interval for integration
%   2n = number of (equal-sized) divisions of [a,b]
% OUPUT: 
%   fInt - approximation of integral

h = (b-a)/(2*n);
f_sum = f(a);
for i=1:2*n-1
    xi = a + i*h;
    f_sum = f_sum + 2*f(xi); 
end
f_sum = f_sum + f(b);
fInt = (h/2)*f_sum; 
