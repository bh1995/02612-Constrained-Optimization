function [x,lambda,mu]=EqualityQPSolverDual(H,g,A,b)
% Program to solve the the Dual Program equality constrained QP. It is
% similar to the primal solver (previous exercise) but has some adjustments
% for the new system of equations. 
ncon = size(A,2); % nr constraints
%[n1,n2] = size(A); % nr constraints
%zeromat = zeros(n2); % Produce zero matrix
zeromat = zeros(ncon);
dim = size(H,1); % dimension size

% Equation that define our QP problem
eq1 = [H,zeros(dim,ncon),-H;
    zeros(ncon,dim),zeros(ncon,ncon),-A';
    -H,-A,zeros(dim,dim)]; 
eq2 = [zeros(dim,1);-b;-g];

% Solve system
% LDL is used as eq1 is a Hermitian indefinite matrice
% see https://se.mathworks.com/help/matlab/ref/ldl.html#bqwmk93-1 for
% a description and examples.
%[Lml,Dml,Pml] = ldl(eq1,"lower","vector");
s = eq1\eq2;

x = s(1:dim);
%x = s(1:n1);
lambda = s(dim+1:dim+ncon);
%lambda = s(n1:end);
mu = s(dim+ncon:end);
end