import UIKit

enum Currency {
    case cad
    case mxn
}

let usToCad = 1.45
let usToMxn = 24.06

var currency: Currency = .cad

func convert(_ dollars: Double) -> Double {
    if currency == .cad {
        return dollars * usToCad
    } else {
        return dollars * usToMxn
    }
}

func convert(amountString: String) -> String? {
    let amount = Double(amountString)
    guard let newAmount = amount else {
        print("\(amountString) is not a valid amount")
        return ""
    }
    
    return String(convert(newAmount))
}

convert(amountString: "45")
convert(amountString: "Treefiddy")
convert(amountString: "33")

currency = .mxn
convert(amountString: "45")
convert(amountString: "Treefiddy")
convert(amountString: "33")

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

currencyFormatter.string(from: NSNumber(value: convert(45)))
currencyFormatter.string(from: NSNumber(value: convert(33)))

currency = .cad
currencyFormatter.string(from: NSNumber(value: convert(45)))
currencyFormatter.string(from: NSNumber(value: convert(33)))
