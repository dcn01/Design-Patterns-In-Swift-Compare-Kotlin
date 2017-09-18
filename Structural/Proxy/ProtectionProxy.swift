// Implementation

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

// Usage
 
let securedFile = SecuredFile()
securedFile.read(fileName: "someTextFile")

securedFile.authenticate(password: "pass")
securedFile.read(fileName: "someTextFile")
