## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-01-26

function retMat = projectPCA (M, n)      % returns PCA projection onto first n principal components
  avg = mean(M, 2);                       % mean column vector
  N = size(M, 2);                         % number of data points
  d = size(M, 1);                         % dimension of data points
  
  [eigenVec, eigenVal] = eig(retMat);
  y = eigenVal * ones(d, 1);
  y = sort(y, "descend")
  
  cov = covarianceMatrix(M);

endfunction
