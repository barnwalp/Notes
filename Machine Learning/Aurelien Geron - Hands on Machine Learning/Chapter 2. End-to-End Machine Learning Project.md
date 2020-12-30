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

When you select test/train dataset randomly, there is a risk of introducing significant sampling bias. for example, US population is 51.3% females and 48.7% mails, so a well conducted survey in the US would try to maintain this ratio. This is called stratified sampling in which population is divided into homogeneous subgroups called strata and right number of instances are sampled from each stratum.

in housing dataset, most median incomes are clustered around 1.5 to 6, but some median incomes go far beyond 6. so it is important that

1. You have a sufficient number of instances in your dataset for each stratum
2. Each stratum should be large enough and you should not have too many strata.

```python
# Creating a new column with median income categories 
housing['income_cat'] = pd.cut(housing['median_income'], 
                              bins=[0., 1.5, 3.0, 4.5, 6., np.inf],
                              labels=[1, 2, 3, 4, 5])


from sklearn.model_selection import StratifiedShuffleSplit

# it provides the train/test indices to split data in train/test sets
split = StratifiedShuffledSplit(n_splits=1, test_size=0.2, random_state=42)
for train_index, test_index in split.split(housing, housing['income_cat']):
    strat_train_set = housing.loc[train_index]
    strat_test_set = housing.loc[test_index]
    
# Now you should remove the income_cat attribute
for set_ in (strat_train_set, strat_test_set):
    set_.drop('income_cat', axis=1, inplace=True)
```



### Discover and visualize the data to gain insight

#### Visualizing Geographical data

Scatter plot using `df.plot`

```python
# setting the alpha to 0.1 makes it much easier to visualize the places where there is a high density of data points
housing.plot(kind='scatter', x='longitude', y='latitude', alpha=0.1)
```

```python
housing.plot(kind='scatter',
            x='longitude',
            y='latitude',
            alpha=0.4,
            # radius of each circle represents district's population (option s) 
            s=housing['population']/100,
            label='population',
            figsize=(10,7),
            # color of the circle represents the price
            c='median_house_value',
            # a predefined color map called jet is being used which ranges from blue (low value) to red (high value)
            cmap=plt.get_cmap('jet'),
            colorbar=True,
            )
plt.legend()
```

#### Looking for Correlations

```python
# Getting standard correlation coefficient (Pearsons's r) between every pair of attributes
corr_matrix = housing.corr()

# Correlation of each attributes with the median house value
corr_matrix['median_house_value'].sort_values(ascending=False)
```

Correlation coefficient only measures linear correlations. it may completely miss out on non-linear relationships.

Plotting scatter plot of every numerical attributes against every other numerical attribute.

```python
from pandas.plotting import scatter_matrix

attributes = ['median_house_value', 'median_income', 'total_rooms', 'housing_median_age']
scatter_matrix(housing[attributes], figsize=(12, 8))

# from the scatter matrix, you can see that most promising attribute to predict the median house value is the median income.
housing.plot(kind='scatter', x='median_income', y='median_house_value', alpha=0.1)
```

in the correlation plot, there is a clearly visible line at $500,000 and other less obvious straight horizontal lines at 350,000 and 280,000, These kind of data quirks may be tackled by removing corresponding districts.

#### Experimenting with Attribute Combinations

Trying various attributes combinations:

1. total number of rooms in a district is not very useful if you know how many households there are. number of rooms per household makes more sense.
2. Similarly we can create two more sensible attributes such as number of bedroom per room and population per household

```python
housing['rooms_per_household'] = housing['total_rooms']/housing['households']
housing['bedrooms_per_room'] = housing['total_bedrooms']/housing['total_rooms']
housing['population_per_household'] = housing['population']/housing['households']
```

```python
corr_matrix = housing_corr()
corr_matrix['median_house_value'].sort_values(ascending=False)
```

Now you can see that bedroom_per_room and rooms_per_household are much more correlated to median_house_value than the original attributes.

### Prepare the data for Machine Learning algorithms

### Select a model and train it

### Fine-tune your model

### present your solution

### Launce, monitor and maintain your system

