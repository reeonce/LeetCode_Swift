import Foundation

class ReverseInteger {
    func reverse(x: Int) -> Int {
        var r = 0
        
        var x0 = x < 0 ? -x : x
        while x0 > 0 {
            r = r * 10 + x0 % 10
            x0 = x0 / 10;
        }
        
        if r > Int(Int32.max) {
            r = 0
        }
        
        r = x < 0 ? -r : r
        
        return r;
    }
}