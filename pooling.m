function yp = pooling(Cout1)

pool_window = zeros(2,2);

h = zeros(2,2);


for i = 1:2:size(Cout1)
    
    for j = 1:2:size(Cout1,2)
        
        
        k = max([Cout1(i,j:j+1) Cout1(i+1, j:j+1)]);
        
        h((i+1)/2,(j+1)/2) = k;
        
    end
   
end

 yp = h;


end