## Bridge

> Decouple an abstraction from its implementation allowing the two to vary independently.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Bridge_pattern)

### Swift Example

```swift
protocol Switch {
    var appliance: Appliance {get set}
    func turnOn()
}

protocol Appliance {
    func run()
}

class RemoteControl: Switch {
    var appliance: Appliance

    func turnOn() {
        self.appliance.run()
    }
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

class TV: Appliance {
    func run() {
        print("tv turned on");
    }
}

class VacuumCleaner: Appliance {
    func run() {
        print("vacuum cleaner turned on")
    }
}


````

### Swift Usage

```swift
var tvRemoteControl = RemoteControl(appliance: TV())
tvRemoteControl.turnOn()

var fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
fancyVacuumCleanerRemoteControl.turnOn()

````

### Kotlin Example

```kotlin


````

### Kotlin Usage

```kotlin


````

### Summary