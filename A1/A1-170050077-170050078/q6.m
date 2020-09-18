clear;
clear all;
clc;
p = [5,10,15,20,30,40,50,60,70,80,90,95,99,99.99,99.9999,100];
A = zeros(366,1);
A(1) = 1;
for i=2:366
    A(i) = ((366-i)/365)*A(i-1);
end

p = p /100;

narr = zeros(16,1);
index = 1;
for i=1:366
    if(A(i)<= 1-p(index) )
        narr(index) = i;
        index = index + 1;
        if(index == 17)
           break;
        end
    end
end


plot(p(1:length(p)),narr);
