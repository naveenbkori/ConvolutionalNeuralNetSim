function [z2, a2]  = hLayer2(a1, theta2)

z2 = zeros(1,2);
a2 = zeros(1,2);

for i = 1:2

    z2(i) = a1'*theta2(:,i);
    a2(i) = sigmoid(z2(i));
end

end
