% In order to find the root for E of the formula for the Kepler Law of
% Orbital with wt = 0.4337 and e = 0.1, we need to solve for the equation
% E = 0.4337 + 0.1*sin(E), or 0.4337 - E + 0.1*sin(E). Since we know that
% the sin function has the bound of -1 <= sin(E) <= 1, we have -10 <= 
% (E - 0.4337) <= 10, or -9.5663 <= E <= 10.4337. Knowing the boundary of E
% we can easily find the root of the equation using Matlab fzero function.

f = @(E) 0.4337 - E + 0.1*sin(E);
[xbest, fxbest, status] = fzero(f, -9.5663)

% The program out xbest = 0.4799, fxbest = 3.4694e-17, so the root for the
% equation is E = 0.4799.