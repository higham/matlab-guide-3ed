function [f,fprime] = flogist(x,a)
%FLOGIST    Logistic function and its derivative.
%   [F,FPRIME] = FLOGIST(x,a) evaluates the logistic
%   function F(x) = x.*(1 - a*x) and its derivative FPRIME
%   at the matrix argument x, where a is a scalar parameter.

f = x.*(1 - a*x);
fprime = 1 - 2*a*x;
