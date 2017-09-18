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
class ConnectionPool private constructor() {
    var pool: Vector<Connection>
    var url = "jdbc:mysql://localhost:3306/test"
    var username = "brandon"
    var password = "large_elephant"
    var driveClassName = "com.mysql.jdbc.Driver"
    var poolSize = 100
    var conn: Connection? = null

    companion object {
        var INSTANCE: ConnectionPool ? = null
    }

    init {
        pool = Vector(poolSize)
        for (i in 0..poolSize) {
            Class.forName(driveClassName)
            conn = Drivermanager.getConnection(url, username, password)
            pool.add(conn)
        }
    }

    @Synchronized fun getConnection(): Connection? {
        if (pool.size > 0) {
            var conn = pool.get(0)
            pool.remove(conn)
            return conn
        } else return null
    }

    object Drivermanager {
        fun getConnection(url: String, usrname: String, paasword: String): Connection {
            return Connection()
        }
    }

}

class Connection {


}

````

### Kotlin Usage

```kotlin


````

### Summary