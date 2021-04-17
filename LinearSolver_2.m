function [x] = LinearSolver_2(AA, bb, tol)
%function [x]= LinearSolver_2(A, b, tol)
%Calculates solution to Ax = b
%INPUT: A - m x n matrix (m rows, n columns)
%       b - column vector of size m
%       tol - tolerance for zero checking on pivots in row reduction
%OUPUT: solution vector x of size n
[m, n] = size(AA); %% m = #rows, n = # columns
A=[AA bb]; % Create augmented matrix
% solution is column vector of size n 
x = zeros(n,1);   

% Row Reduce augmented matrix
[A] = Row_Reduce_3(A, tol);

% Recapture reduced A and reduced b for back substitution
b = A(:,end); % reduced b vector 
A = A(:,1:end-1); % Augmented matrix without last column

% Find last non-zero row
last = m;
while last > 1 && isempty(find(A(last,:),1)) 
    last = last - 1;
end

% Back-Substitution
for i = last:-1:1  %% for each row going from last non-zero row to row 1
    pivot = find(A(i,:),1); % find non-zero pivot column
    sub_sum=0.0; % variable to hold the back substituted calculation 
             %  of previously found xk's into row i
    if pivot < n % for all rows except last, do substitution, which
                 % is matrix multiply of row i (from pivot+1 to end) 
                 % with column x (from pivot+1 to end)
        sub_sum = A(i,pivot+1:end)*x(pivot+1:end);
    end
    % solve for next x val at pivot index
    x(pivot) = (b(i)-sub_sum)/A(i,pivot); %% solve for x(pivot)
end


    