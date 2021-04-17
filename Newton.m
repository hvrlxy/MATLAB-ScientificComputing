function [xbest, fxbest, nitr, status] = ...
             Newton(f, fp, x0, epsilon, maxitr, loud)
%   Uses the Newton method to find the zero of the function f. 
%   Input: [f, fp, x0, epsilon, maxitr, loud]
%      f - function handle
%      fp - derivative function of f
%      x0 - initial guess at the roots
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
   
   fxhat = Inf;
   xhat = x0;
   
   while nitr < maxitr && ...
         abs(fxhat) > epsilon
     if abs(fp(xhat)) < epsilon
         status = 1;
         return;
     end
     
     xhat = xhat - f(xhat)/fp(xhat);
     fxhat = f(xhat);
     nitr = nitr + 1;
   end
   
   xbest=xhat;
   fxbest=fxhat;
  if nitr<maxitr
    status=0;
  else
    status=1;
  end
end