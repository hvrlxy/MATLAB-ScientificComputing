function [a, status] = InterpV(x, y)
% the function find the polynomial that will match the data point
% represented by vector x and y
% Params:
% x -- the vector represent x coordinates
% y -- the vector represent y coordinates
% The function returns:
% a -- the vector of coefficients
% status -- 0 : success
%           1 : fail
    status = 0;
    [m n] = size(x);
    a = zeros(m);
    
    [xm xn] = size(x);
    [ym yn] = size(y);
    if (xm ~= ym)
        status = 1;
        fprintf("x and y have inconsistent dimensions. Abort\n");
        return
    end
    
    % Build the Vandermolt matrix
    A = zeros(m,m);
    for i=1:m
        ai = zeros(1,m);
        for j=1:m
            ai(1,j) = x(i)^(j - 1);
        end
        A(i,:) = ai;
    end
    
    % Do the LUfact of matrix A
    [L U p] = LUfact(A);

    % Solve the function Az = y for z
    [a, s] = BackSolve_soln(L, U, p, y);
    if s == 2
        fprintf("There are problems solving Ax = y. Abort\n");
        status = 1;
    end
end

% Paste the LUfact function that we did on HW4
function [L,U,p]=LUfact(AA)
%function [L,U] = LUfact(A)
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

% We also need the backsolve function as well
function [x, status] = BackSolve_soln(L, U, p, b)
    % solve the equation Ax = b after A has been factored into L and U
    %   L -- the lower triangular matrix
    %   U -- the upper triangular matrix
    %   p -- the permutation vector
    %   b -- the right-handed side vector
    % the function will return:
    %   x -- the solution to the equation
    %   status: the status of the program, with
    %       0: consistent with one unique solution
    %       1: consistent with infinite solution
    %       2: inconsistent
    %       3: failed for some other reasons
    [mU nU] = size(U);
    [mL nL] = size(L);
    [mb nb] = size(b);
    [mp np] = size(p);
    y = zeros(mL,1);
    x = zeros(mU, 1);
    
    if mL == nU
        status = 0;
    else
        status = 1;
    end
    
    all_zeros = true;
    for i = 1:nU
        if abs(U(mU,i) - 0.0) > 1e-10
            all_zeros = false;
        end
    end
    
    if all_zeros == true
        status = 1;
    end
    all_zeros = true;
    
    for i = 1:nL
        if abs(L(1,i) - 0.0) > 1e-10
            all_zeros = false;
        end
    end
    
    if all_zeros == true
        status = 1;
    end
    
    if nL ~= mU
        status = 3;
        fprintf("Inconsistent size between L and U. Abort\n");
        return
    end
    
    if mb ~= mL
        status = 3;
        fprintf("Inconsistent size of b. Abort\n");
        return
    end
    
    if mb ~= np
        status = 3;
        fprintf("P and b has inconsistent size. Abort\n");
        return 
    end
    
    Pb =b(p);
    
    for i=1:mL
        y(i) = Pb(i) - L(i,1:i-1) * y(1:i-1);
    end
    
    for i=mU:-1:1
        if U(i,:) == zeros(nU,1)
            continue;
        end
           
          pivot = find(U(i,:),1);
          x(pivot) = y(i) - U(i, pivot+1:end) * x(pivot+1:end);
          x(pivot) = x(pivot)/U(i,pivot);
        
    end
    
end
