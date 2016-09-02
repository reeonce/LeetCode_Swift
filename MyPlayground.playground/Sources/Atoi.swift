import Foundation

class Atoi {
    func char2Int(c: Character) -> Int {
        switch c {
        case "0":
            return 0
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        default:
            return 0
        }
    }
    
    func myAtoi(str: String) -> Int {
        let str = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let length = str.characters.count
        
        guard length > 0 else {
            return 0
        }
        
        var minusSymbol = false
        
        var i = 0;
        if str[str.startIndex] == "-" {
            minusSymbol = true
            i = 1
        }
        if str[str.startIndex] == "+" {
            i = 1
        }
        
        var result = 0
        for j in i..<length {
            let c = str[str.startIndex.advancedBy(j)]
            
            if c < "0" || c > "9" {
                break;
            }
            
            result = result * 10 + char2Int(c)
            
            if result > Int(Int32.max) {
                return minusSymbol ? Int(Int32.min) : Int(Int32.max)
            }
        }
        
        return minusSymbol ? -result : result
    }
}