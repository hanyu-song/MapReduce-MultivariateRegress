function [fitted_res] = WavLM(y,x)
[n,t] = size(y);
tpower = log(t) / log(2);
p = size(x,2);
transf_y =repmat(0, [n, t]);
for k = 1:n
    [c,l] = wavedec(y(k,:),tpower,'haar');
    transf_y(k,:) = c;
end
Estimate = cell(t,1);
SE = cell(t, 1);
tStat = cell(t, 1);
pValue = cell(t,1);
for j = 1:t
    model = LinearModel.fit(x,transf_y(:,j),'Intercept',false);
    Estimate(j) = mat2cell(model.Coefficients.Estimate, p, 1);
    SE(j) = mat2cell(model.Coefficients.SE, p, 1);
    tStat(j) = mat2cell(model.Coefficients.tStat, p, 1);
    pValue(j) = mat2cell(model.Coefficients.pValue, p, 1);
end

outValue = struct('Estimate',Estimate, 'SE',SE, 'tStat',tStat,...
                 'pValue',pValue);
fitted_res = struct2table(outValue);
 
end

