## Chain of responsibility

> Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern)

### Swift Example

```swift
final class MoneyPile {

    let value: Int
    var quantity: Int
    var nextPile: MoneyPile?

    init(value: Int, quantity: Int, nextPile: MoneyPile?) {
        self.value = value
        self.quantity = quantity
        self.nextPile = nextPile
    }

    func canWithdraw(amount: Int) -> Bool {

        var amount = amount

        func canTakeSomeBill(want: Int) -> Bool {
            return (want / self.value) > 0
        }

        var quantity = self.quantity

        while canTakeSomeBill(want: amount) {

            if quantity == 0 {
                break
            }

            amount -= self.value
            quantity -= 1
        }

        guard amount > 0 else {
            return true
        }

        if let next = self.nextPile {
            return next.canWithdraw(amount: amount)
        }

        return false
    }
}

final class ATM {
    private var hundred: MoneyPile
    private var fifty: MoneyPile
    private var twenty: MoneyPile
    private var ten: MoneyPile

    private var startPile: MoneyPile {
        return self.hundred
    }

    init(hundred: MoneyPile,
           fifty: MoneyPile,
          twenty: MoneyPile,
             ten: MoneyPile) {

        self.hundred = hundred
        self.fifty = fifty
        self.twenty = twenty
        self.ten = ten
    }

    func canWithdraw(amount: Int) -> String {
        return "Can withdraw: \(self.startPile.canWithdraw(amount: amount))"
    }
}


````

### Swift Usage

```swift
let ten = MoneyPile(value: 10, quantity: 6, nextPile: nil)
let twenty = MoneyPile(value: 20, quantity: 2, nextPile: ten)
let fifty = MoneyPile(value: 50, quantity: 2, nextPile: twenty)
let hundred = MoneyPile(value: 100, quantity: 1, nextPile: fifty)

// Build ATM.
var atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
atm.canWithdraw(amount: 310) // Cannot because ATM has only 300
atm.canWithdraw(amount: 100) // Can withdraw - 1x100
atm.canWithdraw(amount: 165) // Cannot withdraw because ATM doesn't has bill with value of 5
atm.canWithdraw(amount: 30)  // Can withdraw - 1x20, 2x10

````

### Kotlin Example

```kotlin
interface MessageChain {
    fun addLines(inputHeader: String): String
}

class AuthenticationHeader(val token: String?, var next: MessageChain? = null) : MessageChain {

    override fun addLines(inputHeader: String): String {
        token ?: throw IllegalStateException("Token should be not null")
        return "$inputHeader Authorization: Bearer $token\n".let { next?.addLines(it) ?: it }
    }
}

class ContentTypeHeader(val contentType: String, var next: MessageChain? = null) : MessageChain {

    override fun addLines(inputHeader: String): String
            = "$inputHeader ContentType: $contentType\n".let { next?.addLines(it) ?: it }
}

class BodyPayload(val body: String, var next: MessageChain? = null) : MessageChain {

    override fun addLines(inputHeader: String): String
            = "$inputHeader $body\n".let { next?.addLines(it) ?: it }
}

fun main(args: Array<String>) {
    val authenticationHeader = AuthenticationHeader("123456")
    val contentTypeHeader = ContentTypeHeader("json")
    val messageBody = BodyPayload("{\"username\"=\"dbacinski\"}")

    val messageChainWithAuthorization = messageChainWithAuthorization(authenticationHeader, contentTypeHeader, messageBody)
    val messageWithAuthentication = messageChainWithAuthorization.addLines("Message with Authentication:\n")
    println(messageWithAuthentication)

    val messageChainUnauthenticated = messageChainUnauthenticated(contentTypeHeader, messageBody)
    val message = messageChainUnauthenticated.addLines("Message:\n")
    println(message)
}

private fun messageChainWithAuthorization(authenticationHeader: AuthenticationHeader, contentTypeHeader: ContentTypeHeader, messageBody: BodyPayload): MessageChain {
    authenticationHeader.next = contentTypeHeader
    contentTypeHeader.next = messageBody
    return authenticationHeader
}

private fun messageChainUnauthenticated(contentTypeHeader: ContentTypeHeader, messageBody: BodyPayload): MessageChain {
    contentTypeHeader.next = messageBody
    return contentTypeHeader
}



````

### Kotlin Usage

```kotlin


````

### Summary