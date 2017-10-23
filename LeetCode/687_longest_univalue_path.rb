# Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
#
# Note: The length of path between two nodes is represented by the number of edges between them.
#
# Example 1:
#
# Input:
#
#               5
#              / \
#             4   5
#            / \   \
#           1   1   5
# Output:
#
# 2
# Example 2:
#
# Input:
#
#               1
#              / \
#             4   5
#            / \   \
#           4   4   5
# Output:
#
# 2
# Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.


def longest_univalue_path(root)

  #bfs, when hit a node, go down

  return 0 if root.nil?

  best_length = 0
  node_queue = [root]
  until node_queue.empty?
    current_node = node_queue.shift
    next if current_node.val = "v"

    current_length = determine_length(current_node)
    best_length = current_length if best_length < current_length

    node_queue.push(current_node.left) if current_node.left
    node_queue.push(current_node.right) if current_node.right
  end
  best_length
end

def determine_length(node)
  value = node.val
  length = 0
  node_queue = [node]
  until node_queue.empty?
    current_node = node_queue.shift

    if current_node.left && current_node.left.value == value
      length += 1
      node_queue.push(current_node.left)
    end
    if current_node.right && current_node.right.value == value
      length += 1
      node_queue.push(current_node.right)
    end
  end
  length
end








end
