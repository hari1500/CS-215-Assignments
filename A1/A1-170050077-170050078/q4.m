clear;
clear all;
clc;
x = [-3:0.02:3] ;
y = 5 * cos( 2.2 * x + (pi / 3));
p5 = plot(x,y,'color','red');
f = 0.3;
n = round( f * length(x));
indices = randperm(length(x));
indices = indices(1:n);

z = y;
for i = 1:length(indices),
    z(indices(i)) = z(indices(i)) + randn(1,1) * realsqrt(38.5) + 110;
end

hold on
p1 = plot(x,z,'color','green');
ymedian = rand(1,length(z));
for i = 1:length(z),
    if ((i-8)<=0),
        ymedian(i) = median(z(1:(i+8)));
    elseif ((i+8)>length(z)),
        ymedian(i) = median(z((i-8):length(z)));
    else
        ymedian(i) = median(z((i-8):(i+8)));
    end
end
p2 = plot(x,ymedian,'color','yellow');


ymean = rand(1,length(z));
for i = 1:length(z),
    if ((i-8)<=0),
        ymean(i) = mean(z(1:(i+8)));
    elseif ((i+8)>length(z)),
        ymean(i) = mean(z((i-8):length(z)));
    else
        ymean(i) = mean(z((i-8):(i+8)));
    end
end
p3 = plot(x,ymean,'color','black');



yquartile = rand(1,length(z));
for i = 1:length(z),
    if ((i-8)<=0),
        yquartile(i) = quantile(z(1:(i+8)),0.25);
    elseif ((i+8)>length(z)),
        yquartile(i) = quantile(z((i-8):length(z)),0.25);
    else
        yquartile(i) = quantile(z((i-8):(i+8)),0.25);
    end
end
p4 = plot(x,yquartile,'color','blue');
hold off

lgd = legend([p5 p1 p2 p3 p4],{'Sine wave','Corrupted sine wave','Median filtered','Mean filtered','Quartile filtered'})

nrmedsum = 0;
drmedsum = 0;
for i= 1:length(x),
    nrmedsum = nrmedsum + power( y(i)-ymedian(i) ,2) ;
    drmedsum = drmedsum + power( y(i),2) ;
end

rerrormedian = nrmedsum/drmedsum



nrmeansum = 0;
drmeansum = 0;
for i= 1:length(x),
    nrmeansum = nrmeansum + power( y(i)-ymean(i) ,2) ;
    drmeansum = drmeansum + power( y(i),2) ;
end

rerrormean = nrmeansum/drmeansum


nrquarsum = 0;
drquarsum = 0;
for i= 1:length(x),
    nrquarsum = nrquarsum + power( y(i)-yquartile(i) ,2) ;
    drquarsum = drquarsum + power( y(i),2) ;
end

rerrorquar = nrquarsum/drquarsum
