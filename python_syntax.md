## Python Notes

### catching error with try & except
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
