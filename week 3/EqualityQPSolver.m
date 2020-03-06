function [x,lambda]=EqualityQPSolver(H,g,A,b)
ncon = size(A,2); % nr constraints
%[n1,n2] = size(A); % nr constraints
%zeromat = zeros(n2); % Produce zero matrix
zeromat = zeros(ncon);
dim = size(H,1); % dimension size

% Equation that define our QP problem
eq1 = [H,-A;-A',zeromat]; 
eq2 = [-g;-b];

% Solve system
% LDL is used as eq1 is a Hermitian indefinite matrice
% see https://se.mathworks.com/help/matlab/ref/ldl.html#bqwmk93-1 for
% a description and examples.
[Lml,Dml,Pml] = ldl(eq1,"lower","vector");
s(Pml) = Lml'\(Dml\(Lml\eq2(Pml)));

x = s(1:dim);
%x = s(1:n1);
lambda = s(dim+1:end);
%lambda = s(n1:end);
end