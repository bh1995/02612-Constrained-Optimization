%%
% What are H,f,A,b ?
H = [6 2 1; 2 5 2; 1 2 4];
f = [-8; -3; -3];
A = [1 0 1; 0 1 1];
g = [3; 0];
% What are the KKT conditions?
% See notes for derived gradient of lagrange equation and the form which
% the linear system takes.
%% 
function [x,lambda]=EqualityQPSolver(H,g,A,b)
ncon = size(A,2); % nr constraints
zeromat = zeros(ncon); % Produce zero matrix
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
lambda = s(dim+1:end);
end







