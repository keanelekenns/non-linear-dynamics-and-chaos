%PARAMETERS:
%r_interval - A vector of 2 points specifying r axis beginning and ending
%points (i.e. r_interval = [start_val, stop_val])
%r_step - Step size for r values in the plot
%n - Used in the analytical formula for the lyapunov exponent (n->inf).
%transient_size - The number of points to cut off from the initial
%sequence starting at x_0
%f - A function of x_n and r describing the sequence
%f_prime - derivative of f w.r.t. x
%x_0 - Optional argument for where to begin each sequence, if it is not
%specified, then a random value will be chosen from [0,1]
function plot_lyapunov_exp(r_interval, r_step, n, transient_size, f, f_prime, x_0)
%If x_0 isn't provided, choose random x_0
if (~exist('x_0', 'var'))
    x_0 = rand;
end
%create vectors to plot
rs = r_interval(1):r_step:r_interval(2);
lyap_vals = zeros(size(rs));
k=1;
%first loop - choose a value of r
for r = rs
    x = x_0;
    for i = 1:transient_size
        x = f(x, r);
    end
    sum = 0;
    for i = 1:n
        x = f(x, r);
        sum = sum + log(abs(f_prime(x,r)));
    end
    lyap_vals(k) = sum/n;
    k=k+1;
end
plot(rs, lyap_vals);
lyap_mean = mean(lyap_vals(isfinite(lyap_vals)));
lyap_std = abs(std(lyap_vals(isfinite(lyap_vals))));
ylim([lyap_mean - 1.5*lyap_std, lyap_mean + 1.5*lyap_std])
xlabel("r")
ylabel("\lambda")