function [y] = polyEval(a, x)
y=nan;
if size(a,2) ~= 1 || size(x,2) ~= 1
   fprintf('Error: a and x must be column vectors\n');
   return
end
 % evaluates p(x) = a(1) + a(2)*x + ... + a(n)*x^{n-1}
 % on all values of vector x and store result in y
  n = length(a);
  xx = x(:); % copy of original x
  y = a(1)*ones(length(x), 1); % create column vector of constant term
  if length(a) ==1
      return
  end
  
  for i = 2:n
      y = y + a(i)*xx;
      xx = x.*xx; % get next power of x
  end
  
% Example of use:   
% a=[1;0;1];  % 1 + x^2 
% x=[-1;0;1;2;3];
% [y] = polyEval(a,x) % returns [2;1;2;5;10]