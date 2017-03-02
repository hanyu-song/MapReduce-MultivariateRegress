function[beta_mat,origbeta_mat]= BetaWavRec(resTable)  %% expects a table, with the a column named "Estimate"
    wavecoefCounts = size(resTable, 1);   
    dcoefCounts = wavecoefCounts - 1;
    %%% Here, we assume that resTable has a column called Estimate
    level = log(wavecoefCounts) / log(2);
    if level ~= floor(level)
        msg = 'error occured (t not a power of 2).';
        error(msg)
    end  
    p = size(cell2mat(resTable.Estimate(1)),1);
    beta_mat = zeros(p,wavecoefCounts);
    for k = 1:wavecoefCounts
        beta_mat(:,k) = reshape(cell2mat(resTable.Estimate(k)), [p,1]);
    end


    %% to reconstruct original coef 
    l = repmat(1, 1,level + 2);
    for n = 0:level
        l(n+2) = pow2(n);
    end

    origbeta_mat = repmat(1,p,wavecoefCounts);
    res = waverec(beta_mat(1,:),l,'haar');

    for k = 1:p
      origbeta_mat(k,:) = waverec(beta_mat(k,:),l,'haar');
       
    end
    csvwrite('in.csv',[origbeta_mat]);

        
end
