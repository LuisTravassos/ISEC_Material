function [w, b] = inicializa1(p, t)
    
    if nargin < 2
        error('unsuficient number of arguments')
    end

    % size(A) returns a row vector whose elements are the 
    % lengths of the corresponding dimensions of A
    [R,Q] = size(p);    %iniciar matrix com p tamanho

    if max(R,Q) > 1
      r = R;            % r=n. of inputs
    end

    [S,Q] = size(t);    %iniciar matrix com a tamanho

    if max(S,Q) > 1
      s = S;            %s=n. of neurons
    end
    
    % weight/bias initialization Matlab function - dimension=s*r
    w = rands(s,r);

    % initialize all bias to zero (number of bias=number of neurons)
    b=zeros(1,s);

