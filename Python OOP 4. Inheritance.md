## Inheritance - Creating Subclasses
 Inheritance allows us to inherit attributes and methods from a parent class. we
 can create a subclasses and get all the functionality of parent class
 and then overwrite or add completely new functionality without affecting
 the parent class. 
 ```python
class Employee:
    raise_amount = 1.04
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
    
    def apply_raise(self):
        self.pay = self.pay * self.raise_amount

class Developer(Employee):
    raise_amount = 1.10

dev_1 = Developer('Anika', 'Gupta', 55000)
print(help(Developer))
```
when we instantiated our developer, our developer first looked in the
developer class for init method which is unavailable, then python will
walk up the chain of inheritance until it finds what it's looking for.
this chain is called the method resolution order.

initialization of Developer object can also be overwritten if required
```python
class Employee:
    ----
    ----

class Developer(Employee):
    raise_amount = 1.10
    def __init__(self, first, last, pay, prog_lang):
        # Let Employee class handle first 3 arguments
        super().__init__(first, last, pay)
        # Employee.__init__(self, first, last, pay) can also be used but
        # super is more maintanable and necessary with multiple inheritance
        self.prog_lang = prog_lang

dev_1 = Developer('Niti', 'Chauhan', 75000, 'Javascript')
```     
super.__init__() method is going to pass first, last and pay to our
Employees init method and let that class handle those arguments 

```python
class Employee:
    -----
    -----

class Manager(Employee):
    # Note: Mutable data type such as list or dictionary should not be 
    # passed as default arguments and hence None is passed here
    def __init__(self, first, last, pay, employees=None):
        super().__init__(first, last, pay)
        if employees is None:
            self.employees = []
        else:
            self.employees = employees
    
    def add_emp(self, emp):
        if emp not in self.employees:
            self.employees.append(emp)

    def remove_emp(self, emp):
        if emp in self.employees:
            self.employees.remove(emp)  
    def print_emps(self):
        for emp in self.employees:
            print('-->', emp.first)
  
```