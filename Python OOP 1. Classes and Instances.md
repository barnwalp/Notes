## Classes and Instances

Creating an empty class with no attribute and methods:
```python
Class Employee:
    pass
```
Difference between Class and an instance of a class - A class is
basically a blueprint for creating instances. Each unique employee
that we create using our Employee class will be an instance of that
class.

For example following 2 object will have their own unique instances of the
class and will have unique memory locations.
```python
emp_1 = Employee()
emp_2 = Employee()
```
Now instance variables contain data that is unique to each instance. We can
manually create the instance variable like this wherein each of these instances
have attributes that are unique to them
```python
emp_1.first = 'Pankaj'
emp_1.last = 'Barnwal'
emp_1.pay = 60000

emp_2.first = 'Shubham'
emp_2.last = 'Singh'
emp_2.pay = 50000
```
To set all of these information for each employee when they are created,
__init__ method (initialize) is used, which can be thought of as a constructor.

Furthermore when we create a method in a class they receive the instance as the first
argument automatically and is called **self** by convention
```python
class Employee:
    def __init__(self, first, last, pay):
    self.first = first
    self.last = last
    self.pay = pay
    self.email = first + '.' + last + '@company.com'

    def fullname(self):
        return '{} {}'.format(self.first, self.last)
```
When we crete an employee, we need to pass those attributes. **pl note
that the instance is passed automatically (which is true for every method
 in the class** so we can leave off self. here emp_1 is passed as self
 and then the attributes are passed.
```python
emp_1 = Employee('Pankaj', 'Barnwal', 60000)
```
Pl note that following 2 statement in python are same
```python
emp_1.fullname()
Employee.fullname(emp_1)
```
