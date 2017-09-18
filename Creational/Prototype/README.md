## Prototype

> Specify the kinds of objects to create using a prototypical instance, and create new objects from the 'skeleton' of an existing object, thus boosting performance and keeping memory footprints to a minimum.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Prototype_pattern)

### Swift Example

```swift
class ChungasRevengeDisplay {
    var name: String?
    let font: String

    init(font: String) {
        self.font = font
    }

    func clone() -> ChungasRevengeDisplay {
        return ChungasRevengeDisplay(font:self.font)
    }
}

````

### Swift Usage

```swift
let Prototype = ChungasRevengeDisplay(font:"GotanProject")

let Philippe = Prototype.clone()
Philippe.name = "Philippe"

let Christoph = Prototype.clone()
Christoph.name = "Christoph"

let Eduardo = Prototype.clone()
Eduardo.name = "Eduardo"


````

### Kotlin Example

```kotlin
data class EMail(var recipient: String, var subject: String?, var message: String?) {
    fun quote(startIndex: Int) : String {
        return "> ${message?.substring(startIndex)}"
    }
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val mail = EMail("abc@example.com", "Hello", "Don't know what to write.")

    val copy = mail.copy(recipient = "other@example.com")

    println("Email1 goes to " + mail.recipient + " with subject " + mail.subject)
    println("Email2 goes to " + copy.recipient + " with subject " + copy.subject)
}

````
