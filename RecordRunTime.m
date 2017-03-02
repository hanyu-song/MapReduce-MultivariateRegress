function [averTime, minTime,trimmedAverTime] = RecordRunTime(DoMapReduce,n,p,t,s,type,R2,...
    r,REPS)
if nargin < 4 
    t = 128;
end
if nargin < 5
    s = 5;
    type = 'ind';
     R2 = 0.9;
     r = 0;
elseif nargin < 6
    type = 'ind';
    R2 = 0.9;
    r = 0;
elseif nargin < 7
    R2 = 0.9;
    if strcmp(type, 'corr') || strcmp(type, 'l1-ball'), r = 0.6;
    elseif strcmp(type, 'group'), r = 3;
    elseif strcmp(type, 'factor'), r = 5;
    end
end
if nargin < 9 
    REPS = 10;
end
    
tElapsed = double.empty(REPS,0);
if DoMapReduce
 for i=1:REPS
        [X,Y,beta] = SimulData(n, p,t, s,type, R2, r);
        tStart = tic; 
        resTable = WavLM_mapred(Y,X);
        tElapsed(i) = toc(tStart);  
 end
else 
    for i = 1:REPS
        [X,Y,beta] = SimulData(n, p,t, s,type, R2, r);
        tStart = tic;
        resTable = WavLM(Y,X);
        tElapsed(i) = toc(tStart);
    end
end
averTime = sum(tElapsed)/REPS;  
minTime = min(tElapsed);
trimmedAverTime = trimmean(tElapsed,50);  
end