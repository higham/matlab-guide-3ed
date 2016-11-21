classdef maxplus < double

  methods 

    function obj = maxplus(a)
    % Maxplus class constructor.
      if ~isreal(a), error('Max-plus scalars must be real.'), end
      obj = obj@double(a);
    end

    function z = plus(x,y)
      z = maxplus(max(x,y));  
    end

    function z = mtimes(x,y) 
      z = maxplus(double(x) + double(y));
    end  

    function z = mpower(x,k)
      % k a nonnegative integer.   
      if (round(k) ~= k) || k < 0
          error('Only nonnegative integer powers are supported.')
      end    
      if k == 0
         z = maxplus(0); return
      end
      z = x;
      for i = 2:k
          z = z*x;
      end    
    end

  end
  
end 