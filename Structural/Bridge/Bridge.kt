// Implementation

interface Switch {
    var appliance: Appliance
    fun turnOn()
}

interface Appliance {
    fun run()
}

class RemoteControl(override var appliance: Appliance) : Switch {

    override fun turnOn() {
        appliance.run()
    }
    
}

class TV: Appliance {
    override fun run() {
        println("tv turned on")
    }
}

class VacuumCleaner: Appliance {
    override fun run() {
        println("vacuum cleaner turned on")
    }
}

// Usage

var tvRemoteControl = RemoteControl(appliance = TV())
tvRemoteControl.turnOn()

var fancyVacuumCleanerRemoteControl = RemoteControl(appliance = VacuumCleaner())
fancyVacuumCleanerRemoteControl.turnOn()