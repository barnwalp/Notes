## Model Representation I

### Examples and Intuitions I

![000089](images/2020-10-10-000089.jpg)

AND: $ \Theta ^{(1)} = \begin{bmatrix} -30 & 20 & 20\end{bmatrix} $

NOR: $ \Theta ^{(1)} = \begin{bmatrix} 10 & -20 & -20\end{bmatrix} $

OR: $ \Theta ^{(1)} = \begin{bmatrix} -10 & 20 & 20\end{bmatrix} $

![000090](images/2020-10-10-000090.jpg)

### Example and Intuitions II

![000091](images/2020-10-10-000091.jpg)

We can combine these to get the XNOR logical operator

$ \begin{bmatrix} x_0 \\ x_1\\ x_2\end{bmatrix} \rightarrow \begin{bmatrix} a_1 ^ {(2)} \\ a_2 ^ {(2)}\end{bmatrix} \rightarrow \begin{bmatrix} a ^ {(3)} \end{bmatrix} \rightarrow {h_\theta}(x)$

For the transition between first and second layer, we'll use a $\Theta^{1}$ matrix that combines the values for AND and NOR:
$ \Theta ^ {(1)} = \begin{bmatrix} -30 & 20 & 20 \\ 10 & -20 & -20  \end{bmatrix}$ 

For the transition between the second ad third layer, we'll use a $\Theta ^ {2}$  matrix that uses the value of OR:
$ \Theta ^ {(2)} = \begin{bmatrix} -10 & 20 & 20 \end{bmatrix} $

Lets write out the values for all our nodes:

$ a ^ {(2)} = g({\Theta ^ {1} \cdot x}) $

$ a ^ {(3)} = g({\Theta ^ {2} \cdot a ^ {(2)}}) $

$ h_\Theta{x} = a ^ {(3)} $

![000092](images/2020-10-10-000092.jpg)

### Multiclass Classification

In this case, resulting hypothesis for one set of inputs may look like:

$ h_\Theta {(x)} = \begin{bmatrix} 0010 \end{bmatrix} $

![000093](images/2020-10-10-000093.jpg)





