# Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.
#
# The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.
#
# Example 1:
# Input:
#
#            1
#          /   \
#         3     2
#        / \     \
#       5   3     9
#
# Output: 4
# Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).
# Example 2:
# Input:
#
#           1
#          /
#         3
#        / \
#       5   3
#
# Output: 2
# Explanation: The maximum width existing in the third level with the length 2 (5,3).
# Example 3:
# Input:
#
#           1
#          / \
#         3   2
#        /
#       5
#
# Output: 2
# Explanation: The maximum width existing in the second level with the length 2 (3,2).
# Example 4:
# Input:
#
#           1
#          / \
#         3   2
#        /     \
#       5       9
#      /         \
#     6           7
# Output: 8
# Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).
#
#
# Note: Answer will in the range of 32-bit signed integer.
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
def width_of_binary_tree(root)
    return 0 if root.nil?
    #node, depth, level pos
    node_queue = [[root, 0, 0]]
    levels = []

    until node_queue.empty?
        node, depth, pos = node_queue.shift

        if levels[depth]
            levels[depth][1] = (pos)
        else
            levels[depth] = [pos]
        end

        node_queue.push([node.left, depth + 1, pos * 2]) if node.left
        node_queue.push([node.right, depth + 1, pos * 2 + 1]) if node.right
    end
    max = 0
    levels.each do |level|
        next if level.length == 1
        if level[1] - level[0] > max
            max = level[1] - level[0]
        end
    end
    max + 1

end
