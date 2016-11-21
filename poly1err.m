function max_err = poly1err(n)
%POLY1ERR    Error in linear interpolating polynomial.
%   POLY1ERR(n) is an approximation based on n sample points
%   to the maximum difference between local function f and its
%   linear interpolating polynomial at 0 and 1.

max_err = 0;
f0 = f(0); f1 = f(1);
for x = linspace(0,1,n)
    p = x*f1 + (x-1)*f0;
    err = abs(f(x)-p);
    max_err = max(max_err,err);
end
end

% Local function.
function y = f(x)
%F    Function to be interpolated, f(x).
y = sin(x);
end