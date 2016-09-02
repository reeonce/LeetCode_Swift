import Foundation

class ContainerWithMostWater {
    func maxArea(height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }
        
        var i = 0
        var j = height.count - 1
        
        var area = 0
        
        while i < j {
            area = max(area, min(height[i], height[j]) * (j - i))
            
            if height[i] > height[j] {
                while j > i && height[j - 1] < height[j] {
                    j -= 1
                }
                
                j -= 1
            } else {
                while j > i && height[i + 1] < height[i] {
                    i += 1
                }
                
                i += 1
            }
        }
        
        return area
    }
}