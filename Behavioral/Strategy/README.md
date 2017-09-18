## Strategy

> Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Strategy_pattern)

### Swift Example

```swift
protocol PrintStrategy {
    func print(_ string: String) -> String
}

final class Printer {

    private let strategy: PrintStrategy

    func print(_ string: String) -> String {
        return self.strategy.print(string)
    }

    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
}

final class UpperCaseStrategy: PrintStrategy {
    func print(_ string: String) -> String {
        return string.uppercased()
    }
}

final class LowerCaseStrategy: PrintStrategy {
    func print(_ string:String) -> String {
        return string.lowercased()
    }
}

````

### Swift Usage

```swift
var lower = Printer(strategy: LowerCaseStrategy())
lower.print("O tempora, o mores!")

var upper = Printer(strategy: UpperCaseStrategy())
upper.print("O tempora, o mores!")

````

### Kotlin Example

```kotlin
class Printer(val stringFormatterStrategy: (String) -> String) {
    fun printString(string: String) = println(stringFormatterStrategy.invoke(string))
}

val lowerCaseFormatter: (String) -> String = { it.toLowerCase() }

val upperCaseFormatter = { it: String -> it.toUpperCase() }

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {

    val lowerCasePrinter = Printer(lowerCaseFormatter)
    lowerCasePrinter.printString("LOREM ipsum DOLOR sit amet")

    val upperCasePrinter = Printer(upperCaseFormatter)
    upperCasePrinter.printString("LOREM ipsum DOLOR sit amet")

    val prefixPrinter = Printer({ "Prefix: " + it })
    prefixPrinter.printString("LOREM ipsum DOLOR sit amet")
}

````

### Summary