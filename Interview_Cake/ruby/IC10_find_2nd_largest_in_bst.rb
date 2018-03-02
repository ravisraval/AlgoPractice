require_relative 'binary_search_node'

def find_2nd_largest_in_bst(root)
  current_node = root

  if current_node.right.nil? && current_node.left
    current_node = current_node.left
    until current_node.right.nil?
      current_node = current_node.right
    end
    return current_node.value
  end

  until current_node.right.right.nil?
    current_node = current_node.right
  end

  if current_node.right.left
    current_node = current_node.right.left
    until current_node.right.nil?
      current_node = current_node.right
    end
    return current_node.value
  else
    current_node.value
  end
end


right_child3 = BinaryTreeNode.new(12, nil, nil)
left_child3 = BinaryTreeNode.new(7, nil, nil)

right_child2 = BinaryTreeNode.new(4, nil, nil)
left_child2 = BinaryTreeNode.new(1, nil, nil)

right_child1 = BinaryTreeNode.new(10, left_child3, right_child3)
left_child1 = BinaryTreeNode.new(3, left_child2, right_child2)

root = BinaryTreeNode.new(5, left_child1, right_child1)

p find_2nd_largest_in_bst(root)
