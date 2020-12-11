## Programming Exercise 3

```octave
data = load('ex2data1.txt')
X = data(:, [1, 2]);
y = data(:, 3);

[m, n] = size(X);

X = [ones(m, 1) X];

% intialize theta and cost function
intial_theta = zeros(n+1, 1);

% sigmoid function
function g = sigmoid(z)
	f = 1 + exp(-z);	
	g = f .^ -1;
	

% cost function
function [J, grad] = costFunction(theta, X, y)
	m = length(y);
	J = 0;
	grad = zeros(size(theta));
	
	h = sigmoid(X * theta)
    
    % finding cost and gradient to feed in fminunc function
    % Vectoized implementation of cost function
    J = (1/m) * (-y' * log(h) - (1-y)' * log(1-h));

    % vectorized implementation of gradient
    grad = (1/m) * (h-y)' * X;
    
 
% Regularized cost function
function [J, grad] = costFunctionReg(theta, X, y, lambda)
	m = length(y);
	J = 0;
	grad = zeros(size(theta));
	
    h = sigmoid(X*theta);
    J = (1/m) * (-y' * log(h) - (1-y)' *log(1-h)) + (lambda/(2*m)) * (sum(theta(2:n) .^ 2));
    thetaZero = theta;
    
    % Since theta_0 is not penalized for in cost function, same is not to be included in the gradient calculation. 
    thetaZero(1) = 0;
    
    grad = ((1/m) * (h - y)' * X) + lambda/m * thetaZero';
    
	

% optimizing for theta using fminunc
% setting options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Running fminunc to obtaing the optimal theta
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), intial_theta, options);

% Prdict probability for a student with score 45 on exam 1 and score 85 on exam 2 based on the theta we got from fminunc

prob = sigmoid([1 45 85] * theta);
p = prob >= 0.5


```

```octave
% optimizing for theta using fminunc using costFunctionReg.m
% setting options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Running fminunc to obtaing the optimal theta
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), intial_theta, options);
```

