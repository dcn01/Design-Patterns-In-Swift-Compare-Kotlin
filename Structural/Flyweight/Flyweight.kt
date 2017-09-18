// Implementation

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

// Usage

val coffeeShop = CoffeeShop()

coffeeShop.takeOrder("Yirgacheffe, Ethiopia", 1)
coffeeShop.takeOrder("Buziraguhindwa, Burundi", 3)

coffeeShop.serve()