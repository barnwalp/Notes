## Optimization Objective

Taking logistics regression cost function and creating two different cost functions for each value of y i.e. {0, 1}, $Cost_1{(z)}$ for y = 1 and $Cost_0{(z)}$ for y = 0

For support vector machine, instead of a curved graph we will have a graph with sharp point as show in the figure below:

![000144](images/2020-10-18-000144.jpg)

Plugging the two cost function in the logistics regression cost function, we will get cost function for the support vector machine

![000145](images/2020-10-18-000145.jpg)

## Large Margin Intuition

![000146](images/2020-10-18-000146.jpg)

When value of C is very large, first part of the equation has to be close to 0 so as to minimize the cost function which will happen when $\theta^Tx \geq 1$ for y = 1 

![000147](images/2020-10-18-000147.jpg)

![000148](images/2020-10-18-000148.jpg)

if C is not very large, then classifier does a better job ignoring the outliers. 

![000149](images/2020-10-18-000149.jpg)

 ## Mathematics Behind Large Margin Classification

![000150](images/2020-10-18-000150.jpg)

![000151](images/2020-10-18-000151.jpg)

if we consider green line to be our decision boundary in left graph (Note: $\theta$ will be 90 degree from the decision boundary), then our $p^i$ will be very small and to compensate that $||\theta||$ will have to very large. 



Since we want the projections of positive and negative examples onto theta to be large, and the only way for that to hold true is if surrounding the green line, there is a large margin

