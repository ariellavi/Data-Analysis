
## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-03-21

## Inputs:
##    - data: a (d x N) matrix, N columns of data points of dimension d
##    - Vec, Val: d x d matrices of eigenvectors, eigenvalues of covariance matrix
##    - n: number of dimensions onto which project data
##    - avg: a (d x 1) column vector containing average data vector

## Outputs:
##    - retMat: a (d x N) matrix, coordinates in d-dimensional space of projected data
##    - projMat: a (n x N) matrix containgin projection of data onto eigenvector defined subspace

function [retMat, projMat] = PCAspecial (data, Vec, Val, n, avg)
 
 d = size(data, 1);
 N = size(data, 2);
 
 y = Val * ones(d, 1);
 [y, index] = sort(y, "descend");
 
 
 retMat = zeros(d, N);
  for i = 1:N
    retMat(:, i) = avg;
  endfor
  
  principalEigenVec = zeros(d, n);
  for i = 1:n                           % iterate through first n principal components
    for j = 1:N                         % iterate through data points
      temp = index(i);                  % index of ith principal eigenvector (column) in the eigenVec matrix
      principalEigenVec(:, i) = Vec(:, temp);      % ith principal eigenvector
      retMat(:, j)  +=  (( (data(:,j) - avg)' *  Vec(:,temp) ) .* Vec(:,temp))  ;
      
    endfor
  endfor

  projMat = (retMat' * principalEigenVec)'
 
 
endfunction
