public class TwoSum {
    public static func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int?](minimumCapacity: nums.count);
        for i in 0..<nums.count {
            dict[nums[i]] = i;
        }
        
        for i in 0..<nums.count {
            if let j = dict[target - nums[i]] where j >= 0 && i != j {
                return [i, j!]
            }
        }
        
        return []
    }
}