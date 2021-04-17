%plotting the graph f between the interval a and b

%first calculate the distance between two consecutive samples
d = (b - a)/100;

%using 101 samples will result in a nice distance between samples, since we
%also plot the two endpoints. If we only plot 100 samples, d = (b - a)/99
%could be very ugly.
xs = a:d:b;
fx = f(xs);
plot(xs,fx);

