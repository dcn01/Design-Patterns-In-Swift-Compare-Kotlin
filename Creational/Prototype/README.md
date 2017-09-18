## Prototype

> Specify the kinds of objects to create using a prototypical instance, and create new objects from the 'skeleton' of an existing object, thus boosting performance and keeping memory footprints to a minimum.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Prototype_pattern)

### Swift Example

```swift
class Person {
    var name: String?
    let surname: String

    init(surname: String) {
        self.surname = surname
    }

    func clone() -> Person {
        return Person(surname: self.surname)
    }
}
````

### Swift Usage

```swift
let prototype = Person(surname: "Petrov")

let ivan = prototype.clone()
ivan.name = "ivan"

let petr = prototype.clone()
petr.name = "petr"
````

### Kotlin Example

```kotlin
class Person(var surname: String) {
    lateinit var name: String
    
    fun clone(): Person {
        return Person(surname)
    }
}
````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val prototype = Person(surname = "Petrov")

    val ivan = prototype.clone()
    ivan.name = "Ivan"

    val petr = prototype.clone()
    petr.name = "petr"
}
````
