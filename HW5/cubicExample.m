t = [-6:1:6]'; % knot vector
y = sqrt(abs(t));
uvals = [-6:0.1:6]'; %% set of values to plot for spline
S=@(u) pieceCubic_stub(t,y,u);  % Spline function
splinevals = arrayfun(S, uvals); % apply S to all the values in uvec
plot(t,y,'o',uvals,splinevals,'-');