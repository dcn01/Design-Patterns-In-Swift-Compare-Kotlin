// Implementation

class Person(var surname: String) {
    lateinit var name: String
    
    fun clone(): Person {
        return Person(surname)
    }
}

// Usage

fun main(args: Array<String>) {
    val prototype = Person(surname = "Petrov")

    val ivan = prototype.clone()
    ivan.name = "Ivan"

    val petr = prototype.clone()
    petr.name = "petr"
}