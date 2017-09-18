## Composite

> Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Composite_pattern)

### Swift Example

```swift
protocol Shape {
    func draw(fillColor: String)
}
/*: 
Leafs
*/ 
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

/*:
Composite
*/
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


````

### Kotlin Usage

```kotlin


````

### Summary