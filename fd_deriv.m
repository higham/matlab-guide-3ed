function y = fd_deriv(f,x,h)
%FD_DERIV    Finite difference approximation to derivative.
%   FD_DERIV(f,x,h) is a finite difference approximation
%   to the derivative of function f at x with difference
%   parameter h.  h defaults to sqrt(eps).

if nargin < 3, h = sqrt(eps); end
y = (f(x+h) - f(x))/h;
