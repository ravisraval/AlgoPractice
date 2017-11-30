# Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
#
# Calling next() will return the next smallest number in the BST.
#
# Note: next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator
    # @param {TreeNode} root
    def initialize(root)
        @root = root
        @in_order = []
        setup(root)
    end

    def setup(node)
        return if node.nil?
        setup(node.left) if node.left
        @in_order.push(node.val)
        setup(node.right) if node.right
    end

    # @return {Boolean}
    def has_next
        !@in_order.empty?
    end

    # @return {Integer}
    def next
        @in_order.shift if has_next
    end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end
