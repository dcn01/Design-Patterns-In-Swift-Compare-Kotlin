// Implementation

protocol Temperature {
    var temperature: Double { get }
}

struct CelsiusTemperature: Temperature {
    let temperature: Double
    
    init(temperature: Double) {
        self.temperature = temperature
    }
}

struct FahrenheitTemperature: Temperature {
    private let celsiusTemperature: CelsiusTemperature
    
    init(celsiusTemperature: CelsiusTemperature) {
        self.celsiusTemperature = celsiusTemperature
    }
    
    var temperature: Double {
        return (celsiusTemperature * 9 / 5) + 32
    }
}

// Usage

let celsius = CelsiusTemperature(temperature: 0.0)
let fahrenheit = FahrenheitTemperature(celsiusTemperature: celsius)
