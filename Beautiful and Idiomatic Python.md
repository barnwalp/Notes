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
#Pythonic Way
```
#### Is a dictionary pop() atomic?
```python
# Un-pythonic way
#Pythonic Way
```
#### Linking dictionaries
```python
# Un-pythonic way
#Pythonic Way
```
#### Clarify function calls with keyword arguments
```python
# Un-pythonic way
#Pythonic Way
```
#### Clarify multiple return values with named tuples
```python
# Un-pythonic way
#Pythonic Way
```
#### Unpacking sequences
```python
# Un-pythonic way
#Pythonic Way
```
#### Updating multiple state variables
```python
# Un-pythonic way
#Pythonic Way
```
#### Simultaneous state updates
```python
# Un-pythonic way
#Pythonic Way
```
#### Concatenating strings
```python
# Un-pythonic way
#Pythonic Way
```
#### Updating sequences
```python
# Un-pythonic way
#Pythonic Way
```
#### Using decorators to factor-out administrative logic
```python
# Un-pythonic way
#Pythonic Way
```
#### Caching decorator
```python
# Un-pythonic way
#Pythonic Way
```
#### Factor-out temporary contexts for decimal
```python
# Un-pythonic way
#Pythonic Way
```
#### How to open and close files
```python
# Un-pythonic way
#Pythonic Way
```
#### How to use locks
```python
# Un-pythonic way
#Pythonic Way
```
#### Factor-out temporary context
```python
# Un-pythonic way
#Pythonic Way
```
#### Context manager: redirect_stdout()
```python
# Un-pythonic way
#Pythonic Way
```
#### Concise expressive one-liners
```python
# Un-pythonic way
#Pythonic Way
```