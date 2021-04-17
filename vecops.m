%Given a vector V and an integer k
%calculate the sum of the first 5 entries of V
V(1) + V(2) + V(3) + V(4) + V(5)

%calculate the sum of the last 5 entries
n = length(V);
V(n) + V(n - 1) + V(n - 2) + V(n - 3) + V(n - 4)

%calculate the absolute value of the kth entries of V
abs(V(k))

%reassign the value of V from 2 to n - 2 to 2:(n-2)
V(2:n-2) = [2:n-2]

