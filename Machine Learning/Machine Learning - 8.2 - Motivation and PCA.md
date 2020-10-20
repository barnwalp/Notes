## Motivation I: Data Compression

### Dimensionality Reduction

![000176](images/2020-10-20-000176.jpg)

The reason why the graph is not completely straight is that the data is rounded off to the nearest integer. Dimensional reduction allows ourselves to approximate the original data set by projecting all of our original examples onto the green line, after which we only need one number.

![000177](images/2020-10-20-000177.jpg)

## Motivation II: Data Visualization

Given the huge number of features, that a dataset may have, it is very difficult to visualize the dataset to get the sense of the data. To mitigate this issue, we can use dimension reduction. 

![000178](images/2020-10-20-000178.jpg)

![000179](images/2020-10-20-000179.jpg)

When you reduce the dimension, lets say from 50D to 2D, it turns out that it does not ascribe a particular meaning to the new feature. You may get the sense of this by plotting the data with 2D as shown

![000180](images/2020-10-20-000180.jpg)

## Principal Component Analysis

### PCA Problem Formulation

What PCA does is it tries to find a lower dimensional surface or a line onto which to project the data so that the sum of squares of these little blue line segments is minimized. 

The length of these blue line segments are also called the projection error.

Before applying PCA, mean normalization and feature scaling should be implemented.

![000181](images/2020-10-20-000181.jpg)

![000182](images/2020-10-20-000182.jpg)
![000183](images/2020-10-20-000183.jpg)

## PCA Algorithm

![000184](images/2020-10-20-000184.jpg)

![000185](images/2020-10-20-000185.jpg)

![000186](images/2020-10-20-000186.jpg)

svd method in octave will return U matrix which will also have m columns, you may select first k features for the dimensional reduction.

![000187](images/2020-10-20-000187.jpg)

### PCA Algorithm Summary

![000188](images/2020-10-20-000188.jpg)
