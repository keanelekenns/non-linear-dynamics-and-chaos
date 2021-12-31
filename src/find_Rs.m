%PARAMETERS:
%n - An integer identifying the 2^n period superstable cycle of the
%logistic map
%RETURNS:
%Rs - An array of r values of the logistic map s.t. it has a superstable cycle of
%period 2^n for i=0,...,n. e.g. Rs = [R0, R1, R2, ..., Rn]
function Rs = find_Rs(n)
Rs = zeros(1,n+1);
if n < 0
    return
end
%Superstable fixed point
Rs(1) = 2;
if n == 0
    return
end
%Already calculated and more exact
Rs(2) = 1 + sqrt(5);
if n == 1
    return
end
%calculate period
p = 2^n;
%start just after r4 = 3.449... and end just after rinf = 3.569946... from
%textbook
r = 3.45:1e-8:3.57;
%apply the logistic map p times starting at x=1/2
x = 0.5;
for i=1:p
    x = r.*x.*(1-x);
end
%shift it down so that finding roots is easier
x = x-0.5;
%NOTE: I was planning to use the bisection method to find the roots, but I
%wasn't sure how to make sure my xupper value didn't step too far over
%multiple roots. This is horribly inefficient, but I just iterate over
%every point and see if it's close enough to zero

%index for Rs
k = 3;
%weird matlab rules won't allow me to modify i in loop
skip=0;
for i = 1:length(x)
    if skip > 0
        skip = skip-1;
        continue
    end
    %if we find something close enough to zero, add it to the Rs
    if abs(x(i)) < 1e-7
        Rs(k) = r(i);
        %skip over all the other points that are close to this zero
        while(abs(x(i+1)) < 1e-7)
            i=i+1;
            skip=skip+1;
        end
        if k == n+1
            return
        end
        k=k+1;
    end
end