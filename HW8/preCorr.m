function [tvec, y] = preCorr(f, t0, tn, y0, n)
% INPUT:  
%   f - function handle in form f(t, y)
%   t0, tn = endpts of interval for approximation
%   y0 = y(t0) Column vector of initial value of y
%   n = number of divisions of [t0,tn]
% OUPUT: 
%   tvec - vector of ti values
%   y - matrix whose columns are yi values at ti's
[tvec y] = rk4(f, t0, tn, y0, n);
for i=2:size(y)-1
    h = y(i) - y(i-1);
    y(i+1) = y(i) + h/12 * (23*f(tvec(i),y(i)) - 16*f(tvec(i-1),y(i-1)) + 5*f(tvec(i-2),y(i-2)));
    y(i+1) = y(i) + h/12 * (5*f(tvec(i+1),y(i+1)) - 8*f(tvec(i),y(i)) + f(tvec(i-1),y(i-1)));
end
plot(tvec, y);
end