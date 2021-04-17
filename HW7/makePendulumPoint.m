function p = makePendulumPoint(pathRadius, theta, r)
% Creates a Rectangle object with rounded corners (kind of a circle)
%   whose center is at pathRadius*[cos(theta-pi/2), sin(theta-pi/2)]
% Interpret theta as an angle CCW from the downward direction.
  ptC = pathRadius*[cos(theta-pi/2), sin(theta-pi/2)];
  % Create rounded rectangle (dot) with center at ptC, radius r
  p = rectangle('Position', [ptC(1)-r ptC(2)-r 2*r 2*r],...
    'Curvature', [1, 1], 'FaceColor', 'blue');
end