% DATA SET OF SIZE 2
x1 = [2 ; 3];
y1 = [-7 ; 15];
[a1, status] = InterpV(x1, y1);

[y] = polyEval(a1, x1);
[my ny] = size(y);

% check if the function produce the correct answer
s = 1; % set the flag
for i = 1:my
    if abs(y(i) - y1(i)) > 1e-10
        s = 0;
    end
end

% check if the flag is set and print out accordingly
if s == 1
    fprintf("The first data set produces the correct polynomial.\n");
else
    fprintf("The first data set produces the wrong polynomial.\n");
end

% DATA SET OF SIZE 3
x2 = [2 ; 4 ; -7];
y2 = [5 ; -11 ; 9];
[a2, status] = InterpV(x2, y2);

[y] = polyEval(a2, x2);
[my ny] = size(y);

% check if the function produce the correct answer
s = 1; % set the flag
for i = 1:my
    if abs(y(i) - y2(i)) > 1e-10
        s = 0;
    end
end

% check if the flag is set and print out accordingly
if s == 1
    fprintf("The second data set produces the correct polynomial.\n");
else
    fprintf("The second data set produces the wrong polynomial.\n");
end

% DATA SET OF SIZE 4
x3 = [-5 ; 11 ; 7 ; 18];
y3 = [6 ; 9 ; 4 ; 5];
[a3, status] = InterpV(x3, y3);

[y] = polyEval(a3, x3);
[my ny] = size(y);

% check if the function produce the correct answer
s = 1; % set the flag
for i = 1:my
    if abs(y(i) - y3(i)) > 1e-10
        s = 0;
    end
end

% check if the flag is set and print out accordingly
if s == 1
    fprintf("The third data set produces the correct polynomial.\n");
else
    fprintf("The third data set produces the wrong polynomial.\n");
end

% create the plotting to prove that our program run correctly
f1 = @(n) a1(1) + a1(2) * n;
f2 = @(n) a2(1) + a2(2) * n + a2(3) * n.^2;
f3 = @(n) a3(1) + a3(2) * n + a3(3) * n.^2 + a3(4) * n.^3;

x_range = [-10:0.01:20];
fy1 = f1(x_range);
fy2 = f2(x_range);
fy3 = f3(x_range);

[ry1] = polyEval(a1, x1);
[ry2] = polyEval(a2, x2);
[ry3] = polyEval(a3, x3);

plot(x_range, fy1, "b", x1, ry1, "ob", x_range, fy2, "r", x2, ry2, "or", x_range, fy3, "g", x3, ry3, "og")
% running the program, we can see that all the points 
% is in the graph of the output polynomials, which indicate
% that the function InterpV does interpolate the data