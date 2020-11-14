## Predicting Movie Ratings

### Problem Formulation

 ![000228](images/2020-11-12-000228.jpg)

### Content Based Recommendations

![000229](images/2020-11-12-000229.jpg)

![000230](images/2020-11-12-000230.jpg)

To simplify the cost function we will om it $m_j$

![000231](images/2020-11-12-000231.jpg)

![000232](images/2020-11-12-000232.jpg)

### Collaborative Filtering

![000233](images/2020-11-12-000233.jpg)

In the earlier chapters, we assume features parameter. To actually get the features, we need to work backwardly from the theta values for each users and find the feature which will result in the rating for movies for each users

![000234](images/2020-11-12-000234.jpg)

![000235](images/2020-11-12-000235.jpg)

### Collaborative Filtering Algorithm

There is no reason to hard code $x_0$ as 1 as the algorithm is also learning the features, if the problem requires $x_0$ to be 1, algorithm will accommodate that. That means that both $x$ and $\theta$ will be an $R^n$ matrix

![000236](images/2020-11-12-000236.jpg)

![000237](images/2020-11-12-000237.jpg)

### Vectorization: Low Rank Matrix Factorization

![000238](images/2020-11-14-000238.jpg)

![000239](images/2020-11-14-000239.jpg)

![000240](images/2020-11-14-000240.jpg)

### Implementation Detail: Mean Normalization

For a user who has not rated any of the movies, first term of the cost function will be 0, and minimization function will return theta matrix as 0 as well. Now given the 0 theta vector, all rating prediction will also be 0, which is counter-intuitive. hence different method is required for the user which has not rated any movies yet.

![000241](images/2020-11-14-000241.jpg)
![000242](images/2020-11-14-000242.jpg)

