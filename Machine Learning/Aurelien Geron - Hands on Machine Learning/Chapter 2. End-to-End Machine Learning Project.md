### Look at the big picture

#### Frame the Problem

1. what exactly is the business objective? How does the company expect to use and benefit from the model?
2. Is the output of the model fed to some kind of data pipeline?
3. what is the current solution for this problem? How well this system performs?
4. Frame the problem? is it supervised, unsupervised, reinforcement learning? is is a classification task, regression task or something else? Should you use batch learning or online learning techniques?

#### Select a Performance Measure

**Root mean square error (RMSE)** - is typical performance measure for regression problem. It gives an idea of how much error the system makes in its prediction.

$RMSE(X, h) = \sqrt{\frac{1}{m}{\sum_{i=1}^{m}(h(x^i)-y^i)^2}}$

- m is the number of instances in the dataset
- $x^{(i)}$ is a vector of all the feature values (excluding the label) of the ith instance in the dataset, and $y^{(i)}$ is its label (the desired output value for the instance)
-  X is a matrix containing all feature value (excluding labels) of all instances in the datasets. The ith row is equal to the transpose of $x^{(i)}$, noted $(X^{(i)})^{T}$. 
- h is system's prediction, called a hypothesis. $\hat{y}^{(i)} = h(X^{(i)}) $.

**Mean absolute error (MAE)** - Also called average absolute deviation, it is based suited when there are many outliers. 

$MAE(X, h) = \frac{1}{m}\sum_{i=1}^{m}|(h(x^i)-y^i)|$

#### Check the assumption

Lets say the output of the model is fed to a downstream system which converts the prices into categories (cheap, medium, expensive) and uses those categories to for the next model. in this case the problem becomes classification problem instead of regression task. 

### Get the Data

### Discover and visualize the data to gain insight

### Prepare the data for Machine Learning algorithms

### Select a model and train it

### Fine-tune your model

### present your solution

### Launce, monitor and maintain your system

