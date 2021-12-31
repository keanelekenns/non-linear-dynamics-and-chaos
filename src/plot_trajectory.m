%t0 - beginning of time interval
%tf - end of time interval
%n - number of steps (tf-t0)/n determines step size h
%x0 - a vector of initial conditions at t0
%f - a vector of functions defining dx/dt
%polar = true(1) or false(0) for whether to interpret x(1) as r and x(2) as theta
function plot_trajectory( t0, tf, n, x0, f, linecolour, polar)
% compute step size h
h=(tf-t0)/n;
%create array of points in R^num_dims according to dimensions of x0
num_dims = size(x0,2);
points = zeros(n+1, num_dims);
%store initial point
points(1,:) = x0;
%calculate points with Runge Kutta method
for i = 1:n
    k_1 = f(points(i,:)).*h;
    k_2 = f(points(i,:) + .5.*k_1).*h;
    k_3 = f(points(i,:) + .5.*k_2).*h;
    k_4 = f(points(i,:) + k_3).*h;
    points(i+1,:) = points(i,:) + (1/6).*(k_1 + 2.*k_2 + 2.*k_3 + k_4);
end
hold on
xs = points(:,1);
ys = points(:,2);
if polar
    plot(xs.*cos(ys),xs.*sin(ys),linecolour)
else
    plot(xs,ys,linecolour)
end