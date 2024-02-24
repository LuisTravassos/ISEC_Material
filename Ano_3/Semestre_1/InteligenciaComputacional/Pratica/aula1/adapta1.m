%inputs: 
    % w - weigths; 
    % b - bias; 
    % p - input vector; 
    % t - desired output vector; 
    % lr -learning rate;
%outputs: 
    % y-network output; 
    % e-error vector; 
    % w-(final) weigths; 
    % b-(final) bias;

function [y,e,w,b] = adapta1(w,b,p,t,lr)

    nneuronios = size(w,1); 
    npatterns    = size(p,2); 
    nsaidas    = size(t,1);

    y = zeros(nsaidas, npatterns);
    e = zeros(nsaidas, npatterns);

    for i=1:npatterns
      y(:,i) = w*p(:,i) + b;
      e(:,i) = t(:,i) - y(:,i);

      for j=1:nneuronios
        dw = lr*e(j,i)*p(:,i);
        w(j,:) = w(j,:) + dw';
      end
      
    end
