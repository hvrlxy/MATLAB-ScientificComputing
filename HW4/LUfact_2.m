function [L,U,p]=LUfact_2(AA)
%function [L,U] = LUfact_2(A)
%Calculates an LU factorization of A, ( L*U=A)
%  does partial pivotting
%INPUT:
%  A -- mxn matrix (m rows, n columns)
%OUPUT:
%  L -- lower triangular matrix
%  U -- upper triangular matrix 
%  p -- net permutation
A = AA(:,:); % Make copy of A
[m, n] = size(A);
L=zeros(m,m);
U=zeros(m,n);

p = 1:m;
pc = 1;
x = 0; % index of max entry
for i=1:m-1 % for each row (except last)
    % Find max value (M) and index (x) of max entry below Ai,pc
    [M, x] = max(abs(A(i:end, pc)));
    while M < 1.E-15 && pc < n  % find first non-zero pivot column
        pc = pc + 1;
        [M, x] = max(abs(A(i:end, pc)));
    end
    x = (i-1) + x;   % row offset  
    % swap rows, if needed
    if x ~= i
        A([i x],:) = A([x i],:);
        % permute previous L matrix by current swap
        % L starts as all zeroes, so no initial effect
        L([i x],:) = L([x i],:); 
        % record the row swap
        p([x i]) = p([i x]);
    end
    
    %do reduction in rows i+1 through m (in column i, pivot=a_i,i)
    for k = i+1:m
        s = - A(k,pc)/A(i,pc); %Scalar needed to zero out a_k,i entries
        A(k,:) = A(k,:) + s*A(i,:); %Row k + s*Row i -> Row k 
        L(k,i) = -s; % Set value in L
    end
end

status=0;  % success
L=L+eye(size(L)); % eye(n) is nxn identity matrix
U=A;
end

    