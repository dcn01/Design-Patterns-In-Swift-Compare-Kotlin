// Implementation

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

// Usage

let zeroPoint = PointBuilder { builder in
    builder.x = 0
    builder.y = 0
    builder.z = 0
}

let point = Point(builder: zeroPoint)