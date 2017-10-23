# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]
def level_order(root)
    return [] if root.nil?
    node_queue = [[root, 0]]
    levels = []

    until node_queue.empty?

        current_node, depth = node_queue.shift

        if levels[depth].nil?
            levels[depth] = [current_node.val]
        else
            levels[depth].push(current_node.val)
        end

        node_queue.push([current_node.left, depth + 1]) if current_node.left
        node_queue.push([current_node.right, depth + 1]) if current_node.right
    end

    levels

end
