# Invert a binary tree.
#
#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# to
#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1
# Trivia:
# This problem was inspired by this original tweet by Max Howell:
# Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so fuck off.
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree_recur(root)
  return nil if root.nil?
  root.right, root.left = root.left, root.right
  invert_tree(root.left) if root.left
  invert_tree(root.right) if root.right
  root
end

def invert_tree_iter(root)
  return nil if root.nil?

  node_queue = [root]

  until node_queue.empty?
    current_node = node_queue.shift
    current_node.left, current_node.right = current_node.right, current_node.left

    node_queue.push(current_node.left) if current_node.left
    node_queue.push(current_node.right) if current_node.right
  end
  root
end
