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

There are four key concepts of object oriented programming and we will discuss each one

## Encapsulation
Encapsulation refers to bundling data with methods that can operate on that data within a class. Essentially, it is the idea of hiding data within a class, preventing anything outside that class from directly interacting with it.

This does not mean that members of other classes cannot interact at all with the attributes of another object. it only means that members of other classes can interact with the attributes of another object through their class's method.

In practice, one way to implement this is through **getting/setting methods**
**Getting method**: Retrieving information
piece.getColor(): check the color of any given chess piece from anywhere in the program without knowing the inner atributes of the object

**Setting method**: Changing information
Setting method can also be modified to ensure that the changes in the attribute is within the bounds of what is allowed. It is always a good practice to change the attributes through some method.

Additionaly, you can also create some attributes that are read only by defining a getter method but not a setter method. In general, it is best to not allow external classes to directly edit an object's attributes.
**Information Hiding** - This is very important when working on large and complex programs. Each piece should not have access to or rely on the inner workings of other sections of code.

As an overview, encapsulation keeps the programmer in control of access to data and prevents the program from ending up in any strange or unwanted states

## Abstraction
Abstraction refers to only showing essential details and keeping everything else hidden. Example - In case of a car, you only need to know about:
1. How the steering wheel steers the car
2. How the gas and brake pedals, affect the car
3. How much gas your car has

However you dont need to concerns about:
1. How exactly the car functions internally
2. How engine works

As long as you understand the outcome, the process is not very important to you, This idea extends to object oriented programming. The classes you create should act like your car. Users of your classes should not worry about the inner details of those classes.

Modern programs are very complex to the point where multiple programmers tend to work on the program. In this case, it's best if the section that you work on is able to function without knowledge of the inner workings of your colleague's section.

To achieve this, it is best to think about your program in terms of interface and implementation. The interface refers to the way sections of code can communicate with one another. This is typically done through methods that each class is able to access, however the exact implementation of these methods, or how these methods are coded, should be hidden.

Taking chess as an example. Let's say that king is under check, due to which knight is unable to move. It can move only to blocks the check. In this scenario, knights should be able to get the information from the king object as to whether it is under check. This can be implemented as an interface. How king determines that it's under check, is not of importance to knight.

This manner of only allowing the class to interact through pre-determined interface prevents different pieces of program to become completely entagled. If classes are entangles, then one change creates a ripple effect that causes many more changes. Creating an interface through which classes can interact ensures that piece can be individually developed.

Abstraction allows the program to be worked on incrementally and prevents it from becoming entangled and comples. It also determine specific points of contact that can act as an interface between classes, and only worry about the implementation when coding it.

## Inheritance
Inheritance is the principle that allows classes to derive from other classes. example
```
class weapon:
    //contains method and attribute common to all weapons
    weapon.damage
    weapon.attach()
```
Now there can be two subclasses to this weapon class like sword and club, which in addition to all methods and variable of weapon class, will also have weapon.damagetype as sharp and blunt. Weapon class here is superclass.

In this fashion, one can create a class hierarchy, wherin a bunch of superclass and subclasses are present. In this hierarchy, a superclass can be a subclass to it's own superclass. for example, a longsword can be a subclass of sword class, which itself is a subclass of weapon, which can be a subclass of items.

Access modifiers change which classes have access to other classes, methods, or attributes. There are three modifiers:
1. Public: these can be accessed from anywhere in your program. This includes anywhere both insider of the classe hierarchy it is defined as well as outside in the rest of the program. 
2. Private: These can be accessed from within the same calss that the member is defined. This allows you to create multiple private members of the same name in different locations so that they do not conflict with one another.
3. Protected: These can be accessed within the class it is defined, as well as any subclasses of that class. This essentially makes protected members private to the hierarchy in thich they are defined.

## Polymorphism
