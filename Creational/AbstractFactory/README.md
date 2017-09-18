## Abstract factory

> Provide an interface for creating families of related or dependent objects without specifying their concrete classes.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Abstract_factory_pattern)

### Swift Example

```swift
protocol Button {}

class OSXButton: Button {}

class WinButton: Button {}

protocol ButtonFactory {
    func makeButton() -> Button
}

class OSXFactory: ButtonFactory {
    func makeButton() -> Button {
        return OSXButton()
    }
}

class WinFactory: ButtonFactory {
    func makeButton() -> Button {
        return WinButton()
    }
}

enum Type {
    case OSX, Win
}

enum FactoryHelper {
    static func factory(for type: Type) -> ButtonFactory {
        switch type {
        case .OSX:
            return OSXFactory()
        case .Win:
            return WinFactory()
        }
    }
}
````

### Swift Usage

```swift
let buttonFactory = FactoryHelper.factory(for: .OSX)
let button = buttonFactory.makeButton()
````

### Kotlin Example

```kotlin
interface Button

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

class OSXFactory: ButtonFactory() {
    override fun makeButton(): Button = OSXButton()
}

class WinFactory: ButtonFactory() {
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
