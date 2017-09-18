// Implementation

interface Button

class OSXButton: Button

class WinButton: Button

abstract class ButtonFactory {
    abstract fun makeButton(): Button


    companion object {
        inline fun <reified T: Button> createFactory(): ButtonFactory = when (T::class) {
            OSXButton::class -> OSXFactory()
            WinButton::class  -> WinFactory()
            else               -> throw IllegalArgumentException()
        }
    }
}

class OSXFactory: ButtonFactory() {
    override fun makeButton(): Button = OSXButton()
}

class WinFactory: ButtonFactory() {
    override fun makeButton(): Button = WinButton()
}

// Usage

fun main(args: Array<String>) {
    val buttonFactory = ButtonFactory.createFactory<OSXButton>()
    val button = buttonFactory.makeButton()
    println("Created button: $button")
}