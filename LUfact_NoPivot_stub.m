function [L,U,status]=LUfact_NoPivot(A)
%function [L,U] = LUfact_NoPivot(A)
%Calculates an LU factorization of A, ( L*U=A) 
%    does not perform pivoting (no row swaps)
%INPUT:
%  A -- mxn matrix (m rows, n columns)
%OUPUT:
%  L -- lower triangular matrix
%  U -- upper triangular matrix
%  status -- 0 on success, 1 on failure. 
%

[m, n] = size(A);
L=zeros(m,m);
U=zeros(m,n);
status=1;

for i=1:m-1 % for each row (except last)
  %do reduction in rows i+1 through m (in column i, pivot=a_i,i)
  %check for zero pivot
  if A(i,i) == 0
      fprintf("Zero pivot. Abort");
      return
  end
  for k = i+1:m
      %%  Find next multiplier
      mul = -A(k,i)/A(i,i);
      %%  Set appropriate value in L
      L(k,i) = -mul;
      %%  Do row operation
      A(k,:) = A(k,:) + mul*A(i,:);
  end
end

status=0;
L=L+eye(size(L)); %% Set diagonal vals to be 1
U=A;

    