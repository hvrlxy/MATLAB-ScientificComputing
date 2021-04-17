%% Example of animating a mass (dot) on a circle

%% Set window axis range
range = 2.0; % axes bounds
axis ([-range range -range range]);

u = 0.1; g = 9.8; m = 10; L = 1.1;
y0 = [pi/2;0];
t0 = 0; tn = 5; n = 1000;
% y(1) is theta'(t), y(2) is u'(t)
g = @(t,y) [y(2); -u*y(2)/m - g * sin(y(1))/L];
[t thetaVals] = rk4(g, t0, tn, y0, n);

%% set up size of dot for our mass
massRadius = range/20; 
%% make the mass dot as a Rectangle graphics object
L = 1.1; % distance from circle center to mass center
mass = makePendulumPoint(L, thetaVals(1), massRadius);

%% h is the pause value (in seconds) for animation
h=0.005; i=1;
%% Loop through angle values, updating the position of the mass
while(i<=length(thetaVals))
    updatePendulumPoint(L, mass, thetaVals(1,i));
    drawnow limitrate % display updates
    pause(h); 
    i=i+1;
end