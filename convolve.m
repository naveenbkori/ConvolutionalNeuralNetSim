function y = convolve(ball, filter)

k = zeros(2,2);
y = zeros(4,4);

for i = 1:length(ball)-1
    
    for j = 1:length(ball)-1
        
            k(1,:) =  ball(i,j:j+1) .* filter(1,:);
            k(2,:) =  ball(i+1,j:j+1) .* filter(2,:);
           y(i,j) = sum(sum(k));

    end
end

end
