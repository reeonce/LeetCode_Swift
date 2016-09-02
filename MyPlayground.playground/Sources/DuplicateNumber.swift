import Foundation

public class DuplicateNumber {
    public init() { }
    
    public func findDuplicate(nums: [Int]) -> Int {
        let n = nums.count - 1;
        var p = 1;
        while p < n {
            p <<= 1
        }
        
        var result = 0
        for i in 0...n {
            result ^= nums[i];
        }
        
        for i in n..<p {
            result ^= i;
        }
        
        return result;
    }
}