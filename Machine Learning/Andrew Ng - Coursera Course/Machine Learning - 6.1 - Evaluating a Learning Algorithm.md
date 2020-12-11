## Deciding What to Try Next

![000111](images/2020-10-11-000111.jpg)

![000112](images/2020-10-11-000112.jpg)

## Evaluating your hypothesis

![000113](images/2020-10-11-000113.jpg)

It is advisable to randomly select 70% and 30% data points before allocating it to training and testing data sets.

![000114](images/2020-10-11-000114.jpg)

![000115](images/2020-10-11-000115.jpg)

The average test error in logistics regression for the test set is: 

Test Error = $ \frac{1}{m_{test}}\sum_{i=1}^{m_{test}}err(h_\Theta(x_{test}^{(i)}), y_{test}^{(i)}) $

## Model Selection and Train/Validation/Test Sets

In case of overfitting, the error of the parameters as measured on the training set data (the training error $J(\theta)$ is likely to be lower than the actual generalization error.

![000116](images/2020-10-11-000116.jpg)

The problem with the model selection is that if we choose a model based on the training set (5 degree polynomial in this case), it will definitely be best model for the training set but it may not generalize to the test set. 

![000117](images/2020-10-11-000117.jpg)

![000118](images/2020-10-11-000118.jpg)

We can now calculate three separate error values for the three different sets using the following method:

1. Optimize the parameters in $\Theta$ using the training set for each polynomial degree.
2. Find the polynomial degree d with the least error using the cross validation set.
3. Estimate the generalization error using the test set with $J_{test}{(\Theta^{(d)})}$.

This way, the degree of the polynomial d has not been trained using the test set.

![000119](images/2020-10-11-000119.jpg)

