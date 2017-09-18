## Adapter-Wrapper

> Convert the interface of a class into another interface clients expect. An adapter lets classes work together that could not otherwise because of incompatible interfaces. The enterprise integration pattern equivalent is the translator.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Adapter_pattern)

### Swift Example

```swift
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
````

### Swift Usage

```swift
let celsius = CelsiusTemperature(temperature: 0.0)
let fahrenheit = FahrenheitTemperature(celsiusTemperature: celsius)
````

### Kotlin Example

```kotlin
interface Temperature {
    var temperature: Double
}

class CelsiusTemperature(override var temperature: Double) : Temperature

class FahrenheitTemperature(var celsiusTemperature: CelsiusTemperature) : Temperature {

    override var temperature: Double
        get() = convertCelsiusToFahrenheit(celsiusTemperature.temperature)
        set(temperatureInF) {
            celsiusTemperature.temperature = convertFahrenheitToCelsius(temperatureInF)
        }

    private fun convertFahrenheitToCelsius(f: Double): Double = (f - 32) * 5 / 9

    private fun convertCelsiusToFahrenheit(c: Double): Double = (c * 9 / 5) + 32
}
````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val celsiusTemperature = CelsiusTemperature(0.0)
    val fahrenheitTemperature = FahrenheitTemperature(celsiusTemperature)

    celsiusTemperature.temperature = 36.6
    println("${celsiusTemperature.temperature} C -> ${fahrenheitTemperature.temperature} F")

    fahrenheitTemperature.temperature = 100.0
    println("${fahrenheitTemperature.temperature} F -> ${celsiusTemperature.temperature} C")
}
````
