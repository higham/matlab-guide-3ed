classdef maxplus < double

  methods 

    function obj = maxplus(a)
    % Maxplus class constructor.
      if ~isreal(a), error('Max-plus matrices must be real.'), end
      obj = obj@double(a);
    end

    function z = plus(x,y)
      z = maxplus(max(x,y));  
    end
  
    function z = times(x,y)
      z = maxplus(double(x) + double(y));  
    end

    function z = mtimes(x,y)
      [m,n] = size(x);
      [n1,p] = size(y);
      if n ~= n1, error('Matrix dimensions not compatible.'), end
      if max([m n p]) == 1
         z = maxplus(double(x) + double(y));  % Scalar operands.
      else
        % Matrix multiplication.  
        z = zeros(m,p,'maxplus'); % 'maxplus' argument essential here!
        for i = 1:m
            for j = 1:p
                z(i,j) = maxplus(max(double(x(i,:).') + double(y(:,j))));
                % Less efficient, but equivalent to previous line:
                % for k = 1:n
                %     z(i,j) = z(i,j) + x(i,k)*y(k,j);
                % end    
             end
        end
      end
    end  

    function z = mpower(x,k)
      % k a nonnegative integer.   
      if (round(k) ~= k) || k < 0
          error('Only nonnegative integer powers are supported.')
      end    
      if k == 0
         z = eye(size(x),'maxplus'); return
      end
      z = x;
      for i = 2:k
          z = z*x;
      end    
    end 
  
    function disp(a)
      % Called by display function to display an object.
      disp(double(a))
    end

  end

  methods (Static)
    % Methods that do not require an object of the class as input. 
    % Support all three possible syntaxes of input to eye and zeros.

    function A = eye(m,n)
    % Identity matrix in the max-plus algebra.  
      if nargin == 1
          if length(m) == 1
              n = m; 
          else
              n = m(2); m = m(1);
          end
      end     
      A = repmat(-inf,[m,n]);
      A(1:m+1:m*min(m,n)) = 0;  % Set diagonal to zero.
      A = maxplus(A);
    end    

    function A = zeros(m,n)
    % Zero matrix in the max-plus algebra.  
      if nargin == 1
          if length(m) == 1
              n = m; 
          else
              n = m(2); m = m(1);
          end
      end     
      A = maxplus(repmat(-inf,[m,n]));
    end    

  end
  
end 