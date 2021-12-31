function [x_hats, step_sizes] = Euler379(x0, k)
step_sizes = zeros(1,k+1);
x_hats = zeros(1,k+1);
for i=1:k+1
    step_sizes(i) = 1/10^(i-1);
end
% x_hat at 1 after n steps (n = 10^(i-1) for i from 1 to k+1)
for i = 1:k+1
    n = 1/step_sizes(i);
    x_hats(i) = x0 - x0*step_sizes(i);
    for j=1:n-1
        x_hats(i) = x_hats(i) - x_hats(i)*step_sizes(i);
    end
end