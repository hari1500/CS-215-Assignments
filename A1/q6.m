x = (0:0.00001:10);
for k = 1:5
    y( : ,k) = k*sin(x);
end
plot(x,y);