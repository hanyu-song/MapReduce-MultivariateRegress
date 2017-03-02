N = 1000;
p = 10;
T = 16;
%for k = 1:10
    [X,Y,beta] = SimulData(N, p,T,5);
     resTable = WavLM_mapred(Y,X);
    [beta_mat,origbeta_mat]= BetaWavRec(resTable);
    [shrunkBetaRec] = ThresholdBeta(origbeta_mat);
 %end
%save('runtimeMPvsDir.mat', 'TimeMat2');


[X1,Y1,beta1] = SimulData(N, p,T,5,'ind_corrnoise');
     resTable1 = WavLM_mapred(Y1,X1);
    [beta_mat1,origbeta_mat1]= BetaWavRec(resTable1);
    [shrunkBetaRec1] = ThresholdBeta(origbeta_mat1);