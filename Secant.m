function [xbest, fxbest, nitr, status] = ...
             Secant(f, x0, x1, epsilon, maxitr, loud)
%   Uses the secant method to find the zero of the function f. 
%   Input: [f, x0, x1, epsilo, maxitr, loud]
%      f - function handle
%      x0,x1 - guess at the roots
%      epsilon - the tolerance for |f(x)| to be considered 0
%      maxitr - the maximum number of iterations allowed
%   Does error checking on the function values on a and b. 
%   Returns [xbest, fxbest, nitr, status]
%      xbest = best estimate of zero of f in [a,b]
%      fxbest = f(xbest)
%      nitr = number of iterations for algorithm to terminate
%      status - 0 if successful, 1 if max iterations reached,
%               2 if some other error
   nitr = 0;
   xbest=NaN;
   fxbest=NaN;
   
   %check if epsilon is negative
   if epsilon <= 0
       fprintf('Input error: epsilon must be positive\n');
       status = 2;
       return;
   end

   %check if root is x0
   if abs(f(x0)) <= epsilon
       status = 0;
       xbest = x0;
       fxbest = f(x0);
       return;
   end
   
   %check is root is x1
   if abs(f(x1)) <= epsilon
       status = 0;
       xbest = x1;
       fxbest = f(x1);
       return;
   end
   
   fxhat = Inf;
   
   while nitr < maxitr && ...
         (abs(x1 - x0) > epsilon) 
     if abs(fxhat) <= epsilon
         xbest=xhat;
         fxbest=fxhat;
         status = 0;
         return;
     end
     if f(x0) == f(x1)
         status = 1;
         return;
     else
         xhat = x0 - f(x0) * (x0 - x1)/(f(x0) - f(x1));
         x0 = x1;
         x1 = xhat;
         nitr = nitr + 1;
         fxhat = f(xhat);
     end
   end
   
   xbest=xhat;
   fxbest=fxhat;
  if nitr<maxitr
    status=0;
  else
    status=1;
  end
end