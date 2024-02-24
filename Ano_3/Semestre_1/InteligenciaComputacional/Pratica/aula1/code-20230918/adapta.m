%IC 2022/23

%ADALINE training rule

%https://www.mathworks.com/help/deeplearning/ug/...
%   adaptive-neural-network-filters.html;

function [y,e,w,b] = adapta(w,b,p,t,lr)
%inputs: w - weigths; b - bias; p - input vector; t - desired output vector; lr -
%learning rate
%outputs: y-network output; e-error vector; w-(final) weigths; b-(final) bias

nneuronios = size(w,1); 
npatterns    = size(p,2); % numero de padroes de treino (number of training patterns )
nsaidas    = size(t,1); 

y = zeros(nsaidas, npatterns); %saida (initialize network output)
e = zeros(nsaidas, npatterns); %inicializa erro (initialize error)

for i=1:npatterns %para cada padrao de treino (for each training pattern) 
  y(:,i) = w*p(:,i) + b; %calcula a saida no instante i (calculate the output at sample "i")
  e(:,i) = t(:,i) - y(:,i); %calcula erro=target - saida da rede (calculate the error)
  for j=1:nneuronios
    dw = lr*e(j,i)*p(:,i); %calcula incremento (set increment)
    w(j,:) = w(j,:) + dw'; %actualiza pesos (update the network weigths)
  end
end
