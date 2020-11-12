## Predicting Movie Ratings

### Problem Formulation

 ![000228](images/2020-11-12-000228.jpg)

### Content Based Recommendations

![000229](images/2020-11-12-000229.jpg)

![000230](images/2020-11-12-000230.jpg)

To simplify the cost function we will omit $m_j$

![000231](images/2020-11-12-000231.jpg)

![000232](images/2020-11-12-000232.jpg)

### Collaborative Filtering

![000233](images/2020-11-12-000233.jpg)

In the earlier chapters, we assume features parameter. To actually get the features, we need to work backwardly from the theta values for each users and find the feature which will result in the rating for movies for each users

![000234](images/2020-11-12-000234.jpg)

![000235](images/2020-11-12-000235.jpg)

### Collaborative Filtering Algorithm

There is no reason to hard code $x_0$ as 1 as the algorithm is also learning the features, if the problem requires $x_0$ to be 1, algorithm will accommodate that. That means that both $x$ and $\theta$ is $R^n$ matrix

![000236](images/2020-11-12-000236.jpg)

![000237](images/2020-11-12-000237.jpg)

