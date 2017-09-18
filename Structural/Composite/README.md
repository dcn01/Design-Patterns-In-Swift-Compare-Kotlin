## Composite

> Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Composite_pattern)

### Swift Example

```swift
protocol Shape {
    func draw(fillColor: String)
}

final class Square : Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

final class Circle : Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

final class Whiteboard : Shape {
    lazy var shapes = [Shape]()
    
    init(_ shapes:Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}
````

### Swift Usage

```swift
var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw("Red")
````

### Kotlin Example

```kotlin
interface Shape {
    fun draw(fillColor: String)
}

class Square: Shape {
    override fun draw(fillColor: String) {
        println("Drawing a Square with color" + fillColor)
    }
}

class Circle: Shape {
    override fun draw(fillColor: String) {
        println("Drawing a Circle with color" + fillColor)
    }
}

class WhiteBoard(var shapes: ArrayList<Shape>): Shape {
    override fun draw(fillColor: String) {
        for (shape in shapes) {
            shape.draw(fillColor)
        }
    }
}
````

### Kotlin Usage

```kotlin
val shapes = arrayListOf<Shape>(Circle(), Square())
var whiteboard = WhiteBoard(shapes)
whiteboard.draw("Red")
````
