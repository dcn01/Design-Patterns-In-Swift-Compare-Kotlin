// Implementation

final class Singleton {
    static let sharedInstance = Singleton()

    private init() {
        // Private initialization to ensure just one instance is created.
    }
}

// Usage:

let singleton = Singleton.sharedInstance
