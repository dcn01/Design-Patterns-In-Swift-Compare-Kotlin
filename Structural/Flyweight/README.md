## Flyweight

> Use sharing to support large numbers of similar objects efficiently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Flyweight_pattern)

### Swift Example

```swift
final class SpecialityCoffee: CustomStringConvertible {
    var origin: String
    var description: String {
        get {
            return origin
        }
    }

    init(origin: String) {
        self.origin = origin
    }
}

// Menu acts as a factory and cache for CoffeeFlavour flyweight objects
final class Menu {
    private var coffeeAvailable: [String: SpecialityCoffee] = [:]

    func lookup(origin: String) -> SpecialityCoffee? {
        if coffeeAvailable.index(forKey: origin) == nil {
            coffeeAvailable[origin] = SpecialityCoffee(origin: origin)
        }

        return coffeeAvailable[origin]
    }
}

final class CoffeeShop {
    private var orders: [Int: SpecialityCoffee] = [:]
    private var menu = Menu()

    func takeOrder(origin: String, table: Int) {
        orders[table] = menu.lookup(origin: origin)
    }

    func serve() {
        for (table, origin) in orders {
            print("Serving \(origin) to table \(table)")
        }
    }
}

````

### Swift Usage

```swift
let coffeeShop = CoffeeShop()

coffeeShop.takeOrder(origin: "Yirgacheffe, Ethiopia", table: 1)
coffeeShop.takeOrder(origin: "Buziraguhindwa, Burundi", table: 3)

coffeeShop.serve()

````

### Kotlin Example

```kotlin
class SpecialityCoffee(var origin: String)

class Menu {
    private var coffeeAvailable = hashMapOf<String, SpecialityCoffee>()

    fun lookup(origin: String): SpecialityCoffee {
        if (coffeeAvailable[origin] == null) {
            coffeeAvailable[origin] = SpecialityCoffee(origin = origin)
        }
        return coffeeAvailable[origin]
    }
}

class CoffeeShop {
    private var orders = hashMapOf<Int, SpecialityCoffee>()
    private var menu = Menu()

    fun takeOrder(origin: String, table: Int) {
        orders[table] = menu.lookup(origin = origin)
    }

    fun serve() {
        orders.forEach { table, specialityCoffee ->
            println("Serving " +origin + " to table " + table)
        }
    }
}
````

### Kotlin Usage

```kotlin
val coffeeShop = CoffeeShop()

coffeeShop.takeOrder("Yirgacheffe, Ethiopia", 1)
coffeeShop.takeOrder("Buziraguhindwa, Burundi", 3)

coffeeShop.serve()
````
