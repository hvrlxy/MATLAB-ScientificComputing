function [A] = Row_Reduce_3(AA, tol)
%function [A,]= Row_Reduce_3(A, tol)
%Calculates row reduction of A with partial pivotting
%INPUT: A -- m x n matrix (m rows, n columns)
%       tol - tolerance for zero checking
%OUPUT: copy of A in row reduced form

A = AA(:,:); % Make copy of A
[m,n] = size(A); % m = #rows, n = # columns

pc = 1;
for i=1:m-1 % for each row (except last)
    % Find max value (M) and index (p) of max entry below Aii
    [M, p] = max(abs(A(i:end, pc)));
    while M < tol && pc < n  % find first non-zero pivot column
        pc = pc + 1;
        [M, p] = max(abs(A(i:end, pc)));
    end
    p = (i-1) + p;   % row offset  
    % swap rows, if needed
    if p ~= i,   A([i p],:) = A([p i],:);
    end

    %do reduction in rows i+1 through m (in column i, pivot=a_i,i)
    for k = i+1:m
        s = - A(k,pc)/A(i,pc); %Scalar needed to zero out a_k,pc entries
        A(k,:) = A(k,:) + s*A(i,:); %Row k + s*Row i -> Row k 
    end
end

    