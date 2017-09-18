## Proxy

> Provide a surrogate or placeholder for another object to control access to it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Proxy_pattern)

### Swift Example

```swift
protocol File {
    func read(fileName: String) -> String
}

class NormalFile: File {
    func read(fileName: String) -> String {
        return ("NormalFile. Read \(fileName).")
    }
}

class SecuredFile: File {
    private var file: NormalFile!

    func authenticate(password: String) -> Bool {
        guard password == "pass" else {
            return false
        }
        file = NormalFile()
        return true
    }

    func read(fileName: String) -> String {
        guard file != nil else {
            return "Access Denied. I'm afraid I can't do that."
        }
        return computer.read(fileName: fileName)
    }
}

````

### Swift Usage

```swift
let securedFile = SecuredFile()
securedFile.read(fileName: "someTextFile")

securedFile.authenticate(password: "pass")
securedFile.read(fileName: "someTextFile")


````

### Kotlin Example

```kotlin

interface File {
    fun read(name: String)
}

class NormalFile: File {
    override fun read(name: String) = println("Reading file: $name")
}

class SecuredFile: File {
    val normalFile = NormalFile()
    var password: String = ""

    override fun read(name: String) {
        if (password == "secret") {
            println("Password is correct: $password")
            normalFile.read(name)
        } else {
            println("Incorrect password. Access denied!")
        }
    }
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val securedFile = SecuredFile()
    securedFile.read("readme.md")

    securedFile.password = "secret"
    securedFile.read("readme.md")
}

````
