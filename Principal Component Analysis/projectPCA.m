## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-01-26

% Uses PCA to reduce dimensionality of data from d to n.

% Takes as input a matrix M (d x N) with N data points of dimension d
% and an integer n (the number of principal components onto which data will be projected)

% Returns the matrix retMat (d x N) containing projection of data points onto first m principal components
% still in d dimensional space.
% Also returns a (n x N) matrix projMat containing projection of points in n-dim subspace

function [retMat, projMat] = projectPCA (M, n)      % returns PCA projection onto first n principal components
  avg = mean(M, 2);                       % mean column vector
  N = size(M, 2);                         % number of data points
  d = size(M, 1);                         % dimension of data points
  
  cov = covarianceMatrix(M);              % covariance matrix, dimensions d x d
  
  [eigenVec, eigenVal] = eig(cov);
  y = eigenVal * ones(d, 1);
  [y, index] = sort(y, "descend");
  
  retMat = zeros(d, N);
  for i = 1:N
    retMat(:, i) = avg;
  endfor
  
  principalEigenVec = zeros(d, n);
  for i = 1:n                           % iterate through first n principal components
    for j = 1:N                         % iterate through data points
      temp = index(i);                  % index of ith principal eigenvector (column) in the eigenVec matrix
      principalEigenVec(:, i) = eigenVec(:, temp);      % ith principal eigenvector
      retMat(:, j)  +=  (( (M(:,j) - avg)' *  eigenVec(:,temp) ) .* eigenVec(:,temp))  ;
      
    endfor
  endfor

  projMat = (retMat' * principalEigenVec)'
  
endfunction
