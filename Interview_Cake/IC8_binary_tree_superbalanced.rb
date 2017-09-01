require_relative 'binary_search_node'

def superbalanced_dfs?(root)
  depths = []
  node_stack = []
  node_stack.push([root, 0])

  until node_stack.empty?
    node, depth = node_stack.pop

    # if leaf
    if !node.left && !node.right

      depths.push(depth) unless depths.include?(depth)

      if depths.length > 2 ||
        (depths.length == 2) && ((depths[0] - depths[1]).abs > 1)
        return false
      end

    else
      node_stack.push([node.right, depth + 1]) if node.right
      node_stack.push([node.left, depth + 1]) if node.left
    end
  end

  true
end

def superbalanced_bfs?(root)
  depths = []
  node_queue = []
  node_queue.push([root, 0])

  until node_queue.empty?
    node, depth = node_queue.shift

    # if leaf
    if !node.left && !node.right

      depths.push(depth) unless depths.include?(depth)

      if depths.length > 2 ||
        (depths.length == 2) && ((depths[0] - depths[1]).abs > 1)
        return false
      end

    else
      node_queue.push([node.left, depth + 1]) if node.left
      node_queue.push([node.right, depth + 1]) if node.right
    end
  end

  true
end
