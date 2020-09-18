function newMean = UpdateMean (OldMean, NewDataValue, n)
newMean = (n * OldMean + NewDataValue ) / (n + 1) ;
return;
end