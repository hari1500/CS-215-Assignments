function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
if(rem(n,2) == 0)
    if(NewDataValue <= A(n/2)) 
        newMedian = A(n/2);
        return;
    elseif(NewDataValue >= A((n/2)+1))
        newMedian = A( (n/2) + 1);
        return;
    else
        newMedian = NewDataValue;
        return;
    end
else
    if(NewDataValue <= A((n-1)/2))
        newMedian = (A((n-1)/2) + oldMedian )/2;
        return;
    elseif(NewDataValue >= A((n+3)/2))
        newMedian = (A((n+3)/2) + oldMedian ) /2;
        return;
    else 
        newMedian = (oldMedian + NewDataValue)/2;
        return;
    end
end