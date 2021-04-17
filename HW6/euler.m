function [tvec, y] = euler(f, t0, tn, y0, n)
% Euler method to solve y'=f(t, y), with initial condition y0
% INPUT:  
%   f - function handle in form f(t, y)
%   t0, tn = endpts of interval for approximation
%   y0 = y(t0) Column vector of initial value of y
%   n = number of divisions of [t0,tn]
% OUPUT: 
%   tvec - vector of ti values
%   y - matrix whose columns are yi values at ti's

del_t = (tn-t0)/n;
m = length(y0);
y=zeros(m,n+1); % if we start t index at 0
y(:,1)= y0;
t= t0;
tvec = [t];
for k=1:n
    y(:,k+1)= y(:,k) + del_t * f(t, y(:,k));
    t = t + del_t;
    tvec = [tvec t];
end