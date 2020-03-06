% Evaluate the performance (cputime) of all solvers as function of
% problem size (n=10-1000)


n = 10;
ubar = 0.2;
d0 = 1;
count = 1;
for i = 10:10:1000
   tic; 
   LU_solver_func(i,ubar,d0);
   time_LU(count) = toc;
   
   tic;
   LDL_solver_func(i,ubar,d0);
   time_LDL(count) = toc;
   
   tic;
   NullSpace_solver_func(i,ubar,d0);
   time_NS(count) = toc;
   
   tic;
   RangeSpace_solver_func(i,ubar,d0);
   time_RS(count) = toc;
   
   %tic;
   %SparseLU_solver_func(i,ubar,d0);
   %time_SLU(count) = toc;
   
   %tic;
   %SparseLDL_solver_func(i,ubar,d0);
   %time_SLDL(count) = toc;
   
   n(count) = i;
   count = count + 1;
end

%% Plot the results
plot(n,time_LU,'--','linewidth',1.2)
hold on;
plot(n,time_LDL,'--','linewidth',1.2);
plot(n,time_NS,'--','linewidth',1.2);
plot(n,time_RS,'--','linewidth',1.2);
%plot(n,time_SLU,'--','linewidth',1.2);
%plot(n,time_SLDL,'--','linewidth',1.2);
hold off;
grid on;
xlabel('n','fontsize',14);
ylabel('Time','fontsize',14);
title('CPU-time of Equality Constrained QP solver VS n','fontsize',14);
legend({'LU','LDL','Null-Space','Range-Space'},'location','northWest','fontsize',10);

%% Make the matrices sparse now 

sparse_KKT = sparse(construct_KKT_func(100,ubar,d0));
spy(sparse_KKT);

SparseLU_solver_func(10,ubar,d0)
SparseLDL_solver_func(10,ubar,d0)

%% Problem 2 - sparse vs dense CPU-time
count = 1;
for i = 10:10:1000
    tic;
    SparseLU_solver_func(i,ubar,d0);
    time_SLU(count) = toc;
    
    tic;
    SparseLDL_solver_func(i,ubar,d0)
    time_SLDL(count) = toc;
    
    n(count) = i;
    count = count + 1;
end
%% Plot the CPU time for dense vs sparse

plot(n,time_LU,'--','linewidth',1.2)
hold on;
plot(n,time_LDL,'--','linewidth',1.2);
plot(n,time_NS,'--','linewidth',1.2);
plot(n,time_RS,'--','linewidth',1.2);
plot(n,time_SLDL,'--','linewidth',1.2);
plot(n,time_SLU,'--','linewidth',1.2);
hold off;
grid on;
xlabel('n','fontsize',14);
ylabel('Time','fontsize',14);
title('CPU-time of each solver VS n','fontsize',14);
legend({'LU','LDL','Null-Space','Range-Space','Sparse LDL','Sparse LU'},'location','northWest','fontsize',10);