function [H,g,A,b,x,lambda] = rand_convex_QP(randnr)
% The H matrix can be made by mutliplying some matrix by the transpose of 
% itself.
rand_mat = rand(randnr);
H = rand_mat'*rand_mat;
A = rand(randnr);
x = rand(randnr,1);
lambda = rand(randnr,1);
eq1 = [H,-A;-A',zeros(randnr)]; % As the system to be solved should be.
eq2 = eq1*[x;lambda]; % Full system 
g = -eq2(1:randnr);
b = -eq2(randnr+1:end);
H
g
A
b
x
lambda
end


