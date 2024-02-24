function y = regressao1(x, d1, d2)      % function declaration/name
    [xl, xc] = size(x);     % matrix inicialization
    
    % nargin returns the number of function input arguments given 
    % in the call to the currently executing function
    if nargin == 2
        d2 = d1;
        d1 = 0;
    end
    
    % zeros(n) returns an n-by-n matrix of zeros
    y = zeros(xl*(d2-d1+1),xc);

    % completion of the matrix
    for i=0:(d2-d1)
      y((1:xl)+xl*i,(i+d1+1):xc) = x(:,1:(xc-i-d1));
    end