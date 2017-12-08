# K Means Clustering
An implementation of "K-Means Clustering" in processing.

K-Means Clustering is a type of Machine Learning Model. It's for "Unsupervised Learning" (meaning you have data with no labels).

## How it Works
(I got this from [Siraj Raval](https://www.youtube.com/watch?v=9991JlKnFmk&spfreload=1))
* Input: K, set of points x1 ... xn
* Place centroids c1 ... ck at random locations
* Repeat until convergence:
  * for each point xi:
    * find nearet centroid cj
    * assign the point xi to cluster j
  * for each cluster j = 1 ... K:
    * new centroid cj = mean of all points xi assigned to cluster k in previous step
* Stop when none of the cluster assignments change
