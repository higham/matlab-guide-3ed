function [x,iter] = sqrtn(a,tol)
%SQRTN    Square root of a scalar by Newton's method.
%   x = SQRTN(a,tol) computes the square root of the scalar
%   a by Newton's method (also known as Heron's method).
%   a is assumed to be nonnegative.
%   tol is a convergence tolerance (default eps).
%   [x,iter] = SQRTN(a,tol) returns also the number of
%   iterations iter for convergence.

if nargin < 2, tol = eps; end

x = a;
iter = 0;
xdiff = inf;
fprintf(' k             x_k            rel. change\n')

while xdiff > tol
    iter = iter + 1;
    xold = x;
    x = (x + a/x)/2;
    xdiff = abs(x-xold)/abs(x);
    fprintf('%2.0f:  %20.16e  %9.2e\n', iter, x, xdiff)
    if iter > 50
       error('Not converged after 50 iterations.')
    end
end
