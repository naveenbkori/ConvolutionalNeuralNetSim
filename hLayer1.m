function [z1,a1] = hLayer1(inputLayer, theta1)

 z1 = zeros(8,1);             % hidden layer1 neurons = 8
 a1 = zeros(8,1);
 
 for i = 1:8
     
    z1(i) = inputLayer' * theta1(:,i);
    a1(i) = sigmoid(z1(i));
    
 end

end
