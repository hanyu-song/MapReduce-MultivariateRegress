function [shrunkBetaRec] = ThresholdBeta(origbeta_mat)
%% input is reconstructed beta matrix
csvwrite('in.csv',[origbeta_mat]);
!R CMD BATCH /Users/Hanyu/Documents/MATLAB/MapReduceProject/finalised/ThresholdBeta.r
shrunkBetaRec = csvread('out.csv',1,1);
%[p,wavecoefCounts] = size(origbeta_mat);
    

end

