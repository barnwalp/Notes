## Programming Exercise 3

```octave
data = load('ex2data1.txt')
X = data(:, [1, 2]);
y = data(:, 3);

[m, n] = size(X);

X = [ones(m, 1) X];

% intialize theta and cost function
theta = zeros(n+1, 1);
J = 0

% sigmoid function
function g = sigmoid(z)
	f = 1 + exp(-z);
	g = f .^ -1;

h = sigmoid(X * theta)
J = (1/m) * (-y' * log(h) - (1-y))
```

