## Visitor

> Represent an operation to be performed on the elements of an object structure. Visitor lets a new operation be defined without changing the classes of the elements on which it operates.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Visitor_pattern)

### Swift Example

```swift
protocol PlanetVisitor {
	func visit(planet: PlanetAlderaan)
	func visit(planet: PlanetCoruscant)
	func visit(planet: PlanetTatooine)
    func visit(planet: MoonJedah)
}

protocol Planet {
	func accept(visitor: PlanetVisitor)
}

class MoonJedah: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

class PlanetAlderaan: Planet {
    func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

class PlanetCoruscant: Planet {
	func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

class PlanetTatooine: Planet {
	func accept(visitor: PlanetVisitor) { visitor.visit(planet: self) }
}

class NameVisitor: PlanetVisitor {
	var name = ""

	func visit(planet: PlanetAlderaan)  { name = "Alderaan" }
	func visit(planet: PlanetCoruscant) { name = "Coruscant" }
	func visit(planet: PlanetTatooine)  { name = "Tatooine" }
    func visit(planet: MoonJedah)     	{ name = "Jedah" }
}

````

### Swift Usage

```swift
let planets: [Planet] = [PlanetAlderaan(), PlanetCoruscant(), PlanetTatooine(), MoonJedah()]

let names = planets.map { (planet: Planet) -> String in
	let visitor = NameVisitor()
    planet.accept(visitor: visitor)
	return visitor.name
}


````

### Kotlin Example

```kotlin
interface ReportVisitable {
    fun accept(visitor: ReportVisitor)
}

class FixedPriceContract(val costPerYear: Long) : ReportVisitable {
    override fun accept(visitor: ReportVisitor) = visitor.visit(this)
}

class TimeAndMaterialsContract(val costPerHour: Long, val hours: Long) : ReportVisitable {
    override fun accept(visitor: ReportVisitor) = visitor.visit(this)
}

class SupportContract(val costPerMonth: Long) : ReportVisitable {
    override fun accept(visitor: ReportVisitor) = visitor.visit(this)
}

interface ReportVisitor {
    fun visit(contract: FixedPriceContract)
    fun visit(contract: TimeAndMaterialsContract)
    fun visit(contract: SupportContract)
}

class MonthlyCostReportVisitor(var monthlyCost: Long = 0) : ReportVisitor {
    override fun visit(contract: FixedPriceContract) {
        monthlyCost += contract.costPerYear / 12
    }

    override fun visit(contract: TimeAndMaterialsContract) {
        monthlyCost += contract.costPerHour * contract.hours
    }

    override fun visit(contract: SupportContract) {
        monthlyCost += contract.costPerMonth
    }
}

class YearlyReportVisitor(var yearlyCost: Long = 0) : ReportVisitor {
    override fun visit(contract: FixedPriceContract) {
        yearlyCost += contract.costPerYear
    }

    override fun visit(contract: TimeAndMaterialsContract) {
        yearlyCost += contract.costPerHour * contract.hours
    }

    override fun visit(contract: SupportContract) {
        yearlyCost += contract.costPerMonth * 12
    }
}


````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val projectAlpha = FixedPriceContract(costPerYear = 10000)
    val projectBeta = SupportContract(costPerMonth = 500)
    val projectGamma = TimeAndMaterialsContract(hours = 150, costPerHour = 10)
    val projectKappa = TimeAndMaterialsContract(hours = 50, costPerHour = 50)

    val projects = arrayOf(projectAlpha, projectBeta, projectGamma, projectKappa)

    val monthlyCostReportVisitor = MonthlyCostReportVisitor()
    projects.forEach { it.accept(monthlyCostReportVisitor) }
    println("Monthly cost: ${monthlyCostReportVisitor.monthlyCost}")

    val yearlyReportVisitor = YearlyReportVisitor()
    projects.forEach { it.accept(yearlyReportVisitor) }
    println("Yearly cost: ${yearlyReportVisitor.yearlyCost}")
}

````

### Summary