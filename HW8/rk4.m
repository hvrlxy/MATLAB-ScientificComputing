function [tvec, y] = rk4(f, t0, tn, y0, n)
% Ruge-Kutta Order 4 method to solve y'=f(t, y), with initial condition y0
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
y(:,1)=y0;
t=t0;
for k=1:n
    k1 = del_t*f(t, y(:,k));
    k2 = del_t*f(t+del_t/2, y(:,k)+k1/2);
    k3 = del_t*f(t+del_t/2, y(:,k)+k2/2);
    k4 = del_t*f(t+del_t, y(:,k)+k3);
    y(:,k+1)=y(:,k)+(k1+2*k2+2*k3+k4)/6;
    t = t+del_t;
end
tvec = [t0:del_t:tn]