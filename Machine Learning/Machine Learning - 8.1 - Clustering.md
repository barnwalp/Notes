## Unsupervised Learning - Introduction

Unsupervised learning is applicable to the areas where we don't have y values, where training set only contains: ${x^{(1)}, x^{(2)}, x^{(3)}, ..., x^{(m)}}$

![000165](images/2020-10-19-000165.jpg)

## K - Mean Algorithm

![000166](images/2020-10-19-000166.jpg)

 ![000167](images/2020-10-19-000167.jpg)

Images are following in clockwise direction in the following depiction

![000169](images/2020-10-19-000169.jpg)

![000168](images/2020-10-19-000168.jpg)

## Optimization Objective

![000170](images/2020-10-19-000170.jpg)

If we analyze the repeat loop in the algorithm as mentioned above, we find two steps:

1.  Cluster assignment step - which basically minimizes the cost function with respect to $C^{(1)}, C^{(2)}, C^{(3)}, ..., C^{(n)}$ while holding $\mu^{(1)}, \mu^{(2)},..., \mu^{(k)}$ fixed.
2. Move centroid step - chooses the values of $\mu$ that minimized $J(...)$ with respect to $\mu^{(1)}, \mu^{(2)},..., \mu^{(k)}$.

## Random Initialization

![000171](images/2020-10-19-000171.jpg)

K-mean can sometime get stuck to local optima of cost function.

![000172](images/2020-10-19-000172.jpg)

![000173](images/2020-10-19-000173.jpg)

If K is small number (2 - 10), then checking for cost function multiple times may provide a better clustering centroid, however if K is much greater than 10 like 100, then having multiple random initialization may not make a huge difference.

## Choosing the number of Clusters

![000174](images/2020-10-19-000174.jpg)

Elbow method is worth the shot but it may not provide clear number of clusters every time.

![000175](images/2020-10-19-000175.jpg)

