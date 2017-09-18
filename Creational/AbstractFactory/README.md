## Abstract factory

> Provide an interface for creating families of related or dependent objects without specifying their concrete classes.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Abstract_factory_pattern)

### Swift Example

```swift
protocol Decimal {
    func stringValue() -> String
    // factory
    static func make(string : String) -> Decimal
}

typealias NumberFactory = (String) -> Decimal

struct NextStepNumber: Decimal {
    private var nextStepNumber: NSNumber

    func stringValue() -> String { return nextStepNumber.stringValue }
    
    static func make(string: String) -> Decimal {
        return NextStepNumber(nextStepNumber: NSNumber(value: (string as NSString).longLongValue))
    }
}

struct SwiftNumber: Decimal {
    private var swiftInt: Int

    func stringValue() -> String { return "\(swiftInt)" }
    
    static func make(string: String) -> Decimal {
        return SwiftNumber(swiftInt:(string as NSString).integerValue)
    }
}

enum NumberType {
    case nextStep, swift
}

enum NumberHelper {
    static func factory(for type: NumberType) -> NumberFactory {
        switch type {
        case .nextStep:
            return NextStepNumber.make
        case .swift:
            return SwiftNumber.make
        }
    }
}

````

### Swift Usage

```swift
let factoryOne = NumberHelper.factory(for: .nextStep)
let numberOne = factoryOne("1")
numberOne.stringValue()

let factoryTwo = NumberHelper.factory(for: .swift)
let numberTwo = factoryTwo("2")
numberTwo.stringValue()


````

### Kotlin Example

```kotlin
Interface Button

class OSXButton: Button

class WinButton: Button

abstract class ButtonFactory {
    abstract fun makeButton(): Button


    companion object {
        inline fun <reified T: Button> createFactory(): ButtonFactory = when (T::class) {
            OSXButton::class -> OSXFactory()
            WinButton::class  -> WinFactory()
            else               -> throw IllegalArgumentException()
        }
    }
}

class OSXFactory: ButtonFactory {
    override fun makeButton(): Button = OSXButton()
}

class WinFactory: ButtonFactory {
    override fun makeButton(): Button = WinButton()
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val buttonFactory = ButtonFactory.createFactory<OSXButton>()
    val button = buttonFactory.makeButton()
    println("Created button: $button")
}

````
