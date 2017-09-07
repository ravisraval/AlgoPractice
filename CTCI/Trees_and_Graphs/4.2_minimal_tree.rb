#given a sorted (ascending) array with unique integer elements,
#write an algo to create a binary search tree with minimal height

require_relative 'binary_node'
# require 'byebug'
def make_minimal_tree(arr)
  # debugger
  mid_node = BinaryTreeNode.new(arr[arr.length / 2])
  return if arr.empty?
  mid_node.left = make_minimal_tree(arr[0...arr.length/2])
  mid_node.right = make_minimal_tree(arr[arr.length/2 + 1..-1])

  return mid_node
end

arr = [1,2,3,4,5]
p make_minimal_tree(arr)
