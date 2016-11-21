function Y = cheby(x,p)
%CHEBY    Chebyshev polynomials.
%    Y = CHEBY(x,p) evaluates the first p Chebyshev polynomials
%    at the vector x.  The k'th column of Y contains the
%    Chebyshev polynomial of degree k-1 evaluated at x.

Y = ones(length(x),p);
x = x(:);  % Ensure x is a column vector.
if p == 1, return, end

Y(:,2) = x;
for k = 3:p
  Y(:,k) = 2*x.*Y(:,k-1) - Y(:,k-2);
end
