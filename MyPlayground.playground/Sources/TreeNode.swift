import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    
    public static func insert(o: TreeNode, _ node: TreeNode) -> TreeNode {
        guard node.val != o.val else {
            return o
        }
        
        if node.val < o.val {
            node.right = o
            return node
        }
        
        if let right = o.right {
            if right.val > node.val {
                node.right = right
                o.right = node
            } else {
                insert(right, node)
            }
        } else {
            o.right = node
        }
        return o
    }
    
    public static func preorder(o: TreeNode?) -> [TreeNode]? {
        guard o != nil else {
            return nil
        }
        
        var result = [TreeNode]()
        if let ls = preorder(o?.left) {
            result += ls
        }
        result += [TreeNode(o!.val)]
        if let rs = preorder(o?.right) {
            result += rs
        }
        return result
    }
    
    public static func flatten(root: TreeNode?) {
        guard root != nil else {
            return;
        }
        
        
        let preOrderedNodes = preorder(root)!
        var newRoot = preOrderedNodes.first!
        
        for node in preOrderedNodes {
            newRoot = insert(newRoot, node)
        }
        
        root?.val = newRoot.val
        root?.left = newRoot.left
        root?.right = newRoot.right
    }
}