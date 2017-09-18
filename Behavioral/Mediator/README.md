## Mediator

> Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it allows their interaction to vary independently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Mediator_pattern)

### Swift Example

```swift
protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver
    
    var recipients: [ReceiverType] { get }
    
    func send(message: MessageType)
}

struct Programmer: Receiver {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

final class MessageMediator: Sender {
    internal var recipients: [Programmer] = []
    
    func add(recipient: Programmer) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}

````

### Swift Usage

```swift
func spamMonster(message: String, worker: MessageMediator) {
    worker.send(message: message)
}

let messagesMediator = MessageMediator()

let user0 = Programmer(name: "Linus Torvalds")
let user1 = Programmer(name: "Avadis 'Avie' Tevanian")
messagesMediator.add(recipient: user0)
messagesMediator.add(recipient: user1)

spamMonster(message: "I'd Like to Add you to My Professional Network", worker: messagesMediator)

````

### Kotlin Example

```kotlin
interface Mediator {
    fun createMediator()
    fun workAll()
}

class MyMediator : Mediator {
    var user1: User? = null
    var user2: User? = null
    override fun createMediator() {
        user1 = User1(this)
        user2 = User2(this)
    }

    override fun workAll() {
        user1?.work()
        user2?.work()
    }
}

abstract class User(var mediator: Mediator) {
    abstract fun work()
}

class User1(mediator: Mediator) : User(mediator) {
    override fun work() {
        println("user1 exe...")
    }
}

class User2(mediator: Mediator) : User(mediator) {
    override fun work() {
        println("user2 exe...")
    }
}

````

### Kotlin Usage

```kotlin


````

### Summary