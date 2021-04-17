%% Example of animating a mass (dot) on a circle

%% Set window axis range
range = 2.0; % axes bounds
axis ([-range range -range range]);

%% set up a range of angles for motion
t1 = [0:0.1:pi/2]; t2=[pi/2:-0.1:0]; 
thetaVals = [t1 t2];
%% set up size of dot for our mass
massRadius = range/20; 
%% make the mass dot as a Rectangle graphics object
L = 1.1; % distance from circle center to mass center
mass = makePendulumPoint(L, thetaVals(1), massRadius);

%% h is the pause value (in seconds) for animation
h=0.05; i=1;
%% Loop through angle values, updating the position of the mass
while(i<=length(thetaVals))
    updatePendulumPoint(L, mass, thetaVals(i));
    drawnow limitrate % display updates
    pause(h); 
    i=i+1;
end
