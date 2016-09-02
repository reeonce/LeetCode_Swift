import Foundation

class IntegertoRoman {
    struct RomanNumber {
        let c: String
        let val: Int
        
        init(_ c: String, _ val: Int) {
            (self.c, self.val) = (c, val)
        }
    }
    
    
    let numbers: [RomanNumber] = [
        RomanNumber("M", 1000),
        RomanNumber("CM", 900),
        RomanNumber("D", 500),
        RomanNumber("CD", 400),
        RomanNumber("C", 100),
        RomanNumber("XC", 90),
        RomanNumber("L", 50),
        RomanNumber("XL", 40),
        RomanNumber("X", 10),
        RomanNumber("IX", 9),
        RomanNumber("V", 5),
        RomanNumber("IV", 4),
        RomanNumber("I", 1)
    ]
    
    func intToRoman(num: Int) -> String {
        guard num > 0 else {
            return "nulla"
        }
        
        guard num < 4000 else {
            return ""
        }

        var result = ""
        
        var num = num
        var i = 0
        while i < numbers.count {
            if num >= numbers[i].val {
                result += numbers[i].c
                num = num - numbers[i].val
            } else {
                i += 1
            }
        }
        
        return result
    }
    
    func romanToInt(s: String) -> Int {
        var s = s.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        guard s.characters.count > 0 else {
            return 0
        }
        
        var result = 0
        while s.characters.count > 0 {
            for num in numbers {
                if s.hasPrefix(num.c) {
                    result += num.val
                    s = s.substringFromIndex(s.startIndex.advancedBy(num.c.characters.count))
                }
            }
        }
        
        return result
    }
}