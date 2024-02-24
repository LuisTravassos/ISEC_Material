%IC 22/23
%C. Pereira

% Cancela ruido
% Noise cancelation from Handel's music "Aleluia" with ADALINE networks
clear all;
clear figure;
randomnoise=1;

load handel         % load music signal
Sinal=y(1:30000)';  % retirar primeiras 30000 amostras (get first 3000 samples)
sound(Sinal,Fs);    % play 
pause

time=1:1:length(Sinal);	%time signal
if randomnoise==0 
    ruido = randn(1,length(time));		% ruido (random noise)
else
    ruido=sin(time); %sinusoide
end

% adiciona ruido
amplitude=1 %amplitude do ruido
sinalcomruido=Sinal+amplitude*ruido;	
sound(sinalcomruido,Fs) %play music contaminated by the noise
pause

%treina rede ADALINE
p=regressao(ruido,10); %inputs to the network (regression vector - Podem variar)
[w,b]=inicializa(p,ruido); %initialize the network parameters
t=sinalcomruido; %valor desejado (target)
lr=0.01; %coeficiente de aprendizagem (podem variar!) - learning rate
[y,e,w,b] = adapta(w,b,p,t,lr); %adaptive training of the network

%performance assessment
sound(e); %play original signal (noise cleared?)
mse=mse(Sinal,e) %mean squared error