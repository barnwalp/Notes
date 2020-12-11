## Learning with Large Datasets

### Gradient Descent with Large Datasets

How can you tell if using larger dataset (say 100 million) is likely to perform much better than using a small subset of data (say 1000)

----

Plot a learning curve for a range of values of m and verify that the algorithm has high variance when m is small.

![000243](images/2020-11-15-000243.jpg)

In the above picture, it is prudent to use large datasets, however in the second case, algorithm will work just as good with lesser datasets.

### Stochastic Gradient Descent

![0002444](images/2020-11-15-000244.jpg)

Gradient descent need to read into memory all m (say 300 million) records in order to compute the derivate term for just one step of gradient descent. it is very time consuming. 

![000245](images/2020-11-15-000245.jpg)
Unlike batch gradient descent, stochastic gradient descent does not converge to a global minima instead it will sort of converge to a smaller region which contains global minima i.e. converge near global minimum. 

![000246](images/2020-11-15-000246.jpg)

### Mini Batch Gradient Descent

![000247](images/2020-11-15-000247.jpg)

Typical range of mini-batch is 2-100

mini batch gradient descent outperforms stochastic gradient descent when you vectorize the summation part of the gradient descent.

![000248](images/2020-11-15-000248.jpg)

### Stochastic Gradient Descent Convergence

 ![000249](images/2020-11-15-000249.jpg)

- In the first picture, it shows that using smaller value of $\alpha$, cost function may converge better around global minima. 
- In the second graph, it shows that using larger number on which cost function is averaged, will result in a smoother graph

![000250](images/2020-11-15-000250.jpg)

![000251](images/2020-11-15-000251.jpg)

### Online Learning

 ![000252](images/2020-11-15-000252.jpg)

CTR - click through rate - probability that an user will click a returned list from a search queries.

![000253](images/2020-11-15-000253.jpg)

### Map Reduce and Data Parallelism

![000254](images/2020-11-15-000254.jpg)

![000255](images/2020-11-15-000255.jpg)

Instead of different machine, one can also use multiple core of same machine which is better as it does not have any network latency.