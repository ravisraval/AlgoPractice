# Write a function to check that a binary tree ↴ is a valid binary search tree. ↴

require_relative 'binary_search_node'

def valid_bst_bfs?(root)
  node_queue = []
  node_queue.push([root, nil, nil])

  until node_queue.empty?
    node, min, max = node_queue.shift

    #testing current node
    if min.nil? && max.nil?
    elsif min.nil?
      return false if node.value >= max
    elsif max.nil?
      return false if node.value <= min
    elsif node.value <= min || node.value >= max
      return false
    end

    node_queue.push([node.left, min, node.value]) if node.left
    node_queue.push([node.right, node.value, max]) if node.right
  end

  true
end

def refactored_valid_bst_bfs?(root)
  node_queue = []
  node_queue.push([root, -Float::INFINITY, Float::INFINITY])

  until node_queue.empty?
    node, min, max = node_queue.shift

    #testing current node
    if node.value <= min || node.value >= max
      return false
    end

    node_queue.push([node.left, min, node.value]) if node.left
    node_queue.push([node.right, node.value, max]) if node.right
  end

  true
end

right_child3 = BinaryTreeNode.new(12, nil, nil)
left_child3 = BinaryTreeNode.new(7, nil, nil)

right_child2 = BinaryTreeNode.new(4, nil, nil)
left_child2 = BinaryTreeNode.new(1, nil, nil)

right_child1 = BinaryTreeNode.new(10, left_child3, right_child3)
left_child1 = BinaryTreeNode.new(3, left_child2, right_child2)

root = BinaryTreeNode.new(5, left_child1, right_child1)



p valid_bst_bfs?(root)
