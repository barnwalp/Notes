## Special (Magic/Dunder) Method
These methods allow us to emulate some built in behavior within python and 
is also used to implement operator overloading. For example addition operation
in python shows different behavior depending upon the objects its working on
```python
print(1 + 2)    # will result in 3
print(a + b)    # will result in ab
```
In our employee class, we can use the dunder methods to provide our own 
behavior of built in methods and operation of python. 2 special common
method that we should always implement are __repr__ and __str__. repr is 
meant to be an unambiguous representation of the object is meant for 
debugging and logging etc and str is a readable representation of an 
object and is meant to be used as a display for end user.

if there is only repr implementation, then calling str on an employee will
just use the repr as a fallback. Without repr method print(emp_1) will not
print the object in desired format, but with repr, correct format can be 
printed

```python
class Employee:
    raise_amount = 1.04
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay

    def fullname(self):
        return '{} {}'.__format__(self.first, self.last)
    
    # A good rule of thumb when creating this method is to try to display
    # something that would recreate the same object. This line will print
    # Employee('Nikita', 'Jain', 52000) which is exact syntax for creating instance.
    def __repr__(self):
        return "Employee('{}', '{}', '{}')".format(self.first, self.last, self.pay)
    
    # This representation is meant for end user while repr representation 
    # was meant for developer 
    def __str__(self):
        return '{} - {}'.format(self.fullname(), self.email) 

emp_1 = Employee('Nikita', 'Jain', 52000)
# it will use __str__ method 
print(emp_1)
```
Python also use dunder method to differentiate behavior while using
arithmetic operation
```python
print(1 + 2)                # output = 3
print(int.__add__(1, 2))    # output = 3

# string addition uses its own dunder method
print(str.__add__('a', 'b'))
```
for example we can implement dunder add method in our employee class
to add salary when two objects are added.

```python
class Employee:
    -----
    -----

    def __add__(self, other):
        return self.pay + other.pay

print(emp_1 + emp_2)
```
Note: `return notImplemented` is a way to fall back to other object to see
if it knows how to handle this operation.
