function [ xmin, fmin, status, iter ] = goldenOptimizer(f, a, b, eps, maxIters)
% Golden Section Bracket method to find minimum of a function on [a,b]
%  method assumes there is a muinimum in [a,b]
% INPUT:  
%   f - function handle in form f(x)
%   a, b = endpts of interval for finding minimum
%   eps = tolerance for minimum value
%   maxIters = maximum number of allowed iterations of method
% OUPUT: 
%   xmin - x value of minimum
%   fmin - f value of min
%   status - 0 if successful, -1 if unsuccessful
 min = eps+1;
 status = -1;
 iter = 0;
 xleft = a;
 xright = b;
 tau=double((sqrt(5)-1)/2);
 
 while abs(xright-xleft) > eps && iter < maxIters
    x1 = xleft + (1-tau)*(xright-xleft);
    x2 = xleft + tau*(xright-xleft);
    f1 = f(x1); f2 = f(x2); 
    if f1 < f2
        xright = x2;
    else 
        xleft = x1;
    end
    iter = iter + 1;
 end
 
 if iter == maxIters
     xmin = 0;
     fmin = 0;
     status = 1;
     fprintf('Hit max number of iterations\n');
     return
 end
 status = 0;
 if f1 < f2
     xmin = x1;
     fmin = f1;
 else 
     xmin = x2;
     fmin = f2;
 end 
 

