% Make a Matlab function that solves (1.1) using an LU factorization.

function[x,lambda] = LU_solver_func(n,ubar,d0)
% Use previous KKT function to produce the linear system to solve
[eq1,eq2] = construct_KKT_func(n,ubar,d0);
% Information on how the lu function works:
% https://se.mathworks.com/help/matlab/ref/lu.html
[L,U,P] = lu(eq1,"vector"); % Perform the LU matrix factorization
s(P) = U\(L\eq2(P)); % Find solutions for the equations
x = s(1:n+1)';
lambda = s(n+2:end)';
end


