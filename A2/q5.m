clear;
clc;
clear all;
k = [2:1:25];

p1 = 0.05;
p2 = 0.1;
for i = 2:25,
x(i-1) = i + 1 - i * power(1-p1,i);
y(i-1) = i + 1 - i * power (1-p2,i);
end;

pl1=plot(k,x);

hold on;
pl2=plot(k,y);
legend({'p = 0.05','p = 0.1'},'Location','southeast')
xlabel('No. of People')
ylabel('Expected number of tests')
title('Expected number of tests versus k')