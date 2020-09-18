n = 10000;
r = 1;
gen = rand(1,10000)*2*pi; %generating random angle from 0 to 2pi
points = [cos(gen); sin(gen)]*r; % getting points using angle
mlemu = mean(points,2); %using formula derived in report
cmle = ((points-repmat(mlemu,1,n))*(points-repmat(mlemu,1,n))')/n; % using formula derived in report

display(mlemu);
display(cmle);
