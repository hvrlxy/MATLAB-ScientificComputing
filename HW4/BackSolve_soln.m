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
    y
    
    for i=mU:-1:1
        if U(i,:) == zeros(nU,1)
            continue;
        end
           
          pivot = find(U(i,:),1);
          x(pivot) = y(i) - U(i, pivot+1:end) * x(pivot+1:end);
          x(pivot) = x(pivot)/U(i,pivot);
        
    end
    
    LUx = L * U * x;
    for i = 1:mU
        if abs(LUx(i) - Pb(i)) > 1e-10
            x = zeros(mU,1);
            status = 2;
            fprintf("Inconsistent system. Abort\n");
            return
        end
    end
end
        
    
    
    
    
    
    