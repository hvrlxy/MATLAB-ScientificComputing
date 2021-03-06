%draw the circle: I think if the proprtion of the axises are 
%cohesive, then it should produce a circle
t = [-4:0.1:4]';
y1 = sqrt(16 - abs(t.^2));
y2 = -y1;
uvals = [-4:0.1:4];
S1=@(u) pieceCubic_stub(t,y1,u);
S2=@(u) pieceCubic_stub(t,y2,u);
splinevals1 = arrayfun(S1, uvals);
splinevals2 = arrayfun(S2, uvals);
%plot(uvals,splinevals1,'b',uvals,splinevals2,'b');

%draw number 8
t = [-2:0.1:2]';
y1 = sqrt(4 - abs(t.^2)) + 2;
y2 = -y1 + 4;
uvals = [-2:0.1:2];
S1=@(u) pieceCubic_stub(t,y1,u);
S2=@(u) pieceCubic_stub(t,y2,u);
splinevals1 = arrayfun(S1, uvals);
splinevals2 = arrayfun(S2, uvals);

t = [-3:0.1:3]';
y3 = sqrt(9 - abs(t.^2)) - 3;
y4 = -y3 - 6;
uvals2 = [-3:0.1:3];
S3=@(u) pieceCubic_stub(t,y3,u);
S4=@(u) pieceCubic_stub(t,y4,u);
splinevals3 = arrayfun(S3, uvals2);
splinevals4 = arrayfun(S4, uvals2);

%plot(uvals,splinevals1,'b',uvals,splinevals2,'b',uvals2,splinevals3,'b',uvals2,splinevals4,'b');

%draw letter T
t = [-2:0.1:2]';
y1 = 3 + sin(t);
t2 = [-2:0.1:0.08]';
y2 = tan(t2 - 1.9);
uvals = [-2:0.1:2];
uvals2 = [-2:0.1:0.08];
S1=@(u) pieceCubic_stub(t,y1,u);
S2=@(u) pieceCubic_stub(t2,y2,u);
splinevals1 = arrayfun(S1, uvals);
splinevals2 = arrayfun(S2, uvals2);
%plot(uvals,splinevals1,'b',uvals2,splinevals2,'b');

%draw letter S
t = [-pi:0.1:pi]';
y1 = sin(t);
uvals = [-pi:0.1:pi];
S1=@(u) pieceCubic_stub(t,y1,u);
splinevals1 = arrayfun(S1, uvals);
plot(-splinevals1,uvals,'b');

