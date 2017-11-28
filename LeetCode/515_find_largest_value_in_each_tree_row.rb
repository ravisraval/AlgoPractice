# You need to find the largest value in each row of a binary tree.
#
# Example:
# Input:
#
#           1
#          / \
#         3   2
#        / \   \
#       5   3   9
#
# Output: [1, 3, 9]

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
    return [] if root.nil?
    levels = []

    node_queue = [[root, 0]]

    until node_queue.empty?

        node, depth = node_queue.shift

        if levels[depth].nil? || node.val > levels[depth]
            levels[depth] = node.val
        end

        node_queue.push([node.left, depth + 1]) if node.left
        node_queue.push([node.right, depth + 1]) if node.right
    end
    levels
end
