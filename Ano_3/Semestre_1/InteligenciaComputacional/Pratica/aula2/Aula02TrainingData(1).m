%% IC 22-23
%% Aula 02 - Reconhecimento de digitos com redes MLP

% Definition of the Training data set (just a small data set!)

clear all;


%um exemplo de um "zero"h 
zero_1=[1 1 1 1 1 ... 
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];

%um exemplo de um "um"
um_1=[0 1 1 0 0 ... 
      1 1 1 0 0 ...
      1 0 1 0 0 ...
      0 0 1 0 0 ...
      0 0 1 0 0 ...
      0 0 1 0 0 ...
      0 1 1 1 0 ];


%um exemplo de um "dois"
dois_1=[0 1 1 1 1 ... 
        0 0 0 0 1 ...
        0 1 1 1 1 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 1 1 0 ];   

 
%um exemplo de um "tres"
tres_1=[1 1 1 1 1 ... 
        0 0 0 0 1 ...
        0 0 0 0 1 ...
        0 1 1 1 1 ...
        0 0 0 0 1 ...
        0 0 0 0 1 ...
        1 1 1 1 1 ]; 

%um exemplo de um "quatro"
quatro_1=[1 0 0 0 0 ... 
          1 0 0 0 0 ...
          1 0 1 0 0 ...
          1 1 1 1 1 ...
          0 0 1 0 0 ...
          0 0 1 0 0 ...
          0 0 1 0 0 ];   


%um exemplo de um "seis"
seis_1=[1 1 1 1 0 ... 
        1 0 0 0 0 ...
        1 0 0 0 0 ...
        1 1 1 1 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];

%um exemplo de um "sete"
sete_1=[1 1 1 1 1 ... 
        0 0 0 1 1 ...
        0 0 1 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        0 1 0 0 0 ...
        1 1 0 0 0 ];

%um exemplo de um "oito"
oito_1=[1 1 1 1 1 ... 
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ...
        1 0 0 0 1 ...
        1 0 0 0 1 ...
        1 1 1 1 1 ];
 
%um exemplo de um "nove"
 nove_1=[1 1 1 1 1 ... 
         1 0 0 0 1 ...
         1 0 0 0 1 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ]; 

 %um exemplo de um "nada"
 nada_1=[1 1 1 1 1 ... 
         1 1 1 1 1 ...
         1 1 1 1 1 ...
         1 1 1 1 1 ...
         1 0 0 0 1 ...
         1 0 0 0 1 ...
         1 0 0 0 1 ]; 

%um exemplo de um "cinco"      
cinco_1=[1 1 1 1 1 ... 
         1 0 0 0 0 ...
         1 0 0 0 0 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         1 1 1 1 1 ];
 
cinco_2=[1 1 1 1 0 ... 
         1 0 0 0 0 ...
         1 0 0 0 0 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         0 1 1 1 1 ];
      
 cinco_3=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 0 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          1 1 1 1 0 ];
      
 cinco_4=[0 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 1 ...
          0 0 0 1 1 ...
          0 0 0 0 1 ...
          1 1 1 1 1 ];
      
 cinco_5=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          0 1 1 1 1 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          0 1 1 1 1 ];

 cinco_6=[1 1 1 1 1 ... 
         1 0 0 0 0 ...
         1 0 0 0 0 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         1 1 1 1 1 ];
 
cinco_7=[1 1 1 1 0 ... 
         1 0 0 0 0 ...
         1 0 0 0 0 ...
         1 1 1 1 1 ...
         0 0 0 0 1 ...
         0 0 0 0 1 ...
         0 1 1 1 1 ];
      
 cinco_8=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 0 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          1 1 1 1 0 ];
      
 cinco_9=[0 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          1 1 1 1 1 ...
          0 0 0 1 1 ...
          0 0 0 0 1 ...
          1 1 1 1 1 ];
      
 cinco_0=[1 1 1 1 0 ... 
          1 0 0 0 0 ...
          1 0 0 0 0 ...
          0 1 1 1 1 ...
          0 0 0 0 1 ...
          0 0 0 0 1 ...
          0 1 1 1 1 ];
      
      
%%show data%%      
P=[zero_1; um_1; dois_1;... 
tres_1; quatro_1; seis_1;... 
sete_1; oito_1; nove_1; nada_1;...    
cinco_1; cinco_2; cinco_3; cinco_4; cinco_5;...
cinco_6; cinco_7; cinco_8; cinco_9; cinco_0]'; 
  
% % plot digits
% drawDigits=1;
% if drawDigits==1
%     for k=1:size(P,2)
%         d1=[];
%         for i=0:6
%             d=[];
%             for j=1:5
%                 d=[d P(i*5+j,k)];
%             end
%         d1=[d1;d];
%         end
%         colormap(gray)
%         image(100*d1)
%         pause
%     end
% end


%treinar

% T é o target, alvo, 0->errado, 1->certo
T=[0 0 0 0 0 0 0 0 0 0 ...
   1 1 1 1 1 1 1 1 1 1]; 

% Crie e treine a rede neural
net = patternnet(500);
net = train(net, P, T);

%ver 
%view(net)
y = round(net(P))
perf = perform(net,P, T);
classes = vec2ind(y);