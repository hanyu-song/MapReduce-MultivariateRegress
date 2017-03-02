function RegressionMapper(y2fit,~, intermKVStore, x2fit)
%UNTITLED Summary of this function goes here
%% Data is a n-by-3 table. Remove missing values first
groups = y2fit.wavcoef_index;
y2fit.wavcoef_index = [];
[intermKeys,~,idx] = unique(groups, 'stable');
y2fit = table2array(y2fit);
intermVals = cell(length(intermKeys),1);
for k = 1:length(intermKeys)
    model = LinearModel.fit(x2fit,y2fit(k,:),'Intercept',false);
    output = table2array(model.Coefficients);
    intermVals(k) = mat2cell(output, [size(output,1)]);
end    
addmulti(intermKVStore, intermKeys, intermVals);

end
