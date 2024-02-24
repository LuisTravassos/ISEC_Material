clear all

load myNet %parte2aula2_1

%load test date set
Dadosteste=load('optdigits.tes');

x=Dadosteste(:,1:64)';
targets=Dadosteste(:,65)';
t=full(ind2vec(targets+1));

y = net(x);

plotconfusion(t,y)

%evaluation metrics
[C,CM,IND,PER]=confusion(t,y); %CM=confusion matrix

Precision=zeros(10,1);%=PER(:,3)
Recall=zeros(10,1);

for i=1:10
    Precision(i,1)=CM(i,i)/( CM(i,i) + (sum(CM(:,i)) - CM(i,i)) );
    Recall(i,1)=CM(i,i)/( CM(i,i)+ ( sum( CM(i,:))- CM(i,i)));
end