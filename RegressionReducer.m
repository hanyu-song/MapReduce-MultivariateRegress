function RegressionReducer(intermKey, intermValIter, outKVStore)
while hasnext(intermValIter)
    Value = getnext(intermValIter);
    Estimate = Value(:,1);
    SE = Value(:,2); 
    tStat = Value(:,3);
    pValue = Value(:,4);
end
outValue = struct('Estimate',Estimate, 'SE',SE, 'tStat',tStat,...
                 'pValue',pValue);
add(outKVStore,intermKey,outValue);
end
