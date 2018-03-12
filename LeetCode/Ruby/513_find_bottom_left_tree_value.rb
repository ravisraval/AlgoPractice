# HintsSubmissionsDiscussSolution
# Discuss Pick One
# Given a binary tree, find the leftmost value in the last row of the tree.
#
# Example 1:
# Input:
#
#     2
#    / \
#   1   3
#
# Output:
# 1
# Example 2:
# Input:
#
#         1
#        / \
#       2   3
#      /   / \
#     4   5   6
#        /
#       7
#
# Output:
# 7
# Note: You may assume the tree (i.e., the given root node) is not NULL.

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
def find_bottom_left_value(root)
    return nil if root.nil?
    node_queue = [[root, 0]]
    latest_depth = -1
    latest_val = root.val

    until node_queue.empty?
        node, depth = node_queue.shift

        if depth > latest_depth
            latest_depth = depth
            latest_val = node.val
        end

        node_queue.push([node.left, depth + 1]) if node.left
        node_queue.push([node.right, depth + 1]) if node.right
    end
    latest_val
end
