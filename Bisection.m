function [xbest,fxbest,nitr,status] = ...
             Bisection(f, a, b, epsilon, delta, maxitr, loud)
%Bisection finds the zero of the function f in the interval [a,b]
%   Uses the bisection method to find the zero of the function f. 
%   Input: [f, a, b, epsilon, delta, maxitr]
%      f - function handle
%      a,b - interbval bounds
%      epsilon - the tolerance for |f(x)| to be considered 0
%      delta - the tolerance for x values to converge
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
   
   %check if delta is negative
   if delta <= 0
       fprintf('Input error: delta must be positive\n');
       status = 2;
       return;
   end
   
   %check if a and b forms a bracket
   if a > b
       fprintf('Input error: a and b must form a bracket\n');
       status = 2;
       return;
   end
   
   %check if root is a
   if f(a) == 0
       status = 0;
       xbest = a;
       fxbest = 0;
       return;
   end
   
   %check is root is b
   if f(b) == 0
       status = 0;
       xbest = b;
       fxbest = 0;
       return;
   end
   
   fa = f(a); 
   fb = f(b);
   fxhat = Inf;
   
   if sign(fa) == sign(fb) 
       fprintf('Sign Error: f(a) and f(b) have same sign\n');
       status = 2;
       return;
   end
   
   while nitr < maxitr && ...
         (abs(fxhat) > epsilon || abs(b-a) > delta) 
     xhat = (a+b)/2.0;
     fxhat = f(xhat);
     if sign(fxhat) == sign(fa) 
         a = xhat;
         fa = f(a);
     elseif sign(fxhat) == sign(fb)
         b = xhat;
         fb = f(b);
     else %% Unsuccessful termination of algorithm
         status = 2; 
         return
     end
     nitr=nitr+1;
   end
   
   xbest=xhat;
   fxbest=fxhat;
  if nitr<maxitr
    status=0;
  else
    status=1;
  end
end

