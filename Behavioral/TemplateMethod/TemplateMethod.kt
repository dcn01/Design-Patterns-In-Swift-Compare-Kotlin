// Implementation

open class Computer {
    fun printBrandName() {
        println("Computer brand: " + brandName())
    }

    open fun brandName(): String {
        return "Default brand name"
    }
}

class Apple: Computer() {
    
    override fun brandName(): String {
        return "Apple"
    }
    
}

class Dell: Computer {
    override fun brandName(): String {
        return "Dell"
    }
}

// Usage

val apple = Apple()
apple.printBrandName()

val dell = Dell()
dell.printBrandName()