## State

> Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.
>
>**Source:** [wikipedia.org](https://en.wikipedia.org/wiki/State_pattern)

### Swift Example

```swift
final class Context {
	private var state: State = UnauthorizedState()

    var isAuthorized: Bool {
        get { return state.isAuthorized(context: self) }
    }

    var userId: String? {
        get { return state.userId(context: self) }
    }

	func changeStateToAuthorized(userId: String) {
		state = AuthorizedState(userId: userId)
	}

	func changeStateToUnauthorized() {
		state = UnauthorizedState()
	}

}

protocol State {
	func isAuthorized(context: Context) -> Bool
	func userId(context: Context) -> String?
}

class UnauthorizedState: State {
	func isAuthorized(context: Context) -> Bool { return false }

	func userId(context: Context) -> String? { return nil }
}

class AuthorizedState: State {
	let userId: String

	init(userId: String) { self.userId = userId }

	func isAuthorized(context: Context) -> Bool { return true }

	func userId(context: Context) -> String? { return userId }
}

````

### Swift Usage

```swift
let userContext = Context()
(userContext.isAuthorized, userContext.userId)
userContext.changeStateToAuthorized(userId: "admin")
(userContext.isAuthorized, userContext.userId) // now logged in as "admin"
userContext.changeStateToUnauthorized()
(userContext.isAuthorized, userContext.userId)

````

### Kotlin Example

```kotlin
sealed class AuthorizationState {

    class Unauthorized : AuthorizationState()

    class Authorized(val userName: String) : AuthorizationState()
}

class AuthorizationPresenter {

    private var state: AuthorizationState = Unauthorized()

    fun loginUser(userLogin: String) {
        state = Authorized(userLogin)
    }

    fun logoutUser() {
        state = Unauthorized()
    }

    val isAuthorized: Boolean
        get() {
            when (state) {
                is Authorized -> return true
                else -> return false
            }
        }

    val userLogin: String
        get() {
            when (state) {
                is Authorized -> return (state as Authorized).userName
                is Unauthorized -> return "Unknown"
            }
        }

    override fun toString(): String {
        return "User '$userLogin' is logged in: $isAuthorized"
    }
}

````

### Kotlin Usage

```kotlin
fun main(args: Array<String>) {
    val authorization = AuthorizationPresenter()
    authorization.loginUser("admin")
    println(authorization)
    authorization.logoutUser()
    println(authorization)
}

````

### Summary