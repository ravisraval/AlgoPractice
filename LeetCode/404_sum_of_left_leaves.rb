# Find the sum of all left leaves in a given binary tree.
#
# Example:
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
#
# There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root)
    return 0 if root.nil?
    node_stack = [root]
    sum = 0
    until node_stack.empty?
        node = node_stack.pop

        if node.left && !node.left.left && !node.left.right
            sum += node.left.val
        else
            node_stack.push(node.left) if node.left
        end
        node_stack.push(node.right) if node.right
    end

    sum
end
