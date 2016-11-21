function [y,Z] = arg_checks(n,A,x,tol)
%ARG_CHECKS    Illustrate argument checking.

narginchk(3,4)  % Require 3 to 4 input arguments.
nargoutchk(1,2) % Require 1 to 2 output arguments.

if nargin < 4, tol = sqrt(eps); end

validateattributes(n, {'double', 'single'}, {'scalar', 'positive'})
validateattributes(A, {'double'}, {'finite', 'square', 'nonnan'},...
                   mfilename,'A',2)
validateattributes(x, {'numeric'}, {'nondecreasing'});
validateattributes(tol, {'double','single'}, {'nonnegative'},...
                   mfilename,'tol',4)

y = n*x.^2; Z = A.^2;