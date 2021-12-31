%PARAMETERS:
%t0 - beginning of time interval
%tf - end of time interval
%n - number of steps (tf-t0)/n determines step size h
%x0 - an n-dimensional vector of initial conditions at t0
%f - a vector of functions defining dx/dt
%RETURNS:
%points - points in n-dimensional phase space corresponding to a trajectory
%defined by x0
%times - t values for each point along the trajectory
function [points, times] = RK4( t0, tf, n, x0, f)
% compute step size h
h=(tf-t0)/n;
%create array of points in R^num_dims according to dimensions of x0
num_dims = size(x0,2);
points = zeros(n+1, num_dims);
times = zeros(n+1,1);
%store initial point and time
points(1,:) = x0;
times(1) = t0;
%calculate points with Runge Kutta method
for i = 1:n
    k_1 = f(points(i,:)).*h;
    k_2 = f(points(i,:) + .5.*k_1).*h;
    k_3 = f(points(i,:) + .5.*k_2).*h;
    k_4 = f(points(i,:) + k_3).*h;
    points(i+1,:) = points(i,:) + (1/6).*(k_1 + 2.*k_2 + 2.*k_3 + k_4);
    times(i+1) = times(i) + h;
end