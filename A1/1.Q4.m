clear; clc;
x = [-3:0.02:3] ;
y = 5 * cos( 2.2 * x + (pi / 3));
scatter(x,y);
f = 0.6;
n = round( f * length(x));
indices = randperm(length(x));
indices = indices(1:n);
b = y(indices);
x1 = x(indices) ;
z = b + randn(1,length(b)) * realsqrt(38.5) + 110;
hold on;
scatter(x1,z);
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
scatter(x1,ymedian);


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
scatter(x1,ymean);



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
scatter(x1,yquartile);

nrmedsum = 0;
drmedsum = 0;
for i= 1:length(indices),
    j = indices(i);
    nrmedsum = nrmedsum + power( y(j)-ymedian(i) ,2) ;
    drmedsum = drmedsum + power( y(j),2) ;
end

rerrormedian = nrmedsum/drmedsum



nrmeansum = 0;
drmeansum = 0;
for i= 1:length(indices),
    j = indices(i);
    nrmeansum = nrmeansum + power( y(j)-ymean(i) ,2) ;
    drmeansum = drmeansum + power( y(j),2) ;
end

rerrormean = nrmeansum/drmeansum


nrquarsum = 0;
drquarsum = 0;
for i= 1:length(indices),
    j = indices(i);
    nrquarsum = nrquarsum + power( y(j)-yquartile(i) ,2) ;
    drquarsum = drquarsum + power( y(j),2) ;
end

rerrorquar = nrquarsum/drquarsum
