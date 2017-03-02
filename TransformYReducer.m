function TransformYReducer(intermKey, intermValIter, outKVStore)
while hasnext(intermValIter)
    outValue = getnext(intermValIter);
  end
add(outKVStore,intermKey,outValue);
end
