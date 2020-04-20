## Transforming Code into Beautiful and Idiomatic Python

#### Looping over a collection and indices
```python
colors = ['red', 'green', 'blue', 'yellow']

# Un-pythonic way
for i in range(len(colors)):
    print(f'{i} --> {colors[i}')

#Pythonic Way
for i, color in enumerate(colors):
    print(f'{i} --> {colors[i]}')

for i, color in enumerate(colors):
    print(f'{i} --> {color}')
```
#### Looping over two collections
```python
names = ['raymond', 'rachel', 'mathhew']
colors = ['red', 'green', 'blue', 'yellow']

# Un-pythonic way
n= min(len(names), len(colors))
for index in range(n):
    print(f'{names[i]} --> {colors[i]}')

#Pythonic Way
for name, color in zip(names, colors):
    print(f'{name} --> {color}')
```
#### Looping in sorted order
```python
#Pythonic Way
colors = ['red', 'green', 'blue', 'yellow']

for color in sorted(colors):
    print(color)

for color in sorted(colors, reverse=True):
    print(color)
```
#### Custom sort order
```python
# Un-pythonic way
colors = ['red', 'green', 'blue', 'yellow']

def compare_length(c1, c2):
    if len(c1) < len(c2): return -1
    if len(c1) > len(c2): return 1
    return 0

# This will call the compare_length function nlogn times
print(sorted(colors, cmp=compare_length)

#Pythonic Way
# This will call key function once per key; n time
print(sorted(colors, key=len))
```
#### Call a function until a sentinel value
if something is iterable, it can be fed to set, heapq, min, max, sorted.
many tools in python consume iterator. if you make something iterable, it
works with many python toolkit.
```python
from functools import partial

# Un-pythonic way
blocks = []
while True:
    block = f.read(32)
    if block == '':
        break
    blocks.append(block)

#Pythonic Way
blocks = []
# for iter to work, first function has to be a function with no argument
# which can be done with partial
for block in iter(partial(f.read, 32), ''):
    blocks.append(block)
```
#### Distinguishing multiple exit points in loops
```python
# Un-pythonic way
def find(seq, target):
    found = False
    for i, value in enumerate(seq):
        if value == target:
            found = True
            break
    if not found:
        return -1
    return i

#Pythonic Way
def find(seq, target):
    for i, value in enumerate(seq):
        if value == target
            break
    else:
        return -1
    return i
```
#### Looping over dictionary keys
```python
# Un-pythonic way
#Pythonic Way
d = {'matt': 'blue', 'rach':'green', 'ray': 'red'}

for key in d:
    print(key)

# you should never mutate anything while iterating over it
for key in d.keys():
    if key.startswith('r'):
        del d[key]
```
#### Looping over dictionary keys and values
```python
# Un-pythonic way
# it is slow as it has to re-hash every key and do lookup on it
for key in d:   
    print(f'{key} --> {d[key]}')
#Pythonic Way
for key, value in d.items():
    print(f'{key} --> {value}')
```
#### Construct a dictionary in pairs
```python
#Pythonic Way
names = ['ray', 'rach', 'matt']
colors = ['red', 'green', 'blue']

d = dict(zip(names, colors))

d2 = dict(enumerate(names))
```
#### Counting with dictionaries
```python
# Un-pythonic way
colors = ['red', 'green', 'red', 'blue', 'green', 'red']
d = {}
for color in colors:
    if color not in d:
        d[color] = 0
    d[color] += 1

#Pythonic Way
d = {}
for color in colors:
    d[color] = d.get(color, 0) + 1

d = defaultdict(int)
for color in colors:
    d[color] += 1
```
#### Grouping with dictionaries
```python
# Un-pythonic way
names = ['ray', 'rach', 'matt', 'roger', 'betty', 'melissa', 'judy', 'charlie']

d = {}
for name in names:
    key = len(name)
    if key not in d:
        d[key] = []
    d[key].append(name)
#Pythonic Way
d = defaultdict(list)

for name in names:
    key = len(name)
    d[key].append(name)
```
#### Is a dictionary pop() atomic?
```python
# Un-pythonic way
#Pythonic Way
d = {'matt': 'blue', 'rach':'green', 'ray': 'red'}
while d:
    key, value = d.popitem()
    print(f'{key} --> {value}')
```
#### Linking dictionaries
```python
# Un-pythonic way
#Pythonic Way
```
#### Clarify function calls with keyword arguments
```python
# Un-pythonic way
twitter_search('@obama', False, 20, True)
#Pythonic Way
twitter_search('@obama', retweets=False, numtweets=20, popular=True)
```
#### Clarify multiple return values with named tuples
```python
# Un-pythonic way
doctest.testmod()
(0,4)
#Pythonic Way
doctest.testmod()
TestResults(failed=0, attemped=4)

TestResults = namedtuple('TestResults', ['failed', 'attempted'])
```
#### Unpacking sequences
```python
# Un-pythonic way
p = ['Ray', 'Hettinger', 0x30, 'python']
fname = p[0]
lname = p[1]
age = p[2]
email = p[3]
#Pythonic Way
fname, lname, age, email = p
```
#### Updating multiple state variables
```python
# Un-pythonic way
def fiboncci(n):
    x = 0
    y = 1
    for i in range(n):
        print(x)
        t = y   
        y = x + y   
        x = t
#Pythonic Way
# updating state variables at the same time eliminates an entire class
# of errors due to out-of-order updates
def fibonacci(n):
    x, y = 0, 1
    for i in range(n):
        print(x)
        x, y = y, x + y
```
#### Simultaneous state updates
```python
# Un-pythonic way
tmp_x = x + dx * t
tmp_y = y + dy * t
tmp_dx = influence(m, x, y, dx, dy, partial='x')
tmp_dy = influence(m, x, y, dx, dy, partial='y')
x = tmp_x
y = tmp_y
dx = tmp_dx
dy = tmp_dy

#Pythonic Way
# This is similar to excel where formula is taken from the previos if rows:
# here you can visualize in a way that what's on the right is referring to 
# the previous row and in the left is the new one.
x, y, dx, dy = (x + dx * t, 
                y + dy * t, 
                influence(m, x, y, dx, dy, partial='x'),
                influence(m, x, y, dx, dy, partial='y'))
```
#### Concatenating strings
```python
# Un-pythonic way
names = ['ray', 'rach', 'matt', 'roger', 'betty', 'melissa', 'judy', 'charlie']
# it takes quadratic behavior 
s = names[0]
for name in names[1:]:
    s += ', ' + name
print(s)
#Pythonic Way
print(', '.join(names))
```
#### Updating sequences
```python
# Un-pythonic way
names = ['ray', 'rach', 'matt', 'roger', 'betty', 'melissa', 'judy', 'charlie']

del names[0]
names.pop(0)
names.insert(0, 'mark')

#Pythonic Way
# this is much faster for pop and push operation
names = deque(['ray', 'rach', 'matt', 'roger', 'betty', 'melissa', 'judy', 'charlie'])
del names[0]
names.popleft()
names.appendleft('mark')
```
#### Using decorators to factor-out administrative logic
```python
# Un-pythonic way
def web_lookup(url, saved={}):
    if url in saved:
        return saved[url]
    page = urllib.urlopen(url).read()
    saved[url] = page
    return page
#Pythonic Way
# you can put @cache decorator over any function which returns same value
# for an argument
@cache
def web_lookup(url):
    return urllib.urlopen(url).read()
```
#### Caching decorator
```python
#Pythonic Way
def cache(func):
    saved = {}
    @wraps(func)
    def newfunc(*args):
        if args in saved:
            return newfunc(*args)
        result = func(*args)
        saved[args] = result
        return result
    return newfunc
```
#### Factor-out temporary contexts for decimal
```python
# Un-pythonic way
old_context = getcontext().copy()
getcontext().prec = 50
print(Decimal(355)/ Decimal(113))
setcontext(old_context)

#Pythonic Way
with localcontext(Context(prec=50)):
    print(Decimal(355)/Decimal(113))
```
