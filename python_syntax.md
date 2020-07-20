## Python Notes

### Catching error with try & except
- There are two kinds of errors: syntax errors and exceptions
- Exceptions are the error detected during execution and are not unconditionally
fatal. examples are: ZeroDivisionError, NameError, TypeError
```python
while True:
	try:
		x = int(input('Please enter a number: '))
		break
	except ValueError:
		print('Oops! invalid number, Try again')
```
- try statement may have more than one except clause to specify handlers for
different exceptions of which at most one handler will be executed. an except
class may also name multiple exceptions as a parenthesized tuple

```python
try:
    f = open('myfile.txt')
    s = f.readline()
    i = int(s.strip())
except OSError as err:
    print("OS error: {0}".format(err))
except ValueError:
    print("Could not convert data to an integer.")
except:
	# sys.exc_info() returns a tuple of three values that give information about
	# the exception that is currently being handled
    print("Unexpected error:", sys.exc_info()[0])
    raise
```
- try... except statement with else clause is useful for code that must be
executed if the try clauses does not raise an exception. use of else clause
is better than additional code to the try clause as it avoids accidentally
catching an exception that wasn't raised by the code being protected by the
try...except statement
```python
for arg in sys.argv[1:]:
    try:
        f = open(arg, 'r')
    except OSError:
        print('cannot open', arg)
    else:
        print(arg, 'has', len(f.readlines()), 'lines')
        f.close()
```
- exception handlers also work if exception occurs inside functions that
are called (even indirectly) in the try clause. for example
```python
def this_fails():
     x = 1/0
try:
    this_fails()
except ZeroDivisionError as err:
    print('Handling run-time error:', err)

>> Handling run-time error: division by zero
```
- try statement can also be run with finally clause which will always
execute as the last task before the try statement completes. complex
cases when exception occurs are:
	- if an exception is not handled by an except clause, the exception
	re-raise after execution of finally clause.
	- An exception could occur during execution of an except or else
	clause. again the exception is re-raised after exceuction of finally clause.
	- if the try statement reaches a break, continue or return statement, the
	finally clause will execute just prior to the break, con...statement
	- if a finally clause includes a return statement, the returned value
	will be from finally clause's return statement instead of try clause's
	return statement.
```python
def divide(x, y):
    try:
        result = x / y
    except ZeroDivisionError:
        print("division by zero!")
    else:
        print("result is", result)
    finally:
        print("executing finally clause")
>>> divide(2, 1)
result is 2.0
executing finally clause
>>> divide(2, 0)
division by zero!
executing finally clause
>>> divide("2", "1")
executing finally clause
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 3, in divide
TypeError: unsupported operand type(s) for /: 'str' and 'str'
```
- Predefined clean-up actions
with statement allows objects like files to be used in a way that ensures
they are always cleaned up promptly and correctly. In this case after the
statement is executed, the file f is always closed, even if a problem was
encountered while processing the lines.
```python
with open("myfile.txt") as f:
    for line in f:
        print(line, end="")
```

### Defining Functions

- Default argument values in a function definition: by providing default
value for one or more arguments, function can be called in several ways
```python
def ask_ok(prompt, retries=4, reminder='Please try again!'):
    while True:
        ok = input(prompt)
        if ok in ('y', 'ye', 'yes'):
            return True
        if ok in ('n', 'no', 'nop', 'nope'):
            return False
        retries = retries - 1
        if retries < 0:
            raise ValueError('invalid user response')
        print(reminder)
# function can be called as:
ask_ok('do you want to quit')
ask_ok('ok to overwrite file', 2)
ask_ok('ok to overwrite file', 2, 'only yes or no')
```
- Default values are evaluated only once and at the point of function definition
in the defining scope
```python
i = 5

def f(arg=i):
    print(arg)

i = 6
f() 	# will return 5 instead of 6
```
- Since default value is evaluated only once, it makes a difference when the default
is a mutable object such as list, dict or instances of most classes. following function
accumulates the arguments passed to it on subsequent calls:
```python
def f(a, L=[]):
    L.append(a)
    return L

print(f(1))		# returns [1]
print(f(2))		# returns [1, 2]
print(f(3))		# returns [1, 2, 3]
```
- Better way to write the function is like this instead:
```python
def f(a, L=None):
    if L is None:
        L = []
    L.append(a)
    return L

print(f(1))		# returns [1]
print(f(2))		# returns [2]
```
- There are two kind of arguments that are passed to a function:
	1. keyword argument: argument preceeded by an identifier in a function call or passed
	as a value in a dictionary preceded by **.
	```python
	complex(real=3, imag=5)
	complex(**{'real': 3, 'imag': 5})
	```
	2. positional argument: these can appear at the beginning of an argument list and/or
	be passed as elements of an iterable preceded by *.
	```python
	complex(3, 5)
	complex(*(3, 5))
	```
- if a function has both keyword and postional arguments, then keyword arguments must
follow positional arguments and theie order is not important
```python
def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
    print("-- This parrot wouldn't", action, end=' ')
    print("if you put", voltage, "volts through it.")
    print("-- Lovely plumage, the", type)
    print("-- It's", state, "!")

parrot('a million', 'bereft of life', 'jump') 	# will pass voltage, state and action argument
parrot (action='vooooom', voltage='jump')		# is correct, order is not important
parrot(110, voltage=220)     					# incorrect; duplicate value for same argument
```
- when a parameter of form **name is present, it receives a dictionary containing all keyword
arguments. this may be combined with a formal parameter of form *name which receives a tuple
containing the positional arguments beyond the formal parameter list (*name must occur before
**name)
```python
def cheeseshop(kind, *arguments, **keywords):
    print("-- Do you have any", kind, "?")
    print("-- I'm sorry, we're all out of", kind)
    for arg in arguments:
        print(arg)
    print("-" * 40)
    for kw in keywords:
        print(kw, ":", keywords[kw])

# function is to be called in this fashion
cheeseshop("Limburger", "It's very runny, sir.",
           "It's really very, VERY runny, sir.",
           shopkeeper="Michael Palin",
           client="John Cleese",
           sketch="Cheese Shop Sketch")
```
- There is also a way to explicitly specify the type of arguments that a function take:
```python
# both keyword and positional arguments may be passed
def standard_arg(arg):
    print(arg)

# only positional arguments can be passed
def pos_only_arg(arg, /):
    print(arg)

# only keyword arguments can be passed
def kwd_only_arg(*, arg):
    print(arg)

# first argument is positional, second can be both and third can only be keyword argument
def combined_example(pos_only, /, standard, *, kwd_only):
    print(pos_only, standard, kwd_only)
```
- lambda expressions: lambda functions are single expression that can reference variables
from the containing scope. this function returns sum: `lambda a, b: a+b.
```python
func = lambda a: a + 1
func(0)			# returns 1

def make_incrementor(n):
    return lambda x: x + n

# it amounts to f = lambda x: x + 42
f = make_incrementor(42)
f(0)			# returns 42
f(1)			# returns 43

pairs = [(1, 'one'), (2, 'two'), (3, 'three')]
pairs.sort(key=lambda pair: pair[1])		# will sort based on 2nd value
```

