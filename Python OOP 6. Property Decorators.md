## Property Decorators - Getter, Setters and Deleters
init method should never generate variables (which has not been explicitly 
passed while object creation) in its body. If done so, it may not reflect the
variable  which may have been changed through class instance after 
initialization. for example like `emp_1.first = 'Nisha'`.

```python
class Employee:
    def __init__(self, first, last):
        self.first = first
        self.last = last
        self.email = first + '.' + last + 'email.com'
    
    def fullname(self):
        return '{} {}'.__format__(self.first, self.last)

emp_1 = Employee('Aranya', 'Chawla')
emp_1.first = 'Nisha'

print(emp_1.email)      # will still show Aranya.Chawla@email.com
```
one possible solution to avoid this, is to use the method to generate email
similar to `fullname` but it will break the code for someone using this class
and they will have to change every instance of the email attributes with email
method.

This is where property method helps python and provide a kind of getter and 
setter as it allows us to define a method but we can access it like an
attribute

```python
class Employee:
    ------
    ------
    @property
    def email(self):
        return '{}.{}@email.com'format(self.first self.last)

print(emp_1.email)
```
In similar fashion setter can also be used in python
```python
class Employee:
    ------
    ------
    @property
    def fullname(self):
        return '{} {}'.__format__(self.first, self.last)

    @fullname.setter
    def fullname(self, name):
        first, last = name.split(' ')
        self.first = first
        self.last = last

emp_1 = Employee('Rashmi', 'Singh', 48000)
emp_1.fullname = 'Anika Mathur'
print(emp1.first)       # will return Anika
```
In similar fashion a deleter function can also be implemented
```python
class Employee:
    ------
    ------
    @fullname.deleter
    def fullname(self):
        print('attribute deleted')
        self.first = None
        self.last = None

del emp_1.fullname
```

