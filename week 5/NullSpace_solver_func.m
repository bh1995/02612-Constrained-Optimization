% Make a Matlab function that solves (1.1) using the Null-Space procedure
% based on QR-factorizations.

function[x,lambda] = NullSpace_solver_func(n,ubar,d0)
% Use previous construct function to produce the H,g,A,b inputs of the 
% system. These will then be used to solve the system with QR decomp.
[H,g,A,b] = construct_input_func(n,ubar,d0)
% Information on how the QR function works:
% https://se.mathworks.com/help/matlab/ref/qr.html
% See end of lecture 5 EqualityConstrainedQP slides for solution to a system 
% with QR decmomposition
[Q,R_] = qr(A);
ncol = size(R_,2); % Find nr. columns of R matrix
Q1 = Q(:,1:ncol);
Q2 = Q(:,ncol+1:end);
R = R_(1:ncol,1:ncol);
xy = R'\b;
xz = (Q2'*H*Q2)\(-Q2'*(H*Q1*xy+g));
x = Q1*xy+Q2*xz;
lambda = R\(Q1'*(H*x+g));
end









