# Graph the eigenvalues of the covariance Matrix of the matrix of input data column vectors.

## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-01-26

function retMat = graphCovEigen (M)
  d = size(M, 1)
  N = size(M, 2)
  retMat = covarianceMatrix(M);
  
  [eigenVec, eigenVal] = eig(retMat)
  
  y = eigenVal * ones(d, 1)
  y = sort(y, "descend")
  x = linspace(1, d, d);
  
  plot(x, y)
  
endfunction
