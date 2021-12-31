%PARAMETERS:
%points - array of points in one dimension
%RETURNS:
%maxima - a one dimensional array of local maximas from points
function maxima = Maxima(points)
    points = reshape(points',1,[]);
    n = length(points);
    maxima = zeros(0);
    for i = 3:n-1
        if points(1,i)>points(1,i-1) && points(1,i)>points(1,i+1)
            maxima(length(maxima)+1) = points(1,i);
        end
    end
end