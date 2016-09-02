//
//  leetcode.swift
//  
//
//  Created by Reeonce on 7/28/16.

// idea: 
//  for each number i,
//  define x as the smallest power of two that equals to or larger than i;
//  if i == x; bits[i] = 1;
//  else bits[i] = bits[i - (x >> 1)] + 1
//
//

import Foundation

public class LeetCode {
    public init() {
        cache = [:];
    }
    
    public func reverseString(s: String) -> String {
        return String(s.characters.reverse());
    }
    
    public func countBits(num: Int) -> [Int] {
        guard num > 0 else {
            return [0]
        }
        
        var bits = Array<Int>(count: num + 1, repeatedValue: 0)
        var x = 1
        for i in 1...num {
            if i == x {
                x = x << 1
                bits[i] = 1
            } else {
                bits[i] = bits[i - (x >> 1)] + 1;
            }
        }
        
        return bits;
    }
    
    
    func combEquals(a: [Int], b: [Int]) -> Bool {
        if a.count != b.count {
            return false;
        }
        
        let s1 = a.sort()
        let s2 = b.sort()
        
        for i in 0..<s1.count {
            if s1[i] != s2[i] {
                return false;
            }
        }
        
        return true;
    }
    
    var cache:[Int:Array<Array<Int>>];
    
    public func doCombinationSum(candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return [];
        }
        
        if let r = cache[target] {
            return r;
        }
        
        var results: [[Int]] = [];
        
        for c in candidates {
            var tResult: [[Int]] = [];
            
            if target < c {
                tResult = [];
            } else if c == target {
                tResult = [[c]];
            } else {
                tResult = doCombinationSum(candidates, target - c).flatMap({ var r = $0; r.append(c); return r.sort(); });
            }
            
            results.appendContentsOf(tResult);
        }
        
        results.sortInPlace { (a, b) -> Bool in
            for i in 0..<a.count {
                if i >= b.count {
                    return false;
                }
                
                if a[i] != b[i] {
                    return a[i] < b[i];
                }
            }
            
            return true;
        }
        
        var lastI = results.count - 1;
        while lastI > 0 {
            if combEquals(results[lastI], b: results[lastI - 1]) {
                results.removeAtIndex(lastI);
            }
            lastI -= 1;
        }
        
        cache[target] = results;
        
        return results;
    }
    
    public func combinationSum(candidates: [Int], _ target: Int) -> [[Int]] {
        cache = [:];
        
        return doCombinationSum(candidates, target);
    }
}