function [delta_x,delta_lambda] = sensitivity(H,A)
% This function computes expected sensitivity (changes in x and lambda
% given changes in g and b inputs) for given H, A matrixes.
ncon = size(A,2);
dim = size(H,1);
eq2 = -[H,-A;-A',zeros(ncon)];
s = inv(eq2);
delta_x = s(:,1:dim);
delta_lambda = s(:,dim+1:end);
end