%PARAMETERS:
%r_interval - A vector of 2 points specifying r axis beginning and ending
%points (i.e. r_interval = [start_val, stop_val])
%r_step - Step size for r values in the plot
%x_interval - A vector of 2 points specifying x axis beginning and ending
%points (i.e. x_interval = [start_val, stop_val])
%num_points - The number of x points to plot for each r value
%transient_size - The number of points to cut off from the initial
%sequence starting at x_0
%map - A function of x_n and r describing the sequence
%x_0 - Optional argument for where to begin each sequence, if it is not
%specified, then a random value will be chosen from the x_interval
function plot_orbit_diagram(r_interval, r_step, x_interval, num_points, transient_size, map, x_0)
hold on
%If x_0 isn't provided, choose random x_0 in x_interval
if (~exist('x_0', 'var'))
    x_0 = (x_interval(2) - x_interval(1))*rand + x_interval(1);
end
%create vector for x_vals
x_vals = zeros([1, num_points]);
%first loop - choose a value of r
for r = r_interval(1):r_step:r_interval(2)
    x_vals(1) = x_0;
    for i = 1:transient_size
        x_vals(1) = map(x_vals(1), r);
    end
    for i = 2:num_points
        x_vals(i) = map(x_vals(i-1), r);
    end
    h = plot(r, x_vals, 'k.');
    set(h,'markersize',3)
    drawnow
end
xlim([min(r_interval), max(r_interval)])
ylim([min(x_interval), max(x_interval)])
xlabel("r")
ylabel("x")
hold off