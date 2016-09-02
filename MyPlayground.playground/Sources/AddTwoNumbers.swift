import Foundation

/**
 * Definition for singly-linked list.
 */
public class AddTwoNumbers {
    public class ListNode: CustomStringConvertible {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        
        public var description: String {
            var s = "\(val)"
            
            var l = self
            while let _ = l.next {
                l = l.next!
                s += " -> \(l.val)"
            }
            return s
        }
    }
    
    func reverse(l: ListNode) -> ListNode {
        var front = l;
        let tail = l;
        while let next = tail.next {
            tail.next = next.next
            next.next = front
            front = next
        }
        
        return front;
    }
    
    func getSize(l: ListNode) -> Int {
        var size = 1;
        var next: ListNode? = l;
        while true {
            next = next?.next
            
            if next == nil {
                return size
            } else {
                size += 1
            }
        }
    }
    
    func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2;
        }
        
        guard let l2 = l2 else {
            return l1;
        }
        
        let s1 = getSize(l1)
        let s2 = getSize(l2)
        
        let g: Int
        let s: Int
        
        let r1: ListNode
        let r2: ListNode
        if (s1 > s2) {
            r1 = l1;
            r2 = l2;
            
            g = s1
            s = s2
        } else {
            r1 = l2
            r2 = l1;
            
            g = s2
            s = s1
        }
        
        let offset = g - s
        
        var start = r1
        
        var llll2: ListNode = r2
        var acc = 0;
        for _ in 0..<s {
            start.val = start.val + llll2.val + acc;
            
            if start.val >= 10 {
                start.val -= 10
                acc = 1;
            } else {
                acc = 0;
            }
            
            if llll2.next != nil {
                start = start.next!
                llll2 = llll2.next!
            }
        }
        
        if start.next != nil {
            start = start.next!
        }
        
        for _ in 0..<offset {
            start.val = start.val + acc;
            
            if start.val >= 10 {
                start.val -= 10
                acc = 1;
            } else {
                acc = 0;
            }
            
            if start.next != nil {
                start = start.next!
            }
        }
        
        if acc != 0 {
            start.next = ListNode(1)
        }
        
        return r1
    }
    
    func deleteDuplicates(head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        
        var node = head
        while (node?.next != nil) {
            let next = node?.next
            if (next?.val == node?.val) {
                node?.next = next?.next
            } else {
                node = next
            }
        }
        
        return head
    }
}