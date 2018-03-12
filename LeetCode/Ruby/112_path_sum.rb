# Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
#
# For example:
# Given the below binary tree and sum = 22,
#               5
#              / \
#             4   8
#            /   / \
#           11  13  4
#          /  \      \
#         7    2      1
# return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.


class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


def has_path_sum(root, sum)
  return false if root.nil?
  node_stack = [[root, 0]]

  until node_stack.empty?
    current_node, current_sum = node_stack.pop
    new_sum = current_sum + current_node.val

    if !current_node.left && !current_node.right
      return true if new_sum == sum
    else
      node_stack.push([current_node.left, new_sum]) if current_node.left
      node_stack.push([current_node.right, new_sum]) if current_node.right
    end
  end
  false
end
