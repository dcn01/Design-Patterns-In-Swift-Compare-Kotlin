## Singleton

> Ensure a class has only one instance, and provide a global point of access to it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Singleton_pattern)

### Swift Example

```swift
final class Singleton {
    static let sharedInstance = Singleton()

    private init() {
        // Private initialization to ensure just one instance is created.
    }
}

````

### Swift Usage

```swift
let singleton = Singleton.sharedInstance

````

### Kotlin Example

```kotlin
object Singleton {
    init {
        println("Initializing with object: $this")
    }

    fun doSomething() = println("Do something with object: $this")
}

````

### Kotlin Usage

```kotlin
Singleton.doSomething()

````