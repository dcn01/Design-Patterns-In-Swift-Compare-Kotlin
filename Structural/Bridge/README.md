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
interface Sourceable {
    open fun method()
}

public class SourceSub1 : Sourceable {
    override fun method() {
        println("this (${this.javaClass}) is the first sub!")
    }
}

public class SourceSub2 : Sourceable {
    override fun method() {
        println("this (${this.javaClass}) is the second sub")
    }
}

open class Bridge {
    var source: Sourceable? = null

    public fun method() = source?.method()
}

````

### Kotlin Usage

```kotlin


````

### Summary