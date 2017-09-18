// Implementation

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

// Usage

val shapes = arrayListOf<Shape>(Circle(), Square())
var whiteboard = WhiteBoard(shapes)
whiteboard.draw("Red")