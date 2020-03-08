%% Week 5 Problem 3.3
% Use quadprog to and a portfolio with return, R = 10:0, and minimal risk.
% What is the optimal portfolio and what is the risk (variance)?
H = [2.30 0.93 0.62 0.74 -0.23; 
0.93 1.40 0.22 0.56 0.26;
0.62 0.22 1.80 0.78 -0.27;
0.74 0.56 0.78 3.40 -0.56; 
-0.23 0.26 -0.27 -0.56 2.60];
mu = [15.1;12.5;14.7;9.02;17.68];
A = [mu';ones(5,1)']; 
b = [10;1]; % We would like a return of 10 in this example
% Second constraint: We need allocation vector x to be positive, 
% i.e. A2*x >= b2
A2 = -eye(5); 
b2 = zeros(5,1);
% variance = x'*H*x, where x is allocation vector and H is covar matrix.

[x,variance] = quadprog(H,[],A2,b2,A,b);
% Results in allocation vector x = [0.0000 0.2816 0.0000 0.7184 0.0000]'
% Meaning of our fund we allocate 28.16% to x2 and 71.84% to x4. 
% Variance = 1.0461





