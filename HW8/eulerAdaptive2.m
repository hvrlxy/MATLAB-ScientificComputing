function [tvec, y] = eulerAdaptive2(f, t0, tn, y0, n, eps, min_del_t)
% Adaptive Euler Forward method to solve y'=f(t, y), initial condition y0
% INPUT:  
%   f - function handle in form f(t, y)
%   t0, tn = endpts of interval for approximation
%   y0 = y(t0) Column vector of initial value of y
%   n = number of divisions of [t0,tn]
%   eps = adaptive error threshold
% OUPUT: 
%   tvec - vector of ti values
%   y - matrix whose columns are yi values at ti's

del_t = (tn-t0)/n;
m = length(y0);
y=zeros(m,n+1); % if we start t index at 0
y(:,1)=y0;
tvec = zeros(1,n+1);
tvec(1) = t0;
t=t0; k = 1; 
while t <= tn
    yhat = y(:,k)+del_t*f(t, y(:,k));
    ystar = y(:,k)+(del_t/2)*f(t, y(:,k))+ ...
        (del_t/2)*f(t+del_t/2, y(:,k)+del_t*f(t, y(:,k)));
    ybar = 2*ystar-yhat;
    r = norm(yhat - ystar)/del_t;
    if r < eps || del_t < min_del_t% accept estimate
        y(:,k+1) = ybar;
        t = t+del_t;
        tvec(k+1) = t;
        k = k+1;
    else % reduce del_t, keep lower min
        del_t = max(min_del_t, (0.9*eps/r)*del_t);
    end 
end
