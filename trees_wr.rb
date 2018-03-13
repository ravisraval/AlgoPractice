# Returns true if all values in the tree are the same
# false otherwise


# def is_unival(root)
#   return false if root.nil?
#   seen_value = root.val

#   node_queue = [root]

#   until node_queue.empty?
#     curr_node = node_queue.shift
#     if curr_node.val != seen_value
#       return false
#     end

#     node_queue.push(curr_node.left) if curr_node.left
#     node_queue.push(curr_node.right) if curr_node.right
#   end


#   true
# end

def is_unival(node, seen_value = nil)
  return true if node.nil?

  if seen_value.nil?
    seen_value = node.val
  else
    return false if node.val != seen_value
  end

  return false unless is_unival(node.left, seen_value)
  return false unless is_unival(node.right, seen_value)
  true

end

#       1
#     1   1
#    2 2
def unival_count(root)

  return [0, nil] if root.nil?

  if !root.left && !root.right
    return [1, root.val]
  end


  left_count, left_child_value = unival_count(root.left)
  right_count, right_child_value = unival_count(root.right)

  if left_child_value.nil? && right_child_value.nil?
    return [left_count + right_count, nil]
  end

  if root.val == left_child_value && root.val == right_child_value
    return [left_count + right_count + 1, root.val]
  end

  if root.val == left_child_value && root.right.nil?
    return [left_count + 1, root.val]
  end

  if root.val == right_child_value && root.left.nil?
    return [right_count + 1, root.val]
  end

  return [left_count + right_count, nil]


end

class Node
  attr_accessor :val
  attr_accessor :left
  attr_accessor :right

  def initialize(val, left, right)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(depth)
  return nil if depth < 1
  root = Node.new(1, nil, nil)
  return root if depth == 1
  build_tree_helper(depth - 1, [root])
  root
end

def build_tree_helper(depth, nodes)
  return if depth == 0

  new_level_nodes = []
  nodes.each do |node|
    new_val = depth == 1 ? 2 : 1
    new_node_left = Node.new(new_val, nil, nil)
    new_node_right = Node.new(new_val, nil, nil)
    node.left = new_node_left
    node.right = new_node_right

    new_level_nodes.push(new_node_left)
    new_level_nodes.push(new_node_right)
  end

  build_tree_helper(depth - 1, new_level_nodes)
end

def print_tree(root)
  return unless root
  print "#{root.val} "
  print_tree(root.left)
  print_tree(root.right)

end

root = build_tree(3)
#print_tree(root)
#unival = is_unival(root)
#puts unival ? "true\n" : "false\n"
puts unival_count(root)[0]
