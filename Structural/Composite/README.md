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
class TreeNode(var name: String) {
    var parent: TreeNode? = null
    var children: Vector<TreeNode>

    init {
        children = Vector()
    }

    public fun getChildren(): Enumeration<TreeNode> = children.elements()


    public fun addChildren(node: TreeNode) = children.add(node)


    public fun rmChildren(node: TreeNode) = children.remove(node)

    public fun printTree() {
        println(name)
        this.children.forEach { it.printTree() }
    }

}

public class Tree(var name: String) {
    var root: TreeNode

    init {
        root = TreeNode(name)
    }
}

````

### Kotlin Usage

```kotlin


````

### Summary