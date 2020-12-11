## Backpropagation in Practice

### Unrolling parameters
optimization algorithm in octave assumes that initial theta and gradient are vectors of size n+1

![000100](images/2020-10-10-000100.jpg)

![000101](images/2020-10-10-000101.jpg)

![000102](images/2020-10-10-000102.jpg)

![000103](images/2020-10-10-000103.jpg)

![000104](images/2020-10-10-000104.jpg)

![000105](images/2020-10-10-000105.jpg)

Here 	epsilon = 1e-4;

![000106](images/2020-10-10-000106.jpg)

### Random Initialization

Initializing all theta weights to zero does not work with neural networks because after backpropagation, all nodes will update to the same value repeatedly.

rand(x, y) is just a function in octave that will initialize a matrix of random real numbers between 0 and 1.

![000107](images/2020-10-10-000107.jpg)

### Putting it together

![000108](images/2020-10-10-000108.jpg)

![000109](images/2020-10-10-000109.jpg)

Since $J(\Theta)$ is non-convex here, gradient descent or advanced optimization may result in local minima instead of global minima

![000110](images/2020-10-10-000110.jpg)

