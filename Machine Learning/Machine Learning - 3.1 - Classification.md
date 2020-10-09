## Logistics Regression

## Classification

![000053](images/2020-10-09-000053.jpg)

To attempt classification, one method is to use linear regression and map all predictions greater than 0.5 as a 1 and all less than 0.5 as a 0. 

However, this method doesn't work well because classification is not actually a linear function. Linear regression does not properly fit the classification problem, only one data point can result in an erroneous result

![000055](images/2020-10-09-000055.jpg)

We could approach the classification problem ignoring the fact that y is discrete-valued, and use our old linear regression algorithm to try to predict y given x. 

However, it is easy to construct examples where this method performs very poorly. Intuitively, it also doesn’t make sense for $h_\theta(x)$ to take values larger than 1 or smaller than 0 when we know that y ∈ {0, 1}. To fix this, let’s change the form for our hypotheses $h_\theta (x)$ to satisfy $0\leq h_\theta(x) \leq1$ This is accomplished by plugging $\theta^Tx$ into the Logistic Function.

![000056](images/2020-10-09-000056.jpg)

The function g(z), shown here, maps any real number to the (0, 1) interval. 
$h_\theta(x)$ will give us the probability that our output is 1.

![000057](images/2020-10-09-000057.jpg)

### Decision Boundary

![000058](images/2020-10-09-000058.jpg)

![000059](images/2020-10-09-000059.jpg)

![000060](images/2020-10-09-000060.jpg)

