clear;
clc;
%% Week 5 Problem 3.4
% Compute the efficient frontier, i.e. the risk as function of the return. 
% Plot the efficient frontier as well as the optimal portfolio as function 
% of return.
H = [2.30 0.93 0.62 0.74 -0.23; 
0.93 1.40 0.22 0.56 0.26;
0.62 0.22 1.80 0.78 -0.27;
0.74 0.56 0.78 3.40 -0.56; 
-0.23 0.26 -0.27 -0.56 2.60];
mu = [15.1;12.5;14.7;9.02;17.68];
A = [mu';ones(5,1)']; 
%b = [10;1]; % We would like a return of 10 in this example
% Second constraint: We need allocation vector x to be positive, 
% i.e. A2*x >= b2
A2 = -eye(5); 
b2 = zeros(5,1);
% variance = x'*H*x, where x is allocation vector and H is covar matrix.
x_ = zeros(5,30); % create zero matrix for 30 different allocation vector
% x to fill
variance_ = zeros(1,30); % create zero vector for 30 different variances.
% create 30 random return values within interval [9.02,17.68]
R = ((17.68-9.02).*rand(30,1) + 9.02)';

for i = 1:length(R)
    b = [R(i),1];
    [x_(:,i),variance_(1,i)] = quadprog(H,[],A2,b2,A,b);
end

% With risk free security:
H2 = [2.30 0.93 0.62 0.74 -0.23 0; 
0.93 1.40 0.22 0.56 0.26 0;
0.62 0.22 1.80 0.78 -0.27 0;
0.74 0.56 0.78 3.40 -0.56 0; 
-0.23 0.26 -0.27 -0.56 2.60 0;
0 0 0 0 0 0];
mu2 = [15.1;12.5;14.7;9.02;17.68;2];
A_2 = [mu2';ones(6,1)']; 
%b = [10;1]; % We would like a return of 10 in this example
% Second constraint: We need allocation vector x to be positive, 
% i.e. A2*x >= b2
A2_2 = -eye(6); 
b2_2 = zeros(6,1);
% variance = x'*H*x, where x is allocation vector and H is covar matrix.
x_2 = zeros(6,30); % create zero matrix for 30 different allocation vector
% x to fill
variance_2 = zeros(1,30); % create zero vector for 30 different variances.
% create 30 random return values within interval [9.02,17.68]
R2 = ((17.68-9.02).*rand(30,1) + 9.02)';

for i = 1:length(R2)
    b_2 = [R2(i),1];
    [x_2(:,i),variance_2(1,i)] = quadprog(H2,[],A2_2,b2_2,A_2,b_2);
end

% What is the minimal risk and optimal portfolio giving a return of 
% R = 15.0? Plot this point on the Efficient Frontier plot.
b_3 = [15,1]; % Want the Return = 15
A_2 = [mu2';ones(6,1)']; 
%b = [10;1]; % We would like a return of 10 in this example
% Second constraint: We need allocation vector x to be positive, 
% i.e. A2*x >= b2
A2_2 = -eye(6); 
b2_2 = zeros(6,1);
% variance = x'*H*x, where x is allocation vector and H is covar matrix.
x_2 = zeros(6,30); % create zero matrix for 30 different allocation vector
% x to fill
[x3,variance3] = quadprog(H2,[],A2_2,b2_2,A_2,b_3);
x3 
variance3

plot(R,variance_,"o")
title("Efficient Frontier")
xlabel("Return")
ylabel("Variance")
hold on

plot(R2,variance_2,"o")

plot(b_3,variance3,"x",'MarkerSize',30)
hold off
title("Efficient Frontier with and with out risk free security")
xlabel("Return")
ylabel("Variance")
legend(["With out risk free security","With risk free security", "Return=15"],'location','northEast','fontsize',10);
xlim([8,18])
% It seems adding the risk free security gives possibility to a portfolio
% with extremly low variance but with "relatively" low return. The two
% different portfolio types intercect at around return=15.


