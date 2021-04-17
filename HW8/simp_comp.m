function [fInt] = simp_comp(f, a, b, n)
% Composite Simpson's method to find the integral of f from a to b 
%    using a partition wiuth n sub-intervals
% INPUT:  
%   f - function handle in form f(x)
%   a, b = endpts of interval for integration
%   n = number of (equal-sized) divisions of [a,b]
% OUPUT: 
%   fInt - approximation of integral
h = (b-a)/(2*n);
f_sum = f(a);
for i=1:2:2*n-1
    xi = a + i*h;
    xi1 = a + (i+1)*h;
    f_sum = f_sum + 4*f(xi) + 2*f(xi1);
end
f_sum = f_sum + f(b);
fInt = (h/3)*f_sum; 

%test the integral -1.25*y^2 +8.5*y - 2.25 from 1 to 5
%the correct answer for the integration is 41.3333
%is we use the composite Simpson with n = 10, we get
%42.5333, but if we increase n, we get a more accurate answer
%At n = 100000, the simp_comp give the answer of 41.3335, which is very
%close to the correct answer.

