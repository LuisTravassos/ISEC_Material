clear all

%load training data set
Dadosteste = load('optdigits.tra');

%define the inputs and targets for the NN model
x=Dadosteste(:,1:64)';%digit representation in blocks 4x4 -> 0..16
targets = Dadosteste(:,65)'; %digit value -> "0..9"

t=full(ind2vec(targets+1)); %one hot encoding

net = patternnet(500);
net = train(net, x, t);

%view(net)
y=net(x);
perf = perform(net,t,y);
classes = vec2ind(y);
plotconfusion(t,y)

save myNet net
