## Linear Regression - Programming Exercise

```octave
data = load('ex1data1.txt');

X = data(:, 1);
y = data(:, 2);
m = length(y);

% Creating a input matrix with first column values i.e. $x_0$ as one
X = [ones(m, 1), data(:, 1)]

% intializing theta as 2x1 matrix with 0's
theta = zeros(2, 1)

% number of times theta will be calculated
iteration = 1500;
alpha = 0.01

% Intializing cost function as 0
J = 0

% 
for iter = 1:iteration
	temp1 = theta(1) - (alpha/m) * (sum(X*theta -y));
	temp2 = theta(2) - (alpha/m) * (sum((X*theta - y) .* X(:,2)));
	% updating theta1 and theta2 simultaneously
	theta = [temp1; temp2];
	
% Calculating cost function; here X*theta is hypothesis
J = sum((X * theta - y) .^ 2) / (2*m);
```

