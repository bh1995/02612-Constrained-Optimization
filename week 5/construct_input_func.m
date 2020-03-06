% Make a Matlab function that constructs H, g, A, and b as function of n,
% ubar, and d0.

function[H,g,A,b] = construct_input_func(n,ubar,d0)
H = ubar*eye(n+1);
b = [-d0;zeros(n-1,1)];
g = -2*ubar*(ones(n+1,1)); % Transposing this gives error
A = zeros(n+1,n); % Create empty A matrix of correct dimensions to be populated later
for i = 1:n-1 % Populate the diagonal of A matrix with respective -1,1
    A(i,i:i+1) = [-1,1];
end
A(n,1) = 1; % Complete constraint 1 row
A(n:n+1,n) = [-1,-1]; % Complete constraint 3 row
end

