## Gradient Descent

We have our hypothesis function and we have a way of measuring how well it fits into the data. Now we need to estimate the parameters in the hypothesis function. That's where gradient descent comes in. It is used to minimize cost function $J(\theta_0, \theta_1 .... \theta_n)$. it can be used to minimize other functions also.

#### Steps are:
1. Start with some $ {\theta_0} and {\theta_1}$
2. Keep changing $\theta_0, \theta_1$ to reduce cost function until we hopefully end up with minimum

Gradient descent has an interesting property. For different values of $ \theta_0 and { \theta_1}$, it will find different local minima as it finds the steepest downfall from its current position. in the picture below, for 2 fairly near points, it provides different minima.

![000017](images/2020-10-08-000017.jpg)

The way to do this is by taking derivative (the tangential line to a function) of our cost function. The slope of the tangent is the derivative at that point and it will give us a direction to move towards. we make steps down the cost function in the direction with the steepest descent. the size of each step is determined by the parameter $\alpha$, which is called the learning rate. 

for example, the distance between each 'star' in the graph represents a step determined by $\alpha$. smaller $\alpha$ means smaller step and larger $\alpha$ means larger step. the direction is determined by the partial derivative of $ J (\theta_0, \theta_1)$
However total descent traversed will also depend on the slope at the point of current $\theta$. If the slope is greater, descent will be higher and vice versa.

![000018](images/2020-10-08-000018.jpg)

### Gradient Descent Intuition

In the following picture, we can understand the effect of derivative part of the equation, which is dictating the direction to go to.

![000019](images/2020-10-08-000019.jpg)

![000020](images/2020-10-08-000020.jpg)

![000021](images/2020-10-08-000021.jpg)

### Gradient Descent for Linear Regression

![000022](images/2020-10-08-000022.jpg)

![000023](images/2020-10-08-000023.jpg)

Since $ J(\theta_0, \theta_1)$ is a bowl like function, it does not have local minima, so gradient function will always returns to global minima.

![000024](images/2020-10-08-000024.jpg)

![000025](images/2020-10-08-000025.jpg)

