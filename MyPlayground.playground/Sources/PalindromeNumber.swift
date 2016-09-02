import Foundation

class PalindromeNumber {
    func isPalindrome(x: Int) -> Bool {
        func getDigitNum(i: Int) -> Int {
            var i = i
            var n = 1
            if (i >= 100000000){i /= 100000000; n += 8;}
            if (i >= 10000){i /= 10000; n += 4;}
            if (i >= 100){i /= 100; n += 2;}
            if (i >= 10){i /= 10; n += 1;}
            
            return n
        }
        
        func exp10(n: Int) -> Int {
            var r = 1
            for _ in 0..<n { r *= 10 }
            return r
        }
        
        func checkAndRemoveMiddleDigits(d: Int) -> (Bool, Int) {
            let n = getDigitNum(d)
            
            if n & 1 > 0 {
                let m = n / 2
                let tm = exp10(m)
                let bottom = d % tm
                return (true, d / (tm * 10) * tm + bottom)
            }
            
            let m = n / 2 - 1
            let tm = exp10(m)
            
            let top = d / tm
            let bottom = d % tm
            
            let r1 = top % 10
            let r2 = top / 10 % 10
            
            return (r1 == r2, top / 100 * tm + bottom)
        }
        
        if x < 0 {
            return false
        }
        
        var x = x
        while x >= 10 {
            let r = checkAndRemoveMiddleDigits(x)
            if !r.0 { return false }
            x = r.1
        }
        
        return true
    }
}