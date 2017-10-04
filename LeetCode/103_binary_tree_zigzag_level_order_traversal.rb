# Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its zigzag level order traversal as:
# [
#   [3],
#   [20,9],
#   [15,7]
# ]
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end
#bfs, just reverse on odds
def zigzag_level_order(root)
  res = []

  return [] if root.nil?

  node_queue = [[root, 0]]

  until node_queue.empty?

    current_node, current_depth = node_queue.shift

    res[current_depth] = [] unless res[current_depth]

    if current_depth.even?
      res[current_depth].push(current_node.val)
    else
      res[current_depth].unshift(current_node.val)
    end

    node_queue.push([current_node.left, current_depth + 1]) if current_node.left
    node_queue.push([current_node.right, current_depth + 1]) if current_node.right
  end

  res
end
