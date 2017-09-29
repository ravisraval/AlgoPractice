#
# Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
#
# For example:
# Given the following binary tree,
#    1            <---
#  /   \
# 2     3         <---
#  \     \
#   5     4       <---
# You should return [1, 3, 4].
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)

  return [] unless root

  res = []
  queue = [[root, 0]]
  until queue.empty?

    current_node, current_depth = queue.shift
    res[current_depth] = current_node.val

    queue.push([current_node.left, current_depth + 1]) if current_node.left
    queue.push([current_node.right, current_depth + 1]) if current_node.right
  end

res
end
