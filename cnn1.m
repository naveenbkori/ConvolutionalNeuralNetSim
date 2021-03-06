clear;
close all;
clc;

I = imread('example.jpeg');
k = rgb2gray(I);
bw = imbinarize(k);

imshow(bw);
imshow(k);
imshow(I);

%%%%%%%%%%%%%%%%%%%% CONVOLUTION LAYER  %%%%%%%%%%%%%%%%%%%%%%%

ball = [-1 -1 1 1 -1; -1 1 -1 -1 1; -1 1 -1 -1 1; -1 1 -1 -1 1; -1 -1 1 1 -1];

filter1 = [-1 1; 1 -1];

filter2 = [1 -1; -1 1];

filter3 = [1 -1; 1 -1];

filter4 = [-1 1; -1 1];

filter5 = [-1 1; 0 0];

filter6 = [1 -1; 0 0];

feature(:,:,1) = filter1;
feature(:,:,2) = filter2;
feature(:,:,3) = filter3;
feature(:,:,4) = filter4;
feature(:,:,5) = filter5;
feature(:,:,6) = filter6;
 


for k = 1:6

Cout1(:,:,k) = (convolve(ball, feature(:,:,k)))./prod(size(feature(:,:,1)));

Pout1(:,:,k) = pooling(Cout1(:,:,k));

end



%%%%%%%%%%%%%%%%%%%%%%% FORWARD PASS NEURAL NETWORK %%%%%%%%%%%%%%%%%%
% NUMBER OF LAYERS = 3 ( INPUT, HIDDEN, OUTPUT)


y_d = [0.99 0.01];
eta = 0.5;                  % eta = learning rate

inputLayer = Pout1(:);

theta1 = rand(24,8);
theta2 = rand(8,2);

[z1, a1] = hLayer1(inputLayer, theta1);
[z2, a2] = hLayer2(a1, theta2);

y_out = a2;


%%%%%%%%%%%%%%%%% BACK PROPAGATION USING GRADIENT DESCENT %%%%%%%%%%%%%%%%


E1 = ((y_d(1,1) - y_out(1,1)).^2)./2;

E2 = ((y_d(1,2) - y_out(1,2)).^2)./2;

Et = E1 + E2;


dEt_da2 = -(y_d(1,1) - a2(1,1));      % dEt/dout

da2_dz2 = a2(1,1)*(1 - a2(1,1));     % dout/dnet

dz2_dw5 = a1(1,1);                   % dz2/dweight

dEt_dw5 = -(y_d(1,1) - a2(1,1)) * a2(1,1)*(1 - a2(1,1)) * a1(1,1);


w5_new = theta2(1,1) - eta * dEt_dw5;










