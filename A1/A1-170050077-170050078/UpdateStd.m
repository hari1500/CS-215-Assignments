function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
newStd = sqrt((power(OldStd,2) * (n - 1) + (n + 1) * power(OldMean - NewMean ,2) + power(NewDataValue-OldMean,2)+ 2 * (OldMean - NewMean)*(NewDataValue - OldMean)) / n);
return;
end