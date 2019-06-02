## Author: Ariel Lavi <ariellavi@Ariels-MacBook-Pro.local>
## Created: 2018-02-14

% Implements k-means algorithm

% Inputs:
%   - (d x N) matrix of the domain D (N d-dimensional data points)
%   - (d x k) matrix of initial centroids (centsI)
%   - integer k, number of clusters

% Outputs
%   - (d x k) matrix of final centroids (centsF)
%   - (1 x N) vector of classes numbered 1 to k (class)

function [centsF, class] = kMeansCluster (D, centsI, k)

N = size(D, 2);                                   % Number of data points
d = size(D, 1);                                   % dimension of data points

class = zeros(1, N);
centsF = centsI
current = ones(1, N);


while ( !isequal(current, class) ) {              % keep iterating until update is the same (converges)

  class = current;
  
  temp = [];
  dist = [];
  index = [];
  
  for i = 1:N                                     % Update class vector
    for j = 1:k
    
      dist = norm( D(:,N) - centsF(:, j) )        % ditance from Nth data point to current jth cluster
      
      if (j == 1)
        temp = dist;  
        index = 1;
      endif
      
      if (dist < temp)                            % if distance to current cluster smaller, assign to temp
        temp = dist;
        index = j;
      endif
      
    endfor
    
    current[i] = j;                               % assign new classes
    
  endfor

  
    
    for j = 1:k
    
    vec = [];                                     % placeholder for columns of D that are in cluster j
    
        for i = 1:N
        
          if ( class(i) == j )                    % if point belongs to class j, add to vec
            vec = [vec, D(:, i)]
          endif
        
        endfor
        
       centsF(:, j) = ( sum(vec, 2) / length(vec) );  % jth centroid update
        
    endfor
  
  }

print('end');

endfunction
