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
open class Computer {
    fun printBrandName() {
        println("Computer brand: " + brandName())
    }

    open fun brandName(): String {
        return "Default brand name"
    }
}

class Apple: Computer() {
    
    override fun brandName(): String {
        return "Apple"
    }
    
}

class Dell: Computer {
    override fun brandName(): String {
        return "Dell"
    }
}
````

### Kotlin Usage

```kotlin
val apple = Apple()
apple.printBrandName()

val dell = Dell()
dell.printBrandName()
````

### Summary