function updatePendulumPoint(pathRadius, p, theta)
   % Updates the positon of the center of the drawn dot
   %  This is the new center
   ptC = pathRadius*[cos(theta-pi/2), sin(theta-pi/2)];
   % The third component of the Position data is 2*r for dot
   posData = get(p,'Position');
   r = posData(3)/2;
   % new position vals (llx, lly, width, height) for Rectangle
   newPosData = [ptC(1)-r ptC(2)-r 2*r 2*r];
   set(p,'Position', newPosData); % LL corner of rectangle
end