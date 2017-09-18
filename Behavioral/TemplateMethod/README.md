## Template method

> Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Template_method_pattern)

### Swift Example

```swift
class Computer {
    func printBrandName() {
        print("Computer brand: \(brandName())")
    }
 
    func brandName() -> String {
        assertionFailure("Please provide brand name")
        return ""
    }
 }

class Apple: Computer {
    override func brandName() -> String {
        return "Apple"
    }
}

class Dell: Computer {
    override func brandName() -> String {
        return "Dell"
    }
}

````

### Swift Usage

```swift
let apple = Apple()
apple.printBrandName()

let dell = Dell()
dell.printBrandName()


````

### Kotlin Example

```kotlin
interface Observer {
    open fun update()
}

class Observer1() : Observer {
    override fun update() {
        println("observer1 has reserved!")
    }
}

class Observer2() : Observer {
    override fun update() {
        println("observer2 has reserved!")
    }
}


interface Subject {
    open fun add(observer: Observer)

    open fun del(observer: Observer)

    open fun notifyObservers()

    open fun operation()
}


abstract class AbstractSubject : Subject {

    private var vector: Vector<Observer>

    init {
        vector = Vector()
    }

    override fun add(observer: Observer) {
        vector.add(observer)
    }

    override fun del(observer: Observer) {
        vector.remove(observer)
    }

    override fun notifyObservers() {
        vector.forEach { it -> it.update() }
    }

}


public class MyDefSubject() : AbstractSubject() {
    override fun operation() {
        println("update ...")
        notifyObservers()
    }
}

````

### Kotlin Usage

```kotlin


````

### Summary