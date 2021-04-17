function [v] = Velocity(theta, m, alpha, w, d)
    % this function should return the initial velocity needed to throw an
    % object to a given distance d, where:
    % theta - initial angle
    % m - mass of the object
    % alpha - drag coefficient
    % w - wind velocity
    % d - target distance
    
    f = @(v) ProjectileLanding(theta, v, m , alpha, w) - d;
    % Since the initial velocity if w = 0 and there is no drag coefficient
    % is v0 = d/cos(theta) * t, I think a good initial guess for v0 is
    % d/cos(theta)
    v0 = d/cos(theta);
    v = fzero(f, v0);
    return;