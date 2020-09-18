n=[5,10,20,40,60,80,100,500,1000,10000];
n2=[5,5,10,10,20,20,40,40,60,60,80,80,100,100,500,500,1000,1000,10000,10000];
m=100;
alpha=5.5;
beta=1;
lambda=5;
mean=1/lambda; %mean denotes the true lambda
final(1:m,1:20)=0;
mle(1:m,1:10)=0;
bepm(1:m,1:10)=0; %Bayesian estimate posterior mean array
%y will exponentially distributed random variable with pdf = lambda * exp(-lambda*y)
for j=1:10
    for i=1:m
        r=rand(1,n(j)); %Generating the data sample X
        y=(-0.2)*log(r); % Data sample Y
        mu_mle=n(j)/sum(y);
        mu_bepm=(n(j)+alpha)/(beta+sum(y));
        rel_mle = abs(mu_mle-mean)/mean;
        rel_bepm = abs(mu_bepm-mean)/mean;
        mle(i,j)=rel_mle;
        final(i,2*j-1)=rel_mle;
        final(i,2*j)=rel_bepm;
        bepm(i,j)=rel_bepm;
    end
end
boxplot(mle,n)
title('Relative error of MLE')
xlabel('N')
ylabel('Relative error')
figure
boxplot(bepm,n)
title('Relative error of Posterior mean Bayesian estimate')
xlabel('N')
ylabel('Relative error')
figure
boxplot(final,[5,6,10,11,20,21,40,41,60,61,80,81,100,101,500,501,1000,1001,10000,10001]) 
title('Relative error of both together')
xlabel('N')
ylabel('Relative error')