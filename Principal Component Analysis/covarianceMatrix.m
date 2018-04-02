# input: 2D matrix consisting of column vectors that are data points

## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-01-26

function retMat = covarianceMatrix (M)    % returns covariance matrix
  avg = mean(M, 2);                       % mean column vector
  N = size(M, 2);
  d = size(M, 1);
  S = zeros(d, d);
  
  for i=1:N
    S = S .+ ( (M(:,i) .- avg) * (M(:,i) .- avg)' );         % covariance matrix
  endfor
  
  cov = (1/(N-1)).*S;
  retMat = cov;
  
endfunction
