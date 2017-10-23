# Given a binary tree, find its minimum depth.
#
# The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.


def min_depth(root)
    return 0 if root.nil?

    node_stack = [[root, 1]]
    shortest_path_seen = nil
    until node_stack.empty?
        current_node, current_depth = node_stack.pop

        if !current_node.left && !current_node.right
            if shortest_path_seen.nil? || current_depth < shortest_path_seen
                shortest_path_seen = current_depth
            end
        else
            node_stack.push([current_node.left, current_depth + 1]) if current_node.left
            node_stack.push([current_node.right, current_depth + 1]) if current_node.right
        end
    end
    shortest_path_seen
end
