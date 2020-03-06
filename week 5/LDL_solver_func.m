% Make a Matlab function that solves (1.1) using an LDL factorization.

function[x,lambda] = LDL_solver_func(n,ubar,d0)
% Use previous KKT function to produce the linear system to solve
[eq1,eq2] = construct_KKT_func(n,ubar,d0);
% Information on how the LDL function works:
% https://se.mathworks.com/help/matlab/ref/ldl.html
[L,D,P] = ldl(eq1,"lower","vector");
s(P) = L'\(D\(L\eq2(P)));
x = s(1:n+1)';
lambda = s(n+2:end)';
end