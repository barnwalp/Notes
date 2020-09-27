## Machine Learning

### Definition

- Field of study that gives computers the ability to learn without being explicitly programmed. (Arthur Samuel 1959)
- Well posed learning problem: A Computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E. 

Example: playing checkers.

E = the experience of playing many games of checkers

T = the task of playing checkers.

P = the probability that the program will win the next game.

### Machine learning algorithm
- Supervised learning
- Unsupervised learning
- Others - Reinforcement learning, recommender system

### Supervised learning

**Regression - continuous value output** In the following example, there can be two predictive regression line first based on linear regression which predict the price of 150K for 750 sq feet and another based on quadratic regression which predicts the price of 200K.

**Classification problem - Discrete valued output**

In the following example, we have two possibilities one is benign and other is malignant. given the size of the tumor, we need to establish an algorithm which can predict whether the tumor is benign or malignant.

In the previous example, we were predicting the malignancy of the tumor on only one feature i.e. tumor size but it can be done on infinite feature. in this example, we are finding the prediction algorithm on 5 features

### Unsupervised Learning[¶](http://localhost:8888/notebooks/github_repo/jupyter_notebook/Machine Learning/Machine Learning - 1.1 - Introduction.ipynb#Unsupervised-Learning)

Unsupervised learning allows us to approach problems with little or no idea what our results should look like. We can derive structure from data (which are unlabelled) where we don't necessarily know the effect of the variables.

Given the dataset and we are not told what each datapoint is and find the algorithm to find the pattern. Example

- Clustering algorithm - Take a collection of 1,000,000 different genes, and find a way to automatically group these genes into groups that are somehow similar or related by different variables, such as lifespan, location, roles, and so on.
  - Organize computing clusters
  - Social network analysis
  - Market segmentation
  - Astronomincal data analysis
- Non-clustering - Cocktail party algorithm allows you to find structure in a chaotic environment. (i.e. identifying individual voices and music from a mesh of sounds at a cocktail party).