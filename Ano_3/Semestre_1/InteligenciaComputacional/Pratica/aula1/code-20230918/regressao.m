%IC 22/23
%ISEC CPereira
%implements a signal regression

function y=regressao(x,d1,d2)
[xl,xc] = size(x);
if nargin == 2
  d2 = d1;
  d1 = 0; %default low value
end

y = zeros(xl*(d2-d1+1),xc);
for i=0:(d2-d1)
  y((1:xl)+xl*i,(i+d1+1):xc) = x(:,1:(xc-i-d1));
end
