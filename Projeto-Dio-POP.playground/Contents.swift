import UIKit

protocol Printable {
    mutating func printDocument()
    mutating func printImage()
}

protocol TonerReloadable {
    mutating func reloadToner()
}

protocol TonerLevelCheckable {
    var tonerLevel: Int { get }
}

struct Printer: Printable, TonerReloadable, TonerLevelCheckable, CustomStringConvertible {
    mutating func printDocument() {
        print("O documento foi impresso.")
        tonerLevel -= 20
    }
    
    mutating func printImage() {
        print("A imagem foi impressa.")
        tonerLevel -= 30
    }
    
    mutating func reloadToner() {
        tonerLevel = 100
        print("O toner foi recarregado. Nivel atual: \(tonerLevel)%.")
    }
    
    private(set) var tonerLevel: Int
    
    init (tonerLevel: Int = 100) {
        self.tonerLevel = max(min(tonerLevel, 100), 0)
    }

    
    var description: String {
        return "Nivel do toner: \(tonerLevel)%."
    }
}

var myPrinter = Printer()
print(myPrinter)
myPrinter.printDocument()
myPrinter.printImage()
print(myPrinter)
myPrinter.reloadToner()
print(myPrinter)
