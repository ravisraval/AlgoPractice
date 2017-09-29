# Given the root of a binary tree, then value v and depth d, you need to add a row of nodes with value v at the given depth d. The root node is at depth 1.
#
# The adding rule is: given a positive integer depth d, for each NOT null tree nodes N in depth d-1, create two tree nodes with value v as N's left subtree root and right subtree root. And N's original left subtree should be the left subtree of the new left subtree root, its original right subtree should be the right subtree of the new right subtree root. If depth d is 1 that means there is no depth d-1 at all, then create a tree node with value v as the new root of the whole original tree, and the original tree is the new root's left subtree.
#
# Example 1:
# Input:
# A binary tree as following:
#        4
#      /   \
#     2     6
#    / \   /
#   3   1 5
#
# v = 1
#
# d = 2
#
# Output:
#        4
#       / \
#      1   1
#     /     \
#    2       6
#   / \     /
#  3   1   5
#
# Example 2:
# Input:
# A binary tree as following:
#       4
#      /
#     2
#    / \
#   3   1
#
# v = 1
#
# d = 3
#
# Output:
#       4
#      /
#     2
#    / \
#   1   1
#  /     \
# 3       1
# Note:
# The given d is in range [1, maximum depth of the given tree + 1].
# The given binary tree has at least one tree node.



# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {Integer} v
# @param {Integer} d
# @return {TreeNode}
def add_one_row(root, v, d)

  stack_queue = [[root, 1]]

  if d == 1
    new_root = TreeNode.new(v)
    new_root.left = root
    return new_root
  end

  until stack_queue.empty?
    current_node, current_depth = stack_queue.shift

    if current_depth == d - 1
      add_row(current_node, v)
    end

    stack_queue.push([current_node.left, current_depth + 1]) if current_node.left
    stack_queue.push([current_node.right, current_depth + 1]) if current_node.right
  end

  root

end

def add_row(current_node, v)
  old_left = current_node.left if current_node.left
  old_right = current_node.right if current_node.right

  current_node.left = TreeNode.new(v)
  current_node.left.left = old_left

  current_node.right = TreeNode.new(v)
  current_node.right.right = old_right

end
