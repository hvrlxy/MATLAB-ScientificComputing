%% Example of animating a mass (dot) on a circle

%% Set window axis range
range = 2.0; % axes bounds
axis ([-range range -range range]);

g = 9.8; m1 = 2; m2 = 1.5; L1 = 0.6; L2 = 0.8;
M = m1 + m2;
O = -pi/4;
% y1 = o'1, y2 = o''1, y3 = o'2, y4 = o''2
y1 = L1 * (cos(O)^2 * m2 - M);
y2 = L2 * (cos(O)^2 * m2 - M);
y0 = [0;0;pi/4;0];
t0 = 0; tn = 5; n = 1000;
% run the algorithm
f = @(t,y) [y(2); 1/y1 * (m2 * (sin(O)*L1*y(2)^2 - sin(y(3))*g) * cos(O) + m2 * y(4)^2*L2*sin(O) + g*M*sin(y(1))); y(4); 1/y2*(-cos(O)*sin(O)*L2*m2 * y(4)^2 - M*L1*sin(O)*y(2)^2 - M*sin(y(1))*cos(O)*g + M*sin(y(3))*g)];
[t thetaVals] = rk4(f, t0, tn, y0, n);

%% set up size of dot for our mass
massRadius = range/20; 
%% make the mass dot as a Rectangle graphics object
L = 1.1; % distance from circle center to mass center
mass1 = makePendulumPoint(L, thetaVals(1), massRadius);
mass2 = makePendulumPoint(L, thetaVals(3), massRadius);

%% h is the pause value (in seconds) for animation
h=0.005; i=1;
%% Loop through angle values, updating the position of the mass
while(i<=length(thetaVals))
    updatePendulumPoint(L, mass1, thetaVals(1,i));
    updatePendulumPoint(L, mass2, thetaVals(3,i));
    drawnow limitrate % display updates
    pause(h); 
    i=i+1;
end