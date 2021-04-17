function v = pieceCubic(t,y,uval)
 % v = piececubic(t,y,uval) finds the piecewise cubic value of S(t)
 %  with S(t(j)) = y(j) and returns v = S(u).
 %INPUT: t - column vector of knots
 %       y - column vector of y vals
 %       u - value (scalar) input to Spline S
 %OUPUT: v = value (scalar) given by S(u)
 
 %  Find subinterval index k so that 
 %     t(i) <= u < t(i+1) or u= t(i+1)
 n = length(t);
 i=-1;  
 for j = 1:n-1
     if  (t(j) <= uval && uval <  t(j+1)) || uval==t(j+1)
          i = j;
     end
 end
 if i<0 
    fprintf('Abort: u value is not in spline interval\n');
    return
 end

 % Calculate all intermediate values for splines
 h = diff(t); %Built-in Matlab differences command
 b = (diff(y))./h;
 v = 2 * (h(2:n-1) + h(1:n-2));
 v = [[0];v];
 u = 6 * (b(2:n-1) - b(1:n-2));
 u = [[0];u];
 A = zeros(n-2,n-2); %% Tridiagonal matrix
 A(1,1) = v(2); A(1,2) = h(2); % Top row
 for j = 2:n-3
      A(j,j-1) = h(j); A(j,j) = v(j+1); A(j,j+1) = h(j+1);
 end
 A(n-2,n-3) = h(n-2); A(n-2,n-2) = v(n-1); % Bottom row
 
 [z_partial, status] = TDMS(A, u(2:n-1)); % Solve the system 
 z=[0 z_partial.' 0 ]; % add end conditions
 
 %  Evaluate spline at u
 d1 = (1/6)*z(i + 1)/h(i);
 d2 = (1/6)*z(i)/h(i);
 d3 = y(i + 1)/h(i)- z(i + 1) * h(i)/6;
 d4 = y(i)/h(i) - z(i) * h(i)/6;
 v = d1 * (uval -t(i))^3 + d2 * (t(i + 1) - uval)^3 + d3 * (uval - t(i)) + d4 *(t(i + 1) - uval);



