// Implementation

class Person {
    var name: String?
    let surname: String

    init(surname: String) {
        self.surname = surname
    }

    func clone() -> Person {
        return Person(surname: self.surname)
    }
}

// Usage

let prototype = Person(surname: "Petrov")

let ivan = prototype.clone()
ivan.name = "ivan"

let petr = prototype.clone()
petr.name = "petr"