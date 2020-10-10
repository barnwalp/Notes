## Programming Exercise 4

```octave
% set up the parameter
input_layer_size = 400;
num_label = 10;
lambda = 0.1;

load('ex3data1.txt');
m = size(X, 1);

% Regularized cost function same as logistrics regression
function [J, grad] = lrCostFunction(theta, X, y, lambda)
	m = length(y);
	J = 0;
	grad = zeros(size(theta));
	
    h = sigmoid(X*theta);
    J = (1/m) * (-y' * log(h) - (1-y)' *log(1-h)) + (lambda/(2*m)) * (sum(theta(2:n) .^ 2));
    thetaZero = theta;
    
    % Since theta_0 is not penalized for in cost function, same is not to be included in the gradient calculation. 
    thetaZero(1) = 0;
    grad = ((1/m) * (h - y)' * X) + lambda/m * thetaZero';
    
% Finding the all_theta matrix
function [all_theta] = oneVsAll(X, y, num_labels, lambda)
	m = size(X, 1);
	n = size(X, 2);
	
	all_theta = zeros(num_labels, n+1);
	X = [ones(m, 1) X];
	
	initial_theta = zeros(n+1, 1);
	for c = 1:num_labels
		options = optimset('GradObj', 'on', 'MaxIter', 50);
		% y==c will return a new vector of same size as y but value as 1 and 0 with 1 where y == c condition is met
		[theta] = fmincg(@(t)(lrCostFunction(t, X, (y==c), lambda)), intial_theta, options);
		% theta value for each number labels is added in the final all_theta
		all_theta(c, :) = theta;
		
[all_theta] = oneVsAll(X, y, num_labels, lambda);

% predicting the output based on the trained classifier
num_labels = size(all_theta, 1);
p = zeros(size(X, 1), 1);

% add ones to the X data matrix
X = [ones(m, 1) X];

% Creating a matrix with probabilities for each number labels, 1st row of the matrix will provide probabilities for the first input examples
all_prob = sigmoid(X * all_theta);

% Out of all values, find the highest probability and corresponding index
[x, ix] = max(all_prob, [], 2);

% store the index in p which denotes the predict number 
p = ix;
	
	
```

