function varargout = moments(x)
%MOMENTS    Moments of a vector.
%   [m1,m2,...,mk] = MOMENTS(x) returns the first, second, ...,
%   k'th moments of the vector x, where the j'th moment
%   is sum(x.^j)/length(x).

for j = 1:nargout, varargout(j) = {sum(x.^j)/length(x)}; end
