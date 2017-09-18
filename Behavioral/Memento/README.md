## Memento

> Without violating encapsulation, capture and externalize an object's internal state allowing the object to be restored to this state later.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Memento_pattern)

### Swift Example

```swift

typealias Memento = NSDictionary

protocol MementoConvertible {
    var memento: Memento { get }
    init?(memento: Memento)
}

struct GameState: MementoConvertible {

    private struct Keys {
        static let chapter = "com.valve.halflife.chapter"
        static let weapon = "com.valve.halflife.weapon"
    }

    var chapter: String
    var weapon: String

    init(chapter: String, weapon: String) {
        self.chapter = chapter
        self.weapon = weapon
    }

    init?(memento: Memento) {
        guard let mementoChapter = memento[Keys.chapter] as? String,
              let mementoWeapon = memento[Keys.weapon] as? String else {
            return nil
        }

        chapter = mementoChapter
        weapon = mementoWeapon
    }

    var memento: Memento {
        return [ Keys.chapter: chapter, Keys.weapon: weapon ]
    }
}
/*:
Caretaker
*/
enum CheckPoint {
    static func save(_ state: MementoConvertible, saveName: String) {
        let defaults = UserDefaults.standard
        defaults.set(state.memento, forKey: saveName)
        defaults.synchronize()
    }

    static func restore(saveName: String) -> Memento? {
        let defaults = UserDefaults.standard

        return defaults.object(forKey: saveName) as? Memento
    }
}
````

### Swift Usage

```swift
var gameState = GameState(chapter: "Black Mesa Inbound", weapon: "Crowbar")

gameState.chapter = "Anomalous Materials"
gameState.weapon = "Glock 17"
CheckPoint.save(gameState, saveName: "gameState1")

gameState.chapter = "Unforeseen Consequences"
gameState.weapon = "MP5"
CheckPoint.save(gameState, saveName: "gameState2")

gameState.chapter = "Office Complex"
gameState.weapon = "Crossbow"
CheckPoint.save(gameState, saveName: "gameState3")

if let memento = CheckPoint.restore(saveName: "gameState1") {
    let finalState = GameState(memento: memento)
    dump(finalState)
}


````

### Kotlin Example

```kotlin
class Original(var value: String) {
    fun createMemento() = Memento(value)
    fun restoreMemento(memento: Memento) {
        this.value = memento.value
    }
}

class Memento(var value: String) {

}

class Storage(var memento: Memento) {

}


````

### Kotlin Usage

```kotlin


````

### Summary