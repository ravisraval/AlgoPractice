require_relative 'binary_node'

def in_order_traversal(node)
  in_order_traversal(node.left) if node.left
  puts node.value #or however we define visiting this node
  in_order_traversal(node.right) if node.right
end


def pre_order_traversal(node)
  puts node.value
  pre_order_traversal(node.left) if node.left
  pre_order_traversal(node.right) if node.right
end

def post_order_traversal(node)
  post_order_traversal(node.left) if node.left
  post_order_traversal(node.right) if node.right
  puts node.value
end


a = BinaryTreeNode.new(5)
b = BinaryTreeNode.new(3)
c = BinaryTreeNode.new(7)
d = BinaryTreeNode.new(2)
e = BinaryTreeNode.new(4)
f = BinaryTreeNode.new(6)
g = BinaryTreeNode.new(8)

a.left = b
a.right = c

b.left = d
b.right = e

c.left = f
c.right = g

puts "IN ORDER"
in_order_traversal(a)
puts "PRE ORDER"
pre_order_traversal(a)
puts "POST ORDER"
post_order_traversal(a)
