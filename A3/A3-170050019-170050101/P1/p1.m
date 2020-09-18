n=[5,10,20,40,60,80,100,500,1000,10000];
m=100;
mu_true=10;
mu_prior=10.5;
sigma_prior=1;
sigma=4; %true sigma
final(1:m,1:20)=0;
mle(1:m,1:10)=0;
map1(1:m,1:10)=0;
map2(1:m,1:10)=0;
for j=1:10    
    for i=1:m
        r=normrnd(10,4,[1,n(j)]); %Generating the data sample
        mu_mle = sum(r)/n(j);  %Evaluate the mle
        mu_map1 = (mu_mle*(sigma_prior^2) + mu_prior*(sigma^2)/n(j))/(sigma_prior^2 + (sigma^2)/n(j)); %Evaluating map1  
        mu_map2 = mu_mle; %Evaluating map2 (Here map2 = mle since prior is a uniform distribution)
        rel_mle = abs(mu_mle - mu_true)/mu_true;
        rel_map1 = abs(mu_map1-mu_true)/mu_true;
        rel_map2 = abs(mu_map2-mu_true)/mu_true;
        final(i,2*j-1)=rel_mle;
        final(i,2*j)=rel_map1;
        %final(i,3*j)=rel_map2;
        mle(i,j)=rel_mle;
        map1(i,j)=rel_map1;
        map2(i,j)=rel_map2;
    end
end
boxplot(mle,n)
title('Relative error of MLE')
xlabel('N')
ylabel('Relative error')
figure
boxplot(map1,n)
title('Relative error of MAP1')
xlabel('N')
ylabel('Relative error')
figure
boxplot(map2,n)
title('Relative error of MAP2')
xlabel('N')
ylabel('Relative error')
figure
boxplot(final,[5,6,10,11,20,21,40,41,60,61,80,81,100,101,500,501,1000,1001,10000,10001])
title('Relative error of both together')
xlabel('N')
ylabel('Relative error')