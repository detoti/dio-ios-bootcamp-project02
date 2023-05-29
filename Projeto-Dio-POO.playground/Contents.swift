import UIKit

class Printer {
    var toner: Int
    
    init(toner: Int = 100) {
        self.toner = max(min(toner, 100), 0)
    }
    
    func printing(option: PrintOption) {
        switch option {
        case .text:
            print("O documento de texto foi impresso.")
            toner -= 20
        case .image:
            print("O documento de imagem foi impresso.")
            toner -= 30
        }
        
    }
    
    func tonerLevel() {
        print("Nivel do toner: \(toner)%.")
    }
    
    func reloadToner() {
        toner = 100
        print("O toner foi recarregado. Nivel atual: \(toner)%")
    }
}

enum PrintOption {
    case text
    case image
}

let myPrinter = Printer()
myPrinter.tonerLevel()
myPrinter.printing(option: .text)
myPrinter.printing(option: .image)
myPrinter.tonerLevel()
myPrinter.reloadToner()
myPrinter.tonerLevel()


