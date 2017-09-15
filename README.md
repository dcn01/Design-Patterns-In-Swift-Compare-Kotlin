# Design Patters in Swift and Kotlin. Comparison

## Table of Contents

* [Creational](#creational)
** [Singleton](#singleton)
* [Structural](#structural)
* [Behavioral](#behavioral)

## Creational

### Singleton

> Ensure a class has only one instance, and provide a global point of access to it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Singleton_pattern)

### Factory method

> Define an interface for creating a single object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Factory_method_pattern)

### Abstract factory

> Provide an interface for creating families of related or dependent objects without specifying their concrete classes.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Abstract_factory_pattern)

### Builder

> Separate the construction of a complex object from its representation, allowing the same construction process to create various representations.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Builder_pattern)

### Prototype

> Specify the kinds of objects to create using a prototypical instance, and create new objects from the 'skeleton' of an existing object, thus boosting performance and keeping memory footprints to a minimum.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Prototype_pattern)




## Structural

### Adapter/Wrapper

> Convert the interface of a class into another interface clients expect. An adapter lets classes work together that could not otherwise because of incompatible interfaces. The enterprise integration pattern equivalent is the translator.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Adapter_pattern)

### Bridge

> Decouple an abstraction from its implementation allowing the two to vary independently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Bridge_pattern)

### Composite

> Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Composite_pattern)

### Decorator

> Attach additional responsibilities to an object dynamically keeping the same interface. Decorators provide a flexible alternative to subclassing for extending functionality.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Decorator_pattern)

### Facade

> Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Facade_pattern)

### Flyweight

> Use sharing to support large numbers of similar objects efficiently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Flyweight_pattern)

### Proxy

> Provide a surrogate or placeholder for another object to control access to it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Proxy_pattern)



## Behavioral

### Chain of responsibility

> Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern)

### Command

> Encapsulate a request as an object, thereby allowing for the parameterization of clients with different requests, and the queuing or logging of requests. It also allows for the support of undoable operations.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Command_pattern)

### Interpreter

> Given a language, define a representation for its grammar along with an interpreter that uses the representation to interpret sentences in the language.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Interpreter_pattern)

### Iterator

> Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Iterator_pattern)

### Mediator

> Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it allows their interaction to vary independently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Mediator_pattern)

### Memento

> Without violating encapsulation, capture and externalize an object's internal state allowing the object to be restored to this state later.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Memento_pattern)

### Observer

> Define a one-to-many dependency between objects where a state change in one object results in all its dependents being notified and updated automatically.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Observer_pattern)

### State

> Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/State_pattern)

### Strategy

> Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Strategy_pattern)

### Template method

> Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Template_method_pattern)

### Visitor

> Represent an operation to be performed on the elements of an object structure. Visitor lets a new operation be defined without changing the classes of the elements on which it operates.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Visitor_pattern)
