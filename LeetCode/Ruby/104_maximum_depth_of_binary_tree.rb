# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

def max_depth(root)

  node_stack = [[root, 1]]
  highest_depth_seen = 1
  until node_stack.empty?
    current_node, current_depth = node_stack.pop
    highest_depth_seen = current_depth if current_depth > highest_depth_seen

    node_stack.push([current_node.left, current_depth + 1]) if current_node.left
    node_stack.push([current_node.right, current_depth + 1]) if current_node.right

  end
  highest_depth_seen

end
