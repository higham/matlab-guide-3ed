function [A,specrad,index] = parfeval_specrad(n,c) 
%PARFEVAL_SPECRAD  Find random matrix with large spectral radius.
%     [A, specrad] = PARFEVAL_SPECRAD(n,c) searches for a randn(n) 
%     matrix with spectral radius at least c*sqrt(n).
%     Adapted from a code by Jos Martin.

N = 25;   % Number of searches to launch at a time.
specrad_target = sqrt(n)*c;
% Launch initial N searches for the pool to work on.
f = make_searches; k = 1;
while 1
    % Add N more searches to the pool's list of tasks.
    f = [f make_searches];
    % Logical array to track the completed searches.
    complete = false(size(f));

    % Wait for any N of the 2*N searches to complete.
    for j = 1:N
        [index,found,specrad,A] = fetchNext(f);
        fprintf('Iteration: %d, index = %d\n',k,index);
        if found
           % Target met, so cancel the other searches and return.
           cancel(f), return
        end
        % Mark this particular search as complete, for removal below. 
        complete(index) =  true;

    end
    % Remove completed searches, to minimize length of f.
    f = f(~complete);
    k = k +1;
end

    function f = make_searches
    %MAKE_SEARCHES   Create block of N searches (nested function).
        for i = N:-1:1  % Reverse loop, so no need to allocate f.
            f(i) = parfeval(@search,3,specrad_target,n);
        end
    end

end

function [found,specrad,A] = search(specrad_target,n)
%SEARCH    Generate random matrix and check spectral radius.
A = randn(n);
specrad = max(abs(eig(A)));
found = (specrad >= specrad_target);
end