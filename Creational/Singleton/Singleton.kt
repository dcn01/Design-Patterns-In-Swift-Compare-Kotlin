object Singleton {
    init {
        println("Initializing with object: $this")
    }

    fun doSomething() = println("Do something with object: $this")
}

fun main(args: Array<String>) {
	Singleton.doSomething()
}