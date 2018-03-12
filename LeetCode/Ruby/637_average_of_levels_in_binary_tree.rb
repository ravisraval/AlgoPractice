# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
#
# Example 1:
# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
# Output: [3, 14.5, 11]
# Explanation:
# The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
# Note:
# The range of node's value is in the range of 32-bit signed integer.
# # Definition for a binary tree node.
# # class TreeNode
# #     attr_accessor :val, :left, :right
# #     def initialize(val)
# #         @val = val
# #         @left, @right = nil, nil
# #     end
# # end
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Float[]}
def average_of_levels(root)
    return [] if root.nil?

  levels = []

  queue = [[root, 0]]

  until queue.empty?
    node, level = queue.shift

    if levels[level]
      levels[level].push(node.val)
    else
      levels[level] = [node.val]
    end

    queue.push([node.left, level + 1]) if node.left
    queue.push([node.right, level + 1]) if node.right

  end

  levels.map do |level|
    count = level.length
    level.reduce(:+).fdiv(count)
  end

end
