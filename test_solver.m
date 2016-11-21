%TEST_SOLVER  Test linear equation solver.

n = 24; rng(1)
b = randn(n,1);

fprintf('Matrix   | Rel resid  norm(A,1)  norm(x,1)\n')
fprintf('------------------------------------------\n')
test(spiral(n),b,'spiral')
test(hadamard(n),b,'hadamard')  % n is restricted.
test(gallery('invhess',n),b,'invhess')
test(gallery('parter',n),b,'parter')

function test(A,b,name)
fprintf('%-8s %1s',name,'|')
% Or replace backslash with another solver and relevant statistics.
x = A\b;  rel_res = norm(A*x-b,1)/(norm(A,1)*norm(x,1));
fprintf('%8.1e   %8.1e   %8.1e\n', rel_res, norm(A,1), norm(x,1))
end