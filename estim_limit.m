%Given N, estimate the limit of the sequence yn = (1 + 1/n)^n by plotting the points from
%1 to N. The script should also print out yN, but none of the intermediate
%results.

yn = @(n) (1 + 1./n).^n;
xs = 1:N;
ys = yn(xs);
plot(xs, ys,'or');
title('convergence of sequence');
xlabel('y_i');
ylabel('i');
yn(N)
