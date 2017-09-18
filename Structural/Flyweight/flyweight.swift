// Implementation

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

// Usage

val coffeeShop = CoffeeShop()

coffeeShop.takeOrder("Yirgacheffe, Ethiopia", 1)
coffeeShop.takeOrder("Buziraguhindwa, Burundi", 3)

coffeeShop.serve()
