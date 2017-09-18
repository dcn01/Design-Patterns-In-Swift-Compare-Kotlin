## Observer

> Define a one-to-many dependency between objects where a state change in one object results in all its dependents being notified and updated automatically.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Observer_pattern)

### Swift Example

```swift
protocol PropertyObserver : class {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class TestChambers {

    weak var observer:PropertyObserver?

    private let testChamberNumberName = "testChamberNumber"

    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

final class Observer : PropertyObserver {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }

    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}

````

### Swift Usage

```swift
var observerInstance = Observer()
var testChambers = TestChambers()
testChambers.observer = observerInstance
testChambers.testChamberNumber += 1

````

### Kotlin Example

```kotlin

interface TextChangedListener {
    fun onTextChanged(newText: String)
}

class PrintingTextChangedListener : TextChangedListener {
    override fun onTextChanged(newText: String) = println("Text is changed to: $newText")
}

class TextView {

    var listener: TextChangedListener? = null

    var text: String by Delegates.observable("") { prop, old, new ->
        listener?.onTextChanged(new)
    }
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val textView = TextView()
    textView.listener = PrintingTextChangedListener()
    textView.text = "Lorem ipsum"
    textView.text = "dolor sit amet"
}

````

### Summary