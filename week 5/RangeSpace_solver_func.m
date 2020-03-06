function[x,lambda] = RangeSpace_solver_func(n,ubar,d0)
% Use previous construct function to produce the H,g,A,b inputs of the 
% system. These will then be used to solve the system via range space.
[H,g,A,b] = construct_input_func(n,ubar,d0)
A_ = A'*A;
lambda = A_\(b+A'*g);
x = H*(A*lambda-g);
end