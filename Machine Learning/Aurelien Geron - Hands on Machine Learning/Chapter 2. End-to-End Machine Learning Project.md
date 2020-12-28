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

How to create a test set:

1. Pick some instances randomly, typically 20% of the dataset (or less if your dataset is very large)
2. Ensure that when program (for creating test set) is re-run, same test-set is generated all the time
3. When the updated dataset is fetched, then also test set should be the same.

A common solution is to compute hash of each instance's identifier and put that instance in the test set if the hash is lower than or equal to 20% of the maximum value. you can use the most stable features to build a unique identifier.

There is a scikit function, which satisfies first 2 abovementioned points, which work as

```python
from sklearn.model_selection import train_test_split

train_set, test_set = train_test_split(housing, test_size=0.2, random_state=42)

#############################################################

X, y = np.arange(10).reshape((5, 2)), range(5)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
```

To satisfy all criteria as mentioned above, we can use:

```python
from zlib import crc32

def test_set_check(identifier, test_ratio):
    # this returns either true or false for identifier
    return crc32(np.int64(identifier)) & 0xffffffff < test_ratio * 2**32

def split_train_test_by_id(data, test_ratio, id_columns):
    ids = data[id_column]
    # single post underscore is used for naming your variable as python keywords and to avoid clash
    # in_test_set will be a dataframe which will have values as either true or false for each value of index
    in_test_set = ids.apply(lambda id_: test_set_check(id_, test_ratio))
    return data.loc[~in_test_set], data.loc[in_test_set]

housing_with_id["id"] = housing["longitude"] * 1000 + housing["latitude"]

train_set, test_set = split_train_test_by_id(housing_with_id, 0.2, "id")
```





### Discover and visualise the data to gain insight

### Prepare the data for Machine Learning algorithms

### Select a model and train it

### Fine-tune your model

### present your solution

### Launce, monitor and maintain your system

