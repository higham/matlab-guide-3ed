classdef circulant

  properties
    vector  % Vector of coefficients in first row of matrix.
    eig     % Vector of eigenvalues.
  end

  methods 

    function obj = circulant(c,e)
      obj.vector = c;
      if nargin < 2, e = length(c)*ifft(c); end   
      obj.eig = e;  
    end
    
    function x = plus(a,b)
      x = circulant(a.vector + b.vector,a.eig + b.eig);
    end

    function x = mldivide(a,b)
      for j = size(b,2):-1:1  % Reverse order preallocates x.
          x(:,j) = fft(a.eig .\ ifft(b(:,j))); 
      end    
    end
 
    function x = mtimes(a,b)
      n = length(a.vector);
      if n ~= length(b.vector)
         error('The matrices do not conform for multiplication');
      end    
      e = a.eig.*b.eig; v = fft(e)/n; 
      x = circulant(v,e);
    end

    function x = inv(a)
      if min(abs(a.eig)) <= eps*max(abs(a.eig))
         warning('Matrix is singular to working precision.')
      end    
      n = length(a.vector);
      e = 1./a.eig; v = fft(e)/n;
      x = circulant(v,e);
    end
    
    function disp(a)
      disp(a.vector')
    end
    
  end
  
end  