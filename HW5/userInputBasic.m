clf;    % Clear plotting window
axis([0 10 0 10]);   % Create basic coordinate system for plot window
hold on   
% Initially, the list of points is empty.
x= [];
y= [];
n = 0;

% Give instructions
disp('Left mouse button picks points.')
disp('Right mouse button ends list of points.')
% Stores integer value for which button is pressed
%    1 for left, 2 for middle, 3 for right
but = 1;  

% Loop, picking up the points, until user hits right mouse button
while but == 1
    [xi,yi,but] = ginput(1);    % Gets mouse click input
    plot(xi,yi,'ro');  % Plot point at mouse location - 'ro'=red circle
    n = n+1;
    x(n) = xi;      % Store x and y values
    y(n) = yi;
end

% Plot the splines
x1 = [x(1)];
y1 = [y(1)];
increase = x(1) < x(2);
for i =2:n
    [l l1] = size(x1);
    if x(i) > x1(l) && increase == true
        x1 = [x1;x(i)];
        y1 = [y1;y(i)];
    elseif x(i) < x1(l) && increase == true
        uvals = [min(x1):0.1:max(x1)]';
        S = @(u)pieceCubic_stub(x1,y1,u);
        splinevals = arrayfun(S,uvals);
        plot(uvals,splinevals,'b');   % 'b-' = blue line from data to data point
        x1 = [x1(l)];
        y1 = [y1(l)];
        increase = false;
    elseif x(i) < x1(l) && increase ~= true
        x1 = [x1;x(i)];
        y1 = [y1;y(i)];
    else 
        x1 = flip(x1);
        y1 = flip(y1);
        uvals = [min(x1):0.1:max(x1)]';
        S = @(u)pieceCubic_stub(x1,y1,u);
        splinevals = arrayfun(S,uvals);
        plot(uvals,splinevals,'b');
        x1 = [x1(l)];
        y1 = [y1(l)];
        increase = true;
    end
end
x
if increase == true
    x1
    uvals = [min(x1):0.1:max(x1)]';
    S = @(u)pieceCubic_stub(x1,y1,u);
    splinevals = arrayfun(S,uvals);
    plot(uvals,splinevals,'b');   % 'b-' = blue line from data to data point
else
    x1 = flip(x1)
    y1 = flip(y1);
    uvals = [min(x1):0.1:max(x1)]';
    S = @(u)pieceCubic_stub(x1,y1,u);
    splinevals = arrayfun(S,uvals);
    plot(uvals,splinevals,'b');
end
hold off