## Iterator

> Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Iterator_pattern)
 
### Swift Example

```swift

struct Novella {
    let name: String
}

struct Novellas {
    let novellas: [Novella]
}

struct NovellasIterator: IteratorProtocol {

    private var current = 0
    private let novellas: [Novella]

    init(novellas: [Novella]) {
        self.novellas = novellas
    }

    mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}

````

### Swift Usage

```swift
let greatNovellas = Novellas(novellas: [Novella(name: "The Mist")] )

for novella in greatNovellas {
    print("I've read: \(novella)")
}


````

### Kotlin Example

```kotlin
interface Collection {
    open fun iterator(): Iterator
    open operator fun get(index: Int): Any
    open fun size(): Int
}

interface Iterator {
    open fun previous(): Any
    open fun next(): Any
    open fun hasNext(): Boolean
    open fun first(): Any
}

class MyCollection() : Collection {
    var strings = arrayOf("A", "B", "C", "D", "E")

    override operator fun get(index: Int): Any {
        println("index:$index")
        return strings[index]
    }

    override fun size(): Int {
        return strings.size
    }

    override fun iterator(): Iterator {
        return MyIterator(this)
    }
}

class MyIterator(var collection: Collection) : Iterator {
    var pos = -1
    override fun previous(): Any {
        if (pos > 0) {
            pos--
        }
        return collection[pos]
    }

    override fun next(): Any {
        if (pos < collection.size() - 1) {
            pos++
        }
        return collection[pos]
    }

    override fun hasNext(): Boolean {
        return pos < collection.size() - 1
    }

    override fun first(): Any {
        pos = 0
        return collection[pos]
    }
}

````

### Kotlin Usage

```kotlin


````

### Summary