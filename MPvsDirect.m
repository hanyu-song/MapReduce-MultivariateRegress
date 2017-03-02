%% 9000, 10000


seqN = 1000;
p = 20;
lengthT = 10;
for t = 1:lengthT
    seqT(t) = pow2(2,t+2);
 end
TimeMat2 = repmat(0, lengthT,2);
DoMapReduce = [true, false];
for t = 1:length(seqT)
    for MapReduceIdx = 1:2
        [averTime, minTime,trimmedAverTime] = RecordRunTime(DoMapReduce(MapReduceIdx),...
            seqN,p,seqT(t));
    TimeMat2(t,MapReduceIdx) = trimmedAverTime;
    end
end
save('runtimeMPvsDir.mat', 'TimeMat2');
exit;
