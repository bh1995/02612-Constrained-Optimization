% Make a Matlab function that constructs the KKT-matrix as function of n, 
% ubar, and d0.

function[eq1,eq2] = construct_KKT_func(n,ubar,d0)
% Run previous function to find H,g,A,b
[H,g,A,b] = construct_input_func(n,ubar,d0);
% Construct normal KKT condition linear system
% eq1 is the left side of the system and eq2 is the right (eq1=eq2)
eq1 = [H,-A;-A',zeros(n,n)];
eq2 = -[g;b];
end


