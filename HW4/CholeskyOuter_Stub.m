function [L, status]=CholeskyOuter(AA)
% [L,status]=CholeskyOuter(A)
%    Calculates an LL' factorization of positive definite matrix A 
%INPUT: 
% A -- Matrix, should be square and positive definite
%OUTPUT:
% L - Lower triangular matrix
% status -- success status variable
%      = 0 if factorization is successful
%      = 1 if A is square, but not positive definite
%      = 2 if the function failed for some other, e.g. if A is not square

A = AA(:,:);
[m, n] = size(AA);
L=nan;
status = 2;

% Check if A is not square, fail
    %%%% To be completed by student
if m ~= n
    fprintf("A is not square. Abort\n");
    return
end
off_diagonal = 1;
L=zeros(m,m);
for i=1:m-1 % for each row (except last)
    % Check if pivot is zero, fail
    %%%% To be completed by student
    if A(i,i) == 0
        fprintf("Hit a zero pivot. Abort\n");
        status = 2;
        return
    end
    
    %do reduction in rows i+1 through m (in column i, pivot=a_i,i)
    for k = i+1:m
        % set the offdiagonal flag if necessary
        if A(k,i)~=0 && k~=i
            offdiagonal=0;
        end
       %%%% To be completed by student
        % get scalar multiplier
        s = -A(k,i)/A(i,i);
        % zero out rows below
         A(k,:) = A(k,:) + s*A(i,:);
        % zero out columns to right
         A(:,k) = A(:,k) + s*A(:,i);
        % set L(k,i) value
        L(k,i) = -s;
    end
end

% Check that all diagonal entries of A are positive
if any(diag(A)<0)
    fprintf('Error, A is not positive definite\n');
    status=1;
    return;
end

% Check that all off-diagonal entries of A are zero
    %%%% To be completed by student
if offdiagonal==1
    fprintf("All nondiagonal elements are zero")
    status = 2;
    return 
end
    
status = 0;
L=L+eye(size(L));
% Multiply by sqrt of diagonal entries in reduced A
d=diag(sqrt(diag(A)));
L = L*d;

