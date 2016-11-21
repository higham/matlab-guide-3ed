function ratio = specrad_randn(m,nvals)
%SPECRAD_RANDN  Spectral radius of randn matrices.
%   ratio = specrad_randn(m,nvals) computes ratios of expected versus
%   actual mean spectral radius of m randn matrices of dimensions 
%   given in nvals.

nlen = length(nvals);
s = zeros(nlen*m,1);
parfor k = 1:nlen*m
    i = ceil(k/m); % And, although not needed, j = k - m*(i-1);
    s(k) = max(abs(eig(randn(nvals(i)))));
end
t = reshape(s,m,nlen);
ratio = sum(t) ./ (m*sqrt(nvals(:)'));
