%given the interval [a,b], the function f and an integer M, the script return the
%smallest integer i in the range [a,b] such that f(i) > M
i = a;
while i <= b
    if f(i) > M
        display(i);
        return;
    end
    i = i + 1;
end
fprintf('cannot find such i');