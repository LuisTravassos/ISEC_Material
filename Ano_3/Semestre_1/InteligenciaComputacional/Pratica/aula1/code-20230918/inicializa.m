%IC 2022/23 - initialize a NN (weigths and bias)

function [w,b] = inicializa(p,a)
if nargin < 2,error('unsuficient number of arguments'),end

[R,Q] = size(p);    %p=inputs
if max(R,Q) > 1
  r = R;            %r=n. of inputs
end

[S,Q] = size(a);    %a=outputs
if max(S,Q) > 1
  s = S;            %s=n. of neurons
end

w = rands(s,r); %weight/bias initialization Matlab function - dimension=s*r
b=zeros(1,s); % initialize all bias to zero (number of bias=number of neurons)


