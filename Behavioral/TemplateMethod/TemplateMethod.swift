// Implementation

class Computer {
    func printBrandName() {
        print("Computer brand: \(brandName())")
    }
 
    func brandName() -> String {
        assertionFailure("Please provide brand name")
        return ""
    }
 }

class Apple: Computer {
    override func brandName() -> String {
        return "Apple"
    }
}

class Dell: Computer {
    override func brandName() -> String {
        return "Dell"
    }
}

// Usage

let apple = Apple()
apple.printBrandName()

let dell = Dell()
dell.printBrandName()
