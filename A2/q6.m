clear;
clc;
clear all;
t1 = imread('T1','jpg');
t2 = imread('T2','jpg');
t3 = 255 - t1;
m = 532;
n = 460;
qmi = zeros(1,21);
qmi2 = zeros(1,21);
for t=-10:10
    pi1i2 = zeros(26);
    pi1 = zeros(1,26);
    pi2 = zeros(1,26);
    pi1i3 = zeros(26);
    pi3 = zeros(1,26);
    if t >= 0
     T = zeros(m,t);
     t4 = t2(:,1:n-t);
     t5 = t3(:,1:n-t);
     t4 = [T t4];
     t5 = [T t5];
     corr(t+11) = corr2(t1,t4);
     corr1(t+11) = corr2(t1,t5);
     for i = 1:m
         for j = 1:n
             tx = (t1(i,j) - rem(t1(i,j),10))/10 + 1;
             ty = (t4(i,j) - rem(t4(i,j),10))/10 + 1;
             ty1 = (t5(i,j) - rem(t5(i,j),10))/10 + 1;
             pi1i2(tx,ty) = pi1i2(tx,ty) + 1;
             pi1i3(tx,ty1) = pi1i3(tx,ty1) + 1;
         end
     end
     pi1i2 = pi1i2./(m*n);
     pi1i3 = pi1i3./(m*n);
      for i = 1:26
         pi1(i) = sum(pi1i2(i,:));
         pi2(i) = sum(pi1i2(:,i));
         pi3(i) = sum(pi1i3(:,i));
      end   
 
     for i = 1:26
        for j = 1:26
            qmi(t+11) = qmi(t+11) + power((pi1i2(i,j) - (pi1(i) * pi2(j))),2);
            qmi2(t+11) = qmi2(t+11) + power((pi1i3(i,j) - (pi1(i) * pi3(j))),2);
        end
     end
     
    else
            
%      pi1i2 = zeros(26:26);
%      pi1 = zeros(1,26);
%      pi2 = zeros(1,26);
      t4 = t2(:,abs(t)+1:end);
      t5 = t3(:,abs(t)+1:end);
      T = zeros(m,abs(t));
      t4 = [t4 T];
      t5 = [t5 T];
      corr(t+11) = corr2(t1,t4);
      corr1(t+11) = corr2(t1,t5);
 
      for i = 1:m
         for j = 1:n
             tx = (t1(i,j) - rem(t1(i,j),10))/10 + 1;
             ty = (t4(i,j) - rem(t4(i,j),10))/10 + 1;
             ty1 = (t5(i,j) - rem(t5(i,j),10))/10 + 1;
             pi1i2(tx,ty) = pi1i2(tx,ty) + 1;
             pi1i3(tx,ty1) = pi1i3(tx,ty1) + 1;
         end
     end
     pi1i2 = pi1i2./(m*n);
     pi1i3 = pi1i3./(m*n);
      for i = 1:26
         pi1(i) = sum(pi1i2(i,:));
         pi2(i) = sum(pi1i2(:,i));
         pi3(i) = sum(pi1i3(:,i));
      end
     for i = 1:26
          for j = 1:26
            qmi(t+11) = qmi(t+11) + power((pi1i2(i,j) - (pi1(i) * pi2(j))),2);
            qmi2(t+11) = qmi2(t+11) + power((pi1i3(i,j) - (pi1(i) * pi3(j))),2);
        end
     end
    end    
end

figure
plot([-10:10],corr);
title('Correlation versus t_x when I_2 is T_2.jpg')
xlabel('t_x')
ylabel('Correlation coeffient')

figure
plot([-10:10],qmi);
title('QMI versus t_x when I_2 is T2.jpg')
xlabel('t_x')
ylabel('QMI')

figure
plot([-10:10],corr1);
title('Correlation versus t_x when I_2 = 255 - I_1')
xlabel('t_x')
ylabel('Correlation coeffient')

figure
plot([-10:10],qmi2);
title('QMI versus t_x when I_2 is 255 - I_1')
xlabel('t_x')
ylabel('QMI')