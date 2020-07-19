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

