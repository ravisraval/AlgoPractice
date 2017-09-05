def dfs_poly_tree(root_node, target)
  return 'no tree' if !root_node

  stack = [root_node]

  until stack.empty?
    current_node = stack.pop
    return current_node.value if current_node.value == target
    current_node.children.each do |child|
      stack.push(child)
    end
  end

  return 'target not found in tree'
end


def bfs_poly_tree(root_node, target)
  return 'no tree' if !root_node

  queue = [root_node]

  until queue.empty?
    current_node = stack.shift

    current_node.valueif current_node.value == target
    current_node.children.each do |child|
      stack.push(child)
    end

  end

  return 'target not found in tree'
end
