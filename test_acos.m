%TEST_ACOS  Test acos function.
%   Test that f(z) = acos(z) is the principal arc cosine function.

% Setup
rng(1)
n = 1e4;
x1 = linspace(-1,1,n);
x2 = linspace(-1,-1e4,n);
 
%% Interval 1
% For real x on [-1,1], f(x) must be real and between -pi and pi.
y = acos(x1); 
assert(all(isreal(y))) 
assert(all(y >= -pi)) 
assert(all(y <= pi))

%% Interval 2
% Test x on branch cut [-inf,-1].
y = acos(x2); 
assert(all(real(y) == pi))
assert(all(imag(y) <= 0))

%% Interval 3
% Test x on branch cut [1,inf].
y = acos(-x2); 
assert(all(real(y) == 0))
assert(all(imag(y) >= 0))

%% Branch points
% Test values at branch points.
assert(acos(1) == 0) 
assert(acos(-1) == pi) 

%% Complex random arguments
x = randn(n,1) + 1i*rand(n,1);
acosx = acos(x);
x1 = cos(acosx);
assert(all( abs(x-x1) <= 2*eps*(abs(x) + abs(acosx.*sin(acosx))) )) 

