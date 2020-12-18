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

#### Take a quick look at the data

The 25%, 50% and 75% rows in ```df.describe()``` show the corresponding percentiles: a percentile indicates the value below which a given percentage of observations in a group of observations fall. for example, 25% of the districts have a housing_median_age lower than 18, while 50% are lower than 29 and 75% are lower than 37.

Another quick way to get a feel of the type of the data you are dealing with is to plot a histogram for each numerical attribute. Things to consider in the histogram:

1. In case a variable is capped at some ceiling and if precise predictions are required for values upper than the capped value, then you should either collect proper labels for the values for which labels were capped or remove those values from the training and test set.
2. In case histogram is tail-heavy (i.e. they extend much farther to the right of the median than to the left), then we should try to transform these attributes to have more bell shaped distribution.

#### Create a Test Set

Pick some instances randomly, typically 20% of the dataset (or less if your dataset is very large)

```python
import numpy as np

# This will generate different set every time it is run
def split_train_test(data, test_ratio):
    shuffled_indices = np.random.permutation(len(data))
    test_set_size = int(len(data) * test_ratio)
    test_indices = shuffled_indices[:test_set_size]
    train_indices = shuffled_indices[test_set_size:]
    return data.iloc[train_indices], data.iloc[test_indices]

train_set, test_set = split_train_set(housing, 0.2)
```





### Discover and visualise the data to gain insight

### Prepare the data for Machine Learning algorithms

### Select a model and train it

### Fine-tune your model

### present your solution

### Launce, monitor and maintain your system

