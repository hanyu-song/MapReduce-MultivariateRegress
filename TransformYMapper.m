
%% Run MapReduce
% Map each row of the responses to another vector
function TransformYMapper(data, ~, intermKVStore)  
% data: response, n by t
% output: nrow * 1 (each cell: 1 * T)
RowIndex = data.RowIndex;
[n, ncol] = size(data);
data.RowIndex =[];
[intermKeys,~,idx] = unique(RowIndex, 'stable');
data = table2array(data);
t = ncol - 1;
intermVals_mat= NaN(n,t,'double');
level = log(t) / log(2);
for k = 1:n
   [c,l] = wavedec(data(k,:),level,'haar');
   intermVals_mat(k,:) = c;
end
dim1 = repmat(1,1,n);
intermVals = mat2cell(intermVals_mat, dim1, t);
addmulti(intermKVStore, intermKeys, intermVals);
end