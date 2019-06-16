# k-Means Clustering

The MATLAB script defines a function kMeansCluster that clusters data points

The function takes as inputs:
  - D : a (d x N) matrix of the domain D, consisting of N data points of dimension d
  - centsI : a (d x k) matrix of k initial centroids
  - integer k, the number of clusters to define
  
The function returns:
  - centsF : a (d x k) matrix of final centroids
  - class : a (1 x N) vector of classes numbered 1 to k
  
