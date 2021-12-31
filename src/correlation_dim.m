%PARAMETERS:
%points- a set of m n-dimensional points (size = m x n) on the attractor to
%measure.
%RETURNS:
%d - the approximated correlation dimension
function d = correlation_dim( points )
shape = size(points);
m=shape(1);
k=-7:6;
eps=2.^k;
%A matrix containing number of points in balls of size eps around each
%point chosen in the loop below. Column corresponds to eps size, row
%corresponds to the x point of focus.
Nxe = zeros(floor((m-1)/(floor(m/100))) + 1, 14);
%loop over x points
for i = 1:floor(m/100):m
    x = points(i,:);
    %find dist from x to every other point
    dist = zeros(1,m);
    for j = 1:m
        dist(j) = norm(x-points(j,:));
    end
    for j = 1:14
        num_points = 0;
        for k=1:m
            if dist(k) <= eps(j)
                num_points = num_points + 1;
            end
        end
        Nxe(i,j) = num_points;
    end
end
%average the columns of Nxe
Ce = mean(Nxe);
hold on
Ce= log2(Ce);
eps = log2(eps);
%plot log(eps) vs log(Ce)
plot(eps, Ce, 'k.')
%best fit line for middle points
p = polyfit(eps(4:end-3),Ce(4:end-3),1);
dplot = plot(eps(4:end-3),polyval(p,eps(4:end-3)))
%evaluate slope at each point
p = polyder(p);
d = polyval(p,eps(4:end-3));
%d is the slope
d = d(1);
s = sprintf("d = %f",d);
legend(dplot,s)
xlabel("log2(eps)")
ylabel("log2(Ce)")
title("Lorenz Eqs: Average number of points in ball of radius eps")
hold off
