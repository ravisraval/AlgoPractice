# Given a binary tree, return the tilt of the whole tree.
#
# The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.
#
# The tilt of the whole tree is defined as the sum of all nodes' tilt.
#
# Example:
# Input:
#          1
#        /   \
#       2     3
# Output: 1
# Explanation:
# Tilt of node 2 : 0
# Tilt of node 3 : 0
# Tilt of node 1 : |2-3| = 1
# Tilt of binary tree : 0 + 0 + 1 = 1
# Note:
#
# The sum of node values in any subtree won't exceed the range of 32-bit integer.
# All the tilt values won't exceed the range of 32-bit integer.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def find_tilt(root)
  return 0 if root.nil? || root.val.nil?
  left_sum, left_tilts = sub_sum(root.left)
  right_sum, right_tilts = sub_sum(root.right)
  left_tilts.concat(right_tilts.push((left_sum - right_sum).abs)).reduce(:+)
end


def sub_sum(node)
  return [0, []] if node.nil? || node.val.nil?
  left_sum, left_tilts = sub_sum(node.left)
  right_sum, right_tilts = sub_sum(node.right)
  [left_sum + right_sum + node.val,
   left_tilts.concat(right_tilts.push((left_sum - right_sum).abs))
 ]
end
