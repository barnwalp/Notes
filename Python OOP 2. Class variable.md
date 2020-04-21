## Class Variables
Class variables are variables which are shared with all instances of the
class. unlike instance variable which are unique for each instances, class
variables should be same for each instance.

class variables can either be accessed through class itself or through 
an instance of the class which is `self.raise_amount` in the current example.

```python
class Employee:

    raise_amount = 1.04

    def __init(self):
        pass
    
    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)
```
#### Accessing the class variables
```python
print(Employee.raise_amount)
print(emp_1.raise_amount)
print(emp_1.raise_amount)
```
When we try to access an attributes on an instance it will first check
if the instance contains the attribute and if it does not, then it will 
see if the class or any other class it inherits from contains that 
attribute.

Printing the namespace of instance of class, you will find the there is
no raise_amount in here.
```python
print(emp_1.__dict__)
```
if you change the raise_amount through the instance, python will create a 
new instance variable 'raise_amount' for that particular instance.
```python
emp_1.raise_amount = 1.05 # will not change class variable
print(emp_1.__dict__)
```
There are 2 ways to access class variable in the class declaration, first is 
'self' as shown in the above example. In another way Employee class can be
used to access the class variable. Difference of both method can be understood
in following 2 code snippets. Below code uses self. 
```python
class Employee:
    raise_amount = 1.04
    
    def apply_raise(self):
        self.pay = int(self.pay * self.raise_amount)

emp1.raise_amount = 1.05
emp1.apply_raise()  # raise amount will be 1.05
emp2.apply_raise()  # raise amount will be 1.04
```
Below code uses class
```python
class Employee:
    raise_amount = 1.04
    
    def apply_raise(self):
        self.pay = int(self.pay * Employee.raise_amount)

emp1.raise_amount = 1.05
emp1.apply_raise()  # raise amount will be 1.04
emp2.apply_raise()  # raise amount will be 1.04
```
This is also worth mentioning that self will allow any subclass to override
that constant. 
Example, where using self to access class variable does not make sense
```python
class Employee:
    num_of_emps = 0
    
    def __init__(self first, last, pay):
        ## intialization statements ##
        
        # Here it does not make sense to have different no of employee for
        # different instances
        Employee.num_of_emps += 1
    
    emp1 = Employee('Arpana', 'Singh', 65000)

    print(Employee.num_of_emps)
```

