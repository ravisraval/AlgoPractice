# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}

def inorder_traversal(root)
  results = []
  return results unless root #makes it work for input of []
  results += inorder_traversal(root.left) if root.left
  results << root.val
  results += inorder_traversal(root.right) if root.right
  results
end

a = TreeNode.new(3)
b = TreeNode.new(1)
c = TreeNode.new(5)
d = TreeNode.new(2)
e = TreeNode.new(4)
a.left = b
b.right = d
a.right = c
c.left = e

p inorder_traversal(a)
