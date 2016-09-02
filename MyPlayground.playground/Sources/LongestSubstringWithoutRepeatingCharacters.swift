import Foundation

class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(s: String) -> Int {
        
        let length = s.characters.count
        guard length > 0 else {
            return 0
        }
        
        var lengths = [Int](count: length, repeatedValue: 0)
        var charIndexes = [Character:Int]()
        
        var m = 1
        for (i, c) in s.characters.enumerate() {
            var length = 1
            
            let previousIndex = charIndexes[c]
            if previousIndex == nil {
                length = i + 1
            } else {
                length = i - previousIndex!
            }
            
            if i > 0 {
                length = min(length, lengths[i - 1] + 1)
            }
            
            
            charIndexes[c] = i
            lengths[i] = length
            
            m = max(m, length)
        }
        
        return m;
    }
}