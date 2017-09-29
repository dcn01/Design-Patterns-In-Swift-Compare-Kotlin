## Builder

> Separate the construction of a complex object from its representation, allowing the same construction process to create various representations.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Builder_pattern)

### Swift Example

```swift
class PointBuilder {

    var x: Double?
    var y: Double?
    var z: Double?

    typealias BuilderClosure = (PointBuilder) -> ()

    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

struct Point: CustomStringConvertible {
    let x: Double
    let y: Double
    let z: Double

    init?(builder: PointBuilder) {
        if let x = builder.x, let y = builder.y, let z = builder.z {
            self.x = x
            self.y = y
            self.z = z
        } else {
            return nil
        }
    }

    var description:String {
        return "Point at (x:\(x) y:\(y) z:\(z))"
    }
}
````

### Swift Usage

```swift
let zeroPoint = PointBuilder { builder in
    builder.x = 0
    builder.y = 0
    builder.z = 0
}

let point = Point(builder: zeroPoint)
````

### Kotlin Example

```kotlin
// Implementation

class Dialog() {

    fun showTitle() = println("showing title")

    fun setTitle(text: String) = println("setting title text $text")

    fun setTitleColor(color: String) = println("setting title color $color")

    fun showMessage() = println("showing message")

    fun setMessage(text: String) = println("setting message $text")

    fun setMessageColor(color: String) = println("setting message color $color")

    fun showImage(bitmapBytes: ByteArray) = println("showing image with size ${bitmapBytes.size}")

    fun show() = println("showing dialog $this")
}

class DialogBuilder() {
    constructor(init: DialogBuilder.() -> Unit) : this() {
        init()
    }

    private var titleHolder: TextView? = null
    private var messageHolder: TextView? = null
    private var imageHolder: File? = null

    fun title(init: TextView.() -> Unit) {
        titleHolder = TextView().apply { init() }
    }

    fun message(init: TextView.() -> Unit) {
        messageHolder = TextView().apply { init() }
    }

    fun image(init: () -> File) {
        imageHolder = init()
    }

    fun build(): Dialog {
        val dialog = Dialog()

        titleHolder?.apply {
            dialog.setTitle(text)
            dialog.setTitleColor(color)
            dialog.showTitle()
        }

        messageHolder?.apply {
            dialog.setMessage(text)
            dialog.setMessageColor(color)
            dialog.showMessage()
        }

        imageHolder?.apply {
            dialog.showImage(readBytes())
        }

        return dialog
    }

    class TextView {
        var text: String = ""
        var color: String = "#00000"
    }
}

fun dialog(init: DialogBuilder.() -> Unit): Dialog {
    return DialogBuilder(init).build()
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {

    val dialog: Dialog = dialog {
        title {
            text = "Dialog Title"
        }
        message {
            text = "Dialog Message"
            color = "#333333"
        }
        image {
            File.createTempFile("image", "jpg")
        }
    }

    dialog.show()
}

````
