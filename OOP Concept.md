## Introduction

### Primitive Data type
**primitive data types** store single, simple values. eg: Byte, int, float etc. Program at the time weren't very complicated compared to today. As programs became larger and more complex, only using primitive data types wasn't sufficient anymore. Programmer began to need to group similar pieces of data together.

Let's consider chess to understand this example. To define, lets say a knight, you need following details:
1. current position of knight at the chess
2. whether horse is captured or not
3. what color the knight is

In addition to having these many variables, there may be more than one knight for which these variables need to be defined. therefore, it is necessary to group the variables together to define one entity. This is wehere **struct or structure** came from. You could define multiple variables in one structure and another structure can be defined which consist only structures. Ex:
```
struct Knight:
    position
    color
    captured

struct Knights:
    Knight1
    Knight2
    Kinght3

struct whiteKnights:
    Knight1
    Knight3
```
structure in many ways is a precursor to an object, around which object oriented programming was developed.

Main issue with the structure is that you cannot define functions within one. Thinking about the chess example, this prevents you from defining a function specifit to the knights, such as their move function, within the structure.

### Objects
Objects are instance of a class and classes are template for objects. 
```
class Knight:
    //color and position are not initialized, as different instances of a knight will have different values for these variables
    position
    color
    move() - function is specific to knights as other pieces move in a different manner
```
A knight class represents any given knight, a knight object represents only one singular knight.
Object oriented programming helps programmers create complex programs by grouping together related data and functions