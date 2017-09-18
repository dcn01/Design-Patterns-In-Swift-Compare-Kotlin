## Factory method

> Define an interface for creating a single object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Factory_method_pattern)

### Swift Example

```swift
protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro: Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar: Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

enum Country {
    case unitedStates, spain, uk, greece
}

enum CurrencyFactory {
    static func currency(for country:Country) -> Currency? {

        switch country {
            case .spain, .greece:
                return Euro()
            case .unitedStates:
                return UnitedStatesDolar()
            default:
                return nil
        }
        
    }
}

````

### Swift Usage

```swift
let noCurrencyCode = "No Currency Code Available"

CurrencyFactory.currency(for: .greece)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .spain)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .unitedStates)?.code() ?? noCurrencyCode
CurrencyFactory.currency(for: .uk)?.code() ?? noCurrencyCode

````

### Kotlin Example

```kotlin
interface Currency {
    val code: String
}

class Euro(override val code: String = "EUR") : Currency
class UnitedStatesDollar(override val code: String = "USD") : Currency

enum class Country {
    UnitedStates, Spain, UK, Greece
}

class CurrencyFactory {
    fun currencyForCountry(country: Country): Currency? {
        when (country) {
            Country.Spain, Country.Greece -> return Euro()
            Country.UnitedStates          -> return UnitedStatesDollar()
            else                          -> return null
        }
    }
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val noCurrencyCode = "No Currency Code Available"

    val greeceCode = CurrencyFactory().currencyForCountry(Country.Greece)?.code ?: noCurrencyCode
    println("Greece currency: $greeceCode")

    val usCode = CurrencyFactory().currencyForCountry(Country.UnitedStates)?.code ?: noCurrencyCode
    println("US currency: $usCode")

    val ukCode = CurrencyFactory().currencyForCountry(Country.UK)?.code ?: noCurrencyCode
    println("UK currency: $ukCode")
}

````
