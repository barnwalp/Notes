## Class Method and Static Method

#### Class Methods
Regular method automatically takes in the instance as the first argument
whereas classmethod takes class as the first argument. regular method can
be changed to classmethod by simply adding a decorator **@classmethod** at the
top of regular method
```python
class Employee:
    num_of emps = 0
    raise_amount = 1.04
    
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        Employee.num_of_emps += 1
    
    @classmethod
    def set_raise_amt(cls, amount):
        cls.raise_amount = amount
    
Employee.set_raise_amt(1.05)
```
pl note that class method can be run by instances as well and it will
have the same result but it does not make sense to do that.

class method can also be used similar to alternative constructor as in 
it can be used to provide multiple way to create an object.
```python
class Employee:
        ---------
        ---------    
        # classmethod to construct object using above string 
        @classmethod
        def from_string(cls, emp_str):
            first, last, pay = emp_str.split('-')
            #This line will create a new employee
            return cls(first, last, pay)

emp_str_1 = 'Kriti-Lamba-70000'
new_emp_1 = Employee.from_string(emp_str_1)
```
#### Static Method
static method are different than regular and class method in a way that 
it does not pass any arguments automatically. These methods does not have
any need to access class or instance of the class for its function.
```python
Employee class:
    ------
    ------
    @staticmethod
    def is_workday(day):
        if day.weekday() == 5 or day.weekday() == 6:
            return False
        return True

import datetime
my_date = datetime.date(2020,4,17)
print(Employee.is_workday(my_date))
```