## Density Estimation

### Problem Motivation

![000196](images/2020-11-03-000196.jpg)

Given the training set, we are going to build a model $P(x)$ i.e. a model for the probability of x, where x are these features of say aircraft engine.

 ![000197](images/2020-11-03-000197.jpg)

  

![000198](images/2020-11-03-000198.jpg)

### Gaussian Distribution

This is also called the normal distribution.

![000199](images/2020-11-03-000199.jpg)

![000200](images/2020-11-03-000200.jpg)

### Algorithm

 ![000202](images/2020-11-03-000202.jpg)

Given the dataset $x^1, x^2, x^3, ..., x^m$, wherein each of these datasets denotes a feature of an user i.e.  $x^1$ is user 1 and so on. Now for $x^1$, there are multiple features such as $x_1, x_2, x_3, ..., x_n$ 

![000203](images/2020-11-03-000203.jpg)

so we get, 

$ \mu_2 = \frac{1}{m}[x_2^1+x_2^2+x_2^3+...+x_2^m] $ 


![000204](images/2020-11-03-000204.jpg)

## Building an Anomaly detection system

### Developing and evaluating Anomaly detection system

![000208](images/2020-11-10-000208.jpg)

![000209](images/2020-11-10-000209.jpg)

![000210](images/2020-11-10-000210.jpg)

### Anomaly detection vs supervised learning

![000211](images/2020-11-11-000211.jpg)
![000212](images/2020-11-11-000212.jpg)

### Choosing what features to use

Choose features that result in a bell curve in histogram, you can also convert features to create a more bell shape curve as described in the image below.

![000213](images/2020-11-11-000213.jpg)

![000214](images/2020-11-11-000214.jpg)

![000215](images/2020-11-11-000215.jpg)

![000216](images/2020-11-11-000216.jpg)

