function [x, status] = TDMS(A,b)
    % the function solve the equation Ax = b when A has a special
    % tridiagonal structure.
    % Params:
    % A -- the system matrix
    % b -- the right-handed vector
    % The function will return
    % x -- final result
    % status = 0 -- success
    %        = 1 -- failed
    
    [m n] = size(A);
    U = A;
    L = zeros(m,n);
    x = zeros(m,1);
    y = zeros(m,1);
    [mb nb] = size(b);
    status = 1;
    
    if m ~= n
        fprintf("A is not square. Abort\n")
        return
    end
    
    if mb ~= m
        fprintf("Incompatible dimensions between b and A. Abort\n")
        return
    end
    
    for i=1:m
        L(i,i) = 1;
    end
    
    % Perform LU factorization
    for i = 1:m-1
        L(i + 1,i) = U(i+1,i)/U(i,i);
        U(i+1,:) = U(i + 1,:) - L(i + 1,i)*U(i,:);
    end
    
    % Perform forward substitution
    y(1) = b(1);
    for i = 2:n
        y(i) = b(i) - L(i,i-1) * y(i-1);
    end
    
    %Perform backward substitution
    x(m) = y(m)/U(m,m);
    for i = m-1:-1:1
        if U(i,i) == 0
            fprintf("Hit zero pivot. Abort\n");
            status = 1;
            return
        end
        x(i) = y(i) - U(i, i + 1) * x(i + 1);
        x(i) = x(i)/U(i,i);
    end
    
    status = 0;
    